import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:yozu/auth/login_screen.dart';
import 'package:yozu/auth/otp_screen.dart';
import 'package:yozu/screens/dashboard.dart';
import 'package:yozu/screens/profile_details_screen.dart';
import 'auth/sign_up_screen.dart';

class CustomRoutes {
  static Route<dynamic> allRoutes(RouteSettings settings) {
    switch (settings.name) {

      case LoginScreen.routeName:
        return MaterialPageRoute(builder: (context) => LoginScreen());
        break;

      case OtpScreen.routeName:
        return MaterialPageRoute(builder: (context) => OtpScreen());
        break;

      case SignUpPage.routeName:
        return MaterialPageRoute(builder: (context) => SignUpPage());
        break;

      case ProfileDetailsScreen.routeName:
        return MaterialPageRoute(builder: (context) => ProfileDetailsScreen());
        break;

      case Dashboard.routeName:
        return MaterialPageRoute(builder: (context) => Dashboard());
        break;

    }
  }
}
