import 'package:bloc_base_app/app/di/injection.dart';
import 'package:bloc_base_app/domain/blocs/login/login_bloc.dart';
import 'package:bloc_base_app/domain/blocs/login/login_events.dart';
import 'package:bloc_base_app/domain/blocs/login/login_states.dart';
import 'package:bloc_base_app/resources/colors_manager.dart';
import 'package:bloc_base_app/resources/values_manager.dart';
import 'package:bloc_base_app/utils/size_utils.dart';
import 'package:bloc_base_app/widgets/custom_elevated_button.dart';
import 'package:bloc_base_app/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginBloc _loginBloc;

  @override
  void initState() {
    super.initState();
    _loginBloc = LoginBloc(authRepository: locator());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0.0),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.0.h, vertical: 16.0.v),
        child: BlocProvider(
          create: (_) => _loginBloc,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                BlocBuilder<LoginBloc, LoginStates>(
                  buildWhen: (previous, current) => previous.email != current.email,
                  builder: (context, state) => CustomTextFormField(
                    labelText: "Email Address",
                    hintText: "Enter email address",
                    textInputType: TextInputType.emailAddress,
                    onChanged: (value) {
                      context.read<LoginBloc>().add(EmailChanged(email: value));
                    },
                    prefix: HeroIcon(
                      HeroIcons.envelope,
                      style: HeroIconStyle.outline,
                      color: ColorsManager.textFormFieldPrefixColor,
                      size: SizesManager.textFormFieldPrefixSize,
                    ),
                    context: context,
                  ),
                ),
                SizedBox(height: 16.v),
                BlocBuilder<LoginBloc, LoginStates>(
                  buildWhen: (previous, current) => previous.password != current.password,
                  builder: (context, state) => CustomTextFormField(
                    labelText: "Password",
                    hintText: "Enter password",
                    textInputType: TextInputType.text,
                    obscureText: context.watch<LoginBloc>().state.isPasswordHidden,
                    onChanged: (value) {
                      context.read<LoginBloc>().add(PasswordChanged(password: value));
                    },
                    prefix: HeroIcon(
                      HeroIcons.lockClosed,
                      style: HeroIconStyle.outline,
                      color: ColorsManager.textFormFieldPrefixColor,
                      size: SizesManager.textFormFieldPrefixSize,
                    ),
                    suffix: InkWell(
                      onTap: () => context.read<LoginBloc>().add(const TogglePasswordVisibility()),
                      child: HeroIcon(
                        context.watch<LoginBloc>().state.isPasswordHidden ? HeroIcons.eye : HeroIcons.eyeSlash,
                        style: HeroIconStyle.outline,
                        color: ColorsManager.textFormFieldPrefixColor,
                        size: SizesManager.textFormFieldPrefixSize,
                      ),
                    ),
                    context: context,
                  ),
                ),
                SizedBox(height: 32.v),
                BlocBuilder<LoginBloc, LoginStates>(
                  builder: (context, state) {
                    if (state.loginStatus == LoginStatus.error) {
                      debugPrint('LoginScreen: Error: ${state.user!.message}');
                    }
                    if (state.loginStatus == LoginStatus.loading) {
                      debugPrint('LoginScreen: Loading');
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (state.loginStatus == LoginStatus.success) {
                      debugPrint('LoginScreen: User: ${state.user!.data.name}');
                    }
                    return CustomElevatedButton(
                      context: context,
                      isDisabled: state.email.isEmpty || state.password.isEmpty,
                      text: "Login",
                      onPressed: () {
                        context.read<LoginBloc>().add(const LoginSubmitted());
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
