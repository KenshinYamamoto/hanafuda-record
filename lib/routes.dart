import 'package:flutter/material.dart';

import 'package:hanafuda_record/screens/home.dart';
import 'package:hanafuda_record/screens/login.dart';

class Routes {
  static const String login = '/login';
  static const String home = '/home';

  static final routes = {
    login: (BuildContext context) => const LoginPage(),
    home: (BuildContext context) => const HomePage(),
  };
}
