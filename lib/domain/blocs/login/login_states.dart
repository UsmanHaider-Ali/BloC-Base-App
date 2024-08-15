import 'package:bloc_base_app/domain/models/user/user_model.dart';
import 'package:equatable/equatable.dart';

enum LoginStatus { initial, loading, success, error }

class LoginStates extends Equatable {
  final String email;
  final String password;
  final bool isPasswordHidden;
  final LoginStatus loginStatus;
  final UserModel? user;

  const LoginStates({
    this.email = '',
    this.password = '',
    this.isPasswordHidden = true,
    this.loginStatus = LoginStatus.initial,
    this.user,
  });

  LoginStates copyWith({
    String? email,
    String? password,
    bool? isPasswordHidden,
    LoginStatus? loginStatus,
    String? errorMessage,
    UserModel? user,
  }) {
    return LoginStates(
      email: email ?? this.email,
      password: password ?? this.password,
      isPasswordHidden: isPasswordHidden ?? this.isPasswordHidden,
      loginStatus: loginStatus ?? this.loginStatus,
      user: user ?? this.user,
    );
  }

  @override
  List<Object?> get props => [email, password, isPasswordHidden, loginStatus, user];
}
