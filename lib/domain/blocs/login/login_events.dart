import 'package:equatable/equatable.dart';

abstract class LoginEvents extends Equatable {
  const LoginEvents();

  @override
  List<Object> get props => [];
}

class EmailChanged extends LoginEvents {
  final String email;

  const EmailChanged({required this.email});

  @override
  List<Object> get props => [email];
}

class PasswordChanged extends LoginEvents {
  final String password;

  const PasswordChanged({required this.password});

  @override
  List<Object> get props => [password];
}

class TogglePasswordVisibility extends LoginEvents {
  const TogglePasswordVisibility();

  @override
  List<Object> get props => [];
}

class LoginSubmitted extends LoginEvents {
  const LoginSubmitted();

  @override
  List<Object> get props => [];
}
