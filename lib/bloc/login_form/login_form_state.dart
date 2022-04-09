part of 'login_form_bloc.dart';

class LoginFormState extends Equatable {
  const LoginFormState({
    this.status = FormzStatus.pure,
    this.username = const Username.pure(),
    this.password = const Password.pure(),
  });

  final FormzStatus status;
  final Username username;
  final Password password;

  LoginFormState copyWith({
    FormzStatus? status,
    Username? username,
    Password? password,
  }) {
    return LoginFormState(
      status: status ?? this.status,
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  @override
  List<Object> get props => [status, username, password];
}
