import 'package:uuid/uuid.dart';

import 'models/user.dart';

class UserRepository {
  User? _user;

  Future<User?> getUser() async {
    if (_user != null) return _user;
    await Future.delayed(
      const Duration(seconds: 1),
      () => _user = User(id: const Uuid().v4()),
    );
    return _user;
  }
}
