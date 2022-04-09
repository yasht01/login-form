import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBlocObserver extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print('${bloc.runtimeType} -> $transition');
  }
}
