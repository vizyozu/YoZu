import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:yozu/screens/profile_details_screen.dart';
import 'package:yozu/theme/color/light_color.dart';

import 'auth/login_screen.dart';
import 'auth/otp_screen.dart';
import 'routes.dart';
import 'utils/size_config.dart';

//   ./gradlew signingReport  in mac

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( HomePage());
//  runApp( ProfileDetailsScreen());
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: ThemeData(
       // primarySwatch: LightColor.ylightpurple,
         primaryColor: Color.fromRGBO(178, 208, 239, 1.0),
        // secondaryHeaderColor: Color.fromRGBO(178, 208, 239, 1.0),
        // accentColor: Color.fromRGBO(178, 208, 239, 1.0)
        // accentColor: Color.fromRGBO(255, 255, 255, 1.0),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: LoginScreen.routeName,
      //initialRoute: OtpScreen.routeName,
      onGenerateRoute: CustomRoutes.allRoutes,
    );
  }
}

class MyPainter extends CustomPainter {
  final double radius;

  MyPainter(this.radius);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = const LinearGradient(
          colors: [Color(0xffFD5E3D), Color(0xffC43990)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight)
          .createShader(Rect.fromCircle(
        center: Offset(0, 0),
        radius: radius,
      ));

    canvas.drawCircle(Offset.zero, radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

class YozuAppTheme {
  YozuAppTheme._();
  static const MaterialColor theme = MaterialColor(
    0xFF5252A4,
    <int, Color>{
      50: const Color(0xFF0E7AC7),
      100: const Color(0xFF0E7AC7),
      200: const Color(0xFF0E7AC7),
      300: const Color(0xFF0E7AC7),
      400: const Color(0xFF0E7AC7),
      500: const Color(0xFF0E7AC7),
      600: const Color(0xFF0E7AC7),
      700: const Color(0xFF0E7AC7),
      800: const Color(0xFF0E7AC7),
      900: const Color(0xFF0E7AC7),
    },
  );
}
