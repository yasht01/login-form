import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user_repository/user_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required this.authenticationRepository,
    required this.userRepository,
  }) : super(const AuthState.unknown()) {
    on<AuthStatusChanged>(_onAuthStateChanged);
    on<AuthLogoutRequested>(_onAuthLogoutRequested);
    _authreposubscription = authenticationRepository.status.listen(
      (event) => add(
        AuthStatusChanged(event),
      ),
    );
  }

  @override
  Future<void> close() {
    _authreposubscription.cancel();
    authenticationRepository.dispose();
    return super.close();
  }

  final AuthenticationRepository authenticationRepository;
  late StreamSubscription _authreposubscription;
  final UserRepository userRepository;

  Future<void> _onAuthStateChanged(
    AuthStatusChanged event,
    Emitter<AuthState> emit,
  ) async {
    switch (event.status) {
      case AuthenticationStatus.authenticated:
        final user = await _tryGetUser();
        if (user != null) {
          emit(AuthState.authenticated(user));
        } else {
          emit(const AuthState.unauthenticated());
        }
        break;
      case AuthenticationStatus.unauthenticated:
        emit(const AuthState.unauthenticated());
        break;
      default:
        emit(const AuthState.unknown());
        break;
    }
  }

  void _onAuthLogoutRequested(
    AuthLogoutRequested event,
    Emitter<AuthState> emit,
  ) {
    authenticationRepository.logOut();
  }

  Future<User?> _tryGetUser() async {
    User? _user;
    try {
      _user = await userRepository.getUser();
    } catch (_) {
      return null;
    }
    return _user;
  }
}
