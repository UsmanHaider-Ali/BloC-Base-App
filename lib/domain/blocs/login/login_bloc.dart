import 'package:bloc/bloc.dart';
import 'package:bloc_base_app/domain/blocs/login/login_events.dart';
import 'package:bloc_base_app/domain/blocs/login/login_states.dart';
import 'package:bloc_base_app/data/repositories/auth/auth_repository.dart';
import 'package:bloc_base_app/domain/models/user/user_model.dart';
import 'package:flutter/material.dart';

class LoginBloc extends Bloc<LoginEvents, LoginStates> {
  final AuthRepository authRepository;

  LoginBloc({required this.authRepository}) : super(const LoginStates()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_passwordChanged);
    on<LoginSubmitted>(_onLoginSubmitted);
    on<TogglePasswordVisibility>(_togglePasswordVisibility);
  }

  void _onEmailChanged(EmailChanged event, Emitter<LoginStates> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _passwordChanged(PasswordChanged event, Emitter<LoginStates> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _togglePasswordVisibility(TogglePasswordVisibility event, Emitter<LoginStates> emit) {
    emit(state.copyWith(isPasswordHidden: !state.isPasswordHidden));
  }

  void _onLoginSubmitted(LoginSubmitted event, Emitter<LoginStates> emit) async {
    emit(state.copyWith(loginStatus:LoginStatus.loading));

    try {
      final response = await authRepository.login(body: {'email': state.email, 'password': state.password});
      debugPrint('LoginBloc: Value : $response');

      final user = UserModel.fromJson(response);

      if (response['success']) {
        emit(state.copyWith(loginStatus: LoginStatus.success, user: user));
      } else {
        emit(state.copyWith(loginStatus: LoginStatus.error, errorMessage: response['message'] ?? 'An unknown error occurred'));
      }
    } catch (e) {
      emit(state.copyWith(loginStatus: LoginStatus.error, errorMessage: 'An unknown error occurred'));
    }
  }
}
