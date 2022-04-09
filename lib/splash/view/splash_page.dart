import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  static Route route() => MaterialPageRoute(
        builder: (_) => const SplashPage(),
      );

  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
