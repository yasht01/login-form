part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

/// Internal Event. Used to send states to UI on Auth Repository changes.
class AuthStatusChanged extends AuthEvent {
  const AuthStatusChanged(this.status);

  final AuthenticationStatus status;

  @override
  List<Object> get props => [status];
}

/// Indicate the user requests to logout.
class AuthLogoutRequested extends AuthEvent {
  const AuthLogoutRequested();
}