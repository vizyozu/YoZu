import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:yozu/animation/fadeAnimation.dart';
import 'package:yozu/screens/dashboard.dart';
import 'package:yozu/screens/profile_details_screen.dart';
import 'package:yozu/theme/color/light_color.dart';
import 'package:yozu/utils/constants.dart';
import 'package:yozu/utils/size_config.dart';

class OtpScreen extends StatefulWidget {
  static const routeName = '/otp-screen';

  final String verificationId;

  const OtpScreen({Key key, this.verificationId}) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();

  User _firebaseUser;
  String _status;

  AuthCredential _phoneAuthCredential;
  String _verificationId;
  int _code;
  bool _otpView, _accountView;

  final _googleSignIn = GoogleSignIn();

  @override
  void initState() {
    super.initState();
    setState(() {
      _otpView = true;
      _accountView = false;
    });
    _getFirebaseUser();
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
                            "Enter OTP",
                            style: TextStyle(
                                color: Color.fromRGBO(49, 39, 79, 1),
                                fontWeight: FontWeight.normal,
                                fontSize: 17),
                          )),

                      const SizedBox(
                        height: 15,
                      ),

                      FadeAnimation(
                          1.7,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[

                              Container(
                                height: 46,
                                //padding: EdgeInsets.fromLTRB(32, 0, 32, 0),
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    // begin: Alignment.centerLeft,
                                    // end: Alignment.centerRight,
                                    colors: <Color>[
                                      Color.fromRGBO(255, 241, 255, 1.0),
                                      Color.fromRGBO(243, 231, 255, 1.0),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: TextField(
                                  controller: _otpController,
                                  decoration: const InputDecoration(
                                      // border: OutlineInputBorder(
                                      //   borderRadius: BorderRadius.all(
                                      //     Radius.circular(15.0),
                                      //   ),
                                      // ),
                                      // focusedBorder: OutlineInputBorder(
                                      //   borderSide: BorderSide(
                                      //       color: LightColor.purple),
                                      //   borderRadius: BorderRadius.all(
                                      //     Radius.circular(15.0),
                                      //   ),
                                      // ),
                                      //prefixIcon: Icon(Icons.code),
                                      border: InputBorder.none,
                                      //hintText: "OTP",
                                      filled: true,
                                      //fillColor: LightColor.yboxbackpurple,
                                      hintStyle: TextStyle(color: Colors.grey)),
                                ),
                              ),
                            ],
                          )),

                      const SizedBox(
                        height: 15,
                      ),

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
                                    'Login',
                                    style: TextStyle(
                                      fontSize: getProportionateScreenWidth(18),
                                      color: Colors.white,
                                    ),
                                  ),
                                  onPressed: () {
                                    _submitOTP();
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

              const FadeAnimation(
                  1.5,
                  Text(
                    "- Or -",
                    style: TextStyle(
                        color: Color.fromRGBO(113, 56, 208, 1.0),
                        fontWeight: FontWeight.normal,
                        fontSize: 15),
                  )),

              const SizedBox(
                height: 10,
              ),

              Row(
                mainAxisSize: MainAxisSize.min,
                children: [


                  InkWell(
                    onTap: (){
                      getGoogleAuth();
                    },
                    child: Container(width: 46.0,
                      height: 46.0,
                      padding: EdgeInsets.all(8), // Border width
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent),
                          //color: Colors.grey,
                          shape: BoxShape.circle),
                      child: ClipOval(
                        child: SizedBox.fromSize(
                          size: Size.fromRadius(48), // Image radius
                          child: Image.asset('assets/icons/icons/google.png',
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                  ),


                  // IconButton(
                  //   onPressed: () async {
                  //     getGoogleAuth();
                  //     setState(() {
                  //     });
                  //   },
                  //   icon: const Icon(
                  //     FontAwesomeIcons.google,
                  //     color: Colors.red,
                  //   ),
                  // ),

                  const SizedBox(width: 15.0),

                  InkWell(
                    onTap: (){
                      setState(() {
                        _otpView = true;
                        _accountView = false;
                      });
                    },
                    child: Container(
                      width: 46.0,
                      height: 46.0,
                      padding: EdgeInsets.all(5), // Border width
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent),
                          //color: Colors.grey,
                          shape: BoxShape.circle),
                      child: ClipOval(
                        child: SizedBox.fromSize(
                          //size: Size.fromRadius(40), // Image radius
                          child: Padding(
                            padding: EdgeInsets.all(2),
                            child: Image.asset('assets/icons/icons/email login.png',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                ],
              ),

            ],
          ),
        ),
      ),
    );
  }

  void _handleError(e) {
    print(e.message);
    setState(() {
      _status += e.message + '\n';
    });
  }

  Future<void> _getFirebaseUser() async {
    this._firebaseUser = await FirebaseAuth.instance.currentUser;
    setState(() {
      _status =
      (_firebaseUser == null) ? 'Not Logged In\n' : 'Already LoggedIn\n';
    });
  }

  Future<void> _login() async {
    try {
      await FirebaseAuth.instance
          .signInWithCredential(_phoneAuthCredential)
          .then((UserCredential authRes) {
        Navigator.pushNamed(context, ProfileDetailsScreen.routeName);
        //Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ProfileDetailsScreen(),));
        _firebaseUser = authRes.user;
        print(_firebaseUser.toString() + "Done");
      }).catchError((e) => _handleError(e));
      setState(() {
        _status += 'Signed In\n';
      });
    } catch (e) {
      _handleError(e);
    }
  }

  void _submitOTP() {
    String smsCode = _otpController.text.toString().trim();
    _phoneAuthCredential = PhoneAuthProvider.credential(
        verificationId: widget.verificationId, smsCode: smsCode);
    _login();
  }

  Future<bool> loginUser(String phone, BuildContext context) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    _auth.verifyPhoneNumber(
        phoneNumber: phone,
        timeout: const Duration(seconds: 60),
        verificationCompleted: (AuthCredential credential) async {
          Navigator.of(context).pop();
          dynamic result = await _auth.signInWithCredential(credential);
          var user = result.user;
          if (user != null) {
            Navigator.pushNamed(context, Dashboard.routeName);
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => const Dashboard()));
          } else {
            print("Error");
          }
          // this callback would gets called when verification is done automatically
        },
        verificationFailed: (Exception exception) {
          // if (exception == 'invalid-phone-number') {
          //   print('The provided phone number is not valid.');
          // }
          print(exception);
        },
        codeSent: (String verificationID, [int forceResendingToken]) async {
          // Scaffold(
          //   body: Container(
          //     padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          //     width: MediaQuery.of(context).size.width,
          //     child: SingleChildScrollView(
          //       child: Container(
          //         height: MediaQuery.of(context).size.height,
          //         width: MediaQuery.of(context).size.width,
          //         child: Column(
          //           children: [
          //           ],
          //         ),
          //       ),
          //     ),
          //   ),
          // );
        },
        codeAutoRetrievalTimeout: null);
  }

  Future getGoogleAuth() async {
    final user = await _googleSignIn.signIn();
    if (user == null) {
    } else {
      final googleAuth = await user.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
      final fireUser = FirebaseAuth.instance.currentUser;
      String name = fireUser.displayName.toString();
      String photoUrl = fireUser.photoURL.toString();
      String uid = fireUser.uid.toString();
      String email = fireUser.email.toString();
      SnackBar(
        behavior: SnackBarBehavior.floating,
        shape: const StadiumBorder(),
        content: Text("Logged In Successfully"
          // onValue['body']['message']
        ),
      );
      Map<String, dynamic> userData = {
        "uid_token": uid,
        "email": user.email,
        "profileImage": photoUrl,
        "user_name": user.displayName
      };
      HapticFeedback.vibrate();
    }
  }

}
