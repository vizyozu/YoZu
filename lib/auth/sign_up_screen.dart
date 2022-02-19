import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:yozu/animation/fadeAnimation.dart';
import 'package:yozu/utils/size_config.dart';

import '../main.dart';




class SignUpPage extends StatefulWidget {
  static const routeName = '/signup-screen';
  SignUpPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> with TickerProviderStateMixin {

  var image;
  FirebaseStorage storageReference = FirebaseStorage.instance;
  final databaseReference = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _name1Controller = TextEditingController();
  final TextEditingController _name2Controller = TextEditingController();
  final TextEditingController _addresscontroler = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(

          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 330,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      height: 310,
                      width: MediaQuery.of(context).size.width + 20,
                      child: FadeAnimation(
                          1.3,
                          Container(
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                      //  'assets/login.png'),
                                        'assets/Mask Group.png'),
                                    fit: BoxFit.fill)),
                          )),
                    )
                  ],
                ),
              ),


              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const FadeAnimation(
                          1.5,
                          Text(
                            "Join with E-mail",
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          )
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      FadeAnimation(
                          1.7,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height: 43,
                                width: 296,
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    // begin: Alignment.centerLeft,
                                    // end: Alignment.centerRight,
                                    colors: <Color>[
                                      Color.fromRGBO(255, 241, 255, 1.0),
                                      Color.fromRGBO(243, 231, 255, 1.0),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      // border: const OutlineInputBorder(
                                      //   borderRadius: BorderRadius.all(
                                      //     Radius.circular(15.0),
                                      //   ),
                                      // ),
                                      // focusedBorder: const OutlineInputBorder(
                                      //   borderSide: BorderSide(
                                      //       color: LightColor.purple
                                      //   ),
                                      //   borderRadius: BorderRadius.all(
                                      //     Radius.circular(15.0),
                                      //   ),
                                      // ),
                                      //prefixIcon: Icon(Icons.lock),
                                      prefixIcon: Container(
                                        padding: EdgeInsets.all(11),
                                        height: 15,
                                        width: 15,
                                        child: Image.asset(
                                          'assets/icons/icons/email.png',),
                                      ),
                                      hintText: "E-mail",
                                      filled: true,
                                      // fillColor: LightColor.yboxbackpurple,
                                      hintStyle:
                                      TextStyle(color: Colors.deepPurpleAccent)),
                                ),
                              ),
                              SizedBox(height: 20,),
                              Container(
                                height: 43,
                                width: 296,
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    // begin: Alignment.centerLeft,
                                    // end: Alignment.centerRight,
                                    colors: <Color>[
                                      Color.fromRGBO(255, 241, 255, 1.0),
                                      Color.fromRGBO(243, 231, 255, 1.0),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      // border: OutlineInputBorder(
                                      //   borderSide: BorderSide(
                                      //       color: Colors.white
                                      //   ),
                                      //   borderRadius: BorderRadius.all(
                                      //     Radius.circular(15.0),
                                      //   ),
                                      // ),
                                      // focusedBorder: OutlineInputBorder(
                                      //   borderSide: BorderSide(
                                      //       color: LightColor.purple
                                      //   ),
                                      //   borderRadius: BorderRadius.all(
                                      //     Radius.circular(15.0),
                                      //   ),
                                      // ),
                                      // disabledBorder: OutlineInputBorder(
                                      //   borderSide: BorderSide(
                                      //       color: Colors.white60
                                      //   ),
                                      //   borderRadius: BorderRadius.all(
                                      //     Radius.circular(15.0),
                                      //   ),
                                      // ),
                                      prefixIcon: Container(
                                        padding: EdgeInsets.all(11),
                                        height: 15,
                                        width: 15,
                                        child: Image.asset(
                                          'assets/icons/icons/password.png',),
                                      ),
                                      //prefixIcon: Icon(Icons.lock),
                                      //border: InputBorder.none,
                                      hintText: "Password",
                                      filled: true,
                                      //fillColor: LightColor.yboxbackpurple,
                                      hintStyle:
                                      TextStyle(color: Colors.deepPurpleAccent)),
                                ),
                              ),
                              SizedBox(height: 20,),
                              Container(
                                  height: 43,
                                  width: 296,
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      // begin: Alignment.centerLeft,
                                      // end: Alignment.centerRight,
                                      colors: <Color>[
                                        Color.fromRGBO(255, 241, 255, 1.0),
                                        Color.fromRGBO(243, 231, 255, 1.0),
                                      ],
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                child: TextField(
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      // border: OutlineInputBorder(
                                      //   borderSide: BorderSide(
                                      //       color: Colors.white
                                      //   ),
                                      //   borderRadius: BorderRadius.all(
                                      //     Radius.circular(15.0),
                                      //   ),
                                      // ),
                                      // focusedBorder: OutlineInputBorder(
                                      //   borderSide: BorderSide(
                                      //       color: LightColor.purple
                                      //   ),
                                      //   borderRadius: BorderRadius.all(
                                      //     Radius.circular(15.0),
                                      //   ),
                                      // ),
                                      // disabledBorder: OutlineInputBorder(
                                      //   borderSide: BorderSide(
                                      //       color: Colors.white60
                                      //   ),
                                      //   borderRadius: BorderRadius.all(
                                      //     Radius.circular(15.0),
                                      //   ),
                                      // ),
                                      prefixIcon: Container(
                                        padding: EdgeInsets.all(11),
                                        height: 15,
                                        width: 15,
                                        child: Image.asset(
                                          'assets/icons/icons/password.png',),
                                      ),
                                      //prefixIcon: Icon(Icons.lock),
                                      //border: InputBorder.none,
                                      hintText: "Confirm Password",
                                      filled: true,
                                      //fillColor: LightColor.yboxbackpurple,
                                      hintStyle:
                                      TextStyle(color: Colors.deepPurpleAccent)),
                                ),
                              ),
                            ],
                          )),
                      SizedBox(height: 20,),
                      //FadeAnimation(1.7, Center(child: Text("Forgot Password?", style: TextStyle(color: Color.fromRGBO(196, 135, 198, 1)),))),
                      //const SizedBox(
                      //  height: 15,
                      //),
                      FadeAnimation(
                          1.9,
                          Container(
                            height: 50,
                            width: 135,
                            margin: const EdgeInsets.symmetric(horizontal: 60),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                // begin: Alignment.centerLeft,
                                // end: Alignment.centerRight,
                                colors: <Color>[
                                  Color.fromRGBO(255, 95, 131, 1.0),
                                  Color.fromRGBO(113, 56, 208, 1.0),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(
                              //  child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 14), ),
                              child: SizedBox(
                                width: SizeConfig.screenWidth * 0.6,
                                height: SizeConfig.screenHeight * 0.6,
                                child: FlatButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Text(
                                    'Sign Up',
                                    style: TextStyle(
                                      fontSize: getProportionateScreenWidth(18),
                                      color: Colors.white,
                                    ),
                                  ),
                                  onPressed: () {
                                    //  Navigator.pushNamed(context, ProfileScreen.routeName);
                                  },
                                ),
                              ),
                            ),
                          )),
                     ],
                  ),
                ),

              const SizedBox(
                height: 15,
              ),

            ],
          ),
        )
      ),
    );
  }

}
