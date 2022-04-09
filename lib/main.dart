import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_app/login_bloc_observer.dart';
import 'package:user_repository/user_repository.dart';

import 'app.dart';

void main() {
  BlocOverrides.runZoned(
    () => runApp(
      AppWidget(
        authenticationRepository: AuthenticationRepository(),
        userRepository: UserRepository(),
      ),
    ),
    blocObserver: LoginBlocObserver(),
  );
}
