import 'dart:ffi';

import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dropdown.dart';
import 'package:country_pickers/country_pickers.dart';
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

import 'sign_up_screen.dart';
import 'otp_screen.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login-screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  int _code;
  String _status;
  User _firebaseUser;
  String _verificationId;
  bool _otpView, _accountView;
  AuthCredential _phoneAuthCredential;
  final _googleSignIn = GoogleSignIn();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();

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
        body: FirebaseAuth.instance.currentUser == null
            ? SingleChildScrollView(

          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              Container(
                height: 330,
                child: Stack(
                  children: <Widget>[
                    // Positioned(
                    //   top: -40,
                    //   height: 370,
                    //   width: MediaQuery.of(context).size.width,
                    //   child: FadeAnimation(
                    //       1,
                    //       Container(
                    //         decoration: const BoxDecoration(
                    //             image: DecorationImage(
                    //                 image: AssetImage(
                    //                     'assets/images/background.png'),
                    //                 fit: BoxFit.fill)),
                    //       )),
                    // ),
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

              if(_accountView)...[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                   crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      // const FadeAnimation(
                      //     1.5,
                      //     Text(
                      //       "Sign Up",
                      //       style: TextStyle(
                      //           color: Color.fromRGBO(49, 39, 79, 1),
                      //           fontWeight: FontWeight.bold,
                      //           fontSize: 30),
                      //     )
                      // ),
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
                                      TextStyle(color: Colors.grey)),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 10, 20, 0),
                                child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: FadeAnimation(
                                    1.5,
                                    RichText(
                                      text: const TextSpan(
                                        text: "Forgot Password? ",
                                        style: TextStyle(
                                            color: Color.fromRGBO(113, 56, 208, 1.0),
                                            fontSize: 12),
                                      ),
                                    ),
                                    // Text(
                                    //   "Don't have an account? Sign Up",
                                    //   style: TextStyle(
                                    //       color: Color.fromRGBO(49, 39, 79, 1),
                                    //       fontWeight: FontWeight.bold,
                                    //       fontSize: 30),
                                    // )
                                  ),
                                ),
                              ),
                              // SizedBox(height: 20,),
                              // Container(
                              //     height: 43,
                              //     width: 296,
                              //     decoration: BoxDecoration(
                              //       gradient: const LinearGradient(
                              //         // begin: Alignment.centerLeft,
                              //         // end: Alignment.centerRight,
                              //         colors: <Color>[
                              //           Color.fromRGBO(255, 241, 255, 1.0),
                              //           Color.fromRGBO(243, 231, 255, 1.0),
                              //         ],
                              //       ),
                              //       borderRadius: BorderRadius.circular(15),
                              //     ),
                              //   child: const TextField(
                              //     decoration: InputDecoration(
                              //         border: InputBorder.none,
                              //         // border: OutlineInputBorder(
                              //         //   borderSide: BorderSide(
                              //         //       color: Colors.white60
                              //         //   ),
                              //         //   borderRadius: BorderRadius.all(
                              //         //     Radius.circular(15.0),
                              //         //   ),
                              //         // ),
                              //         // focusedBorder: OutlineInputBorder(
                              //         //   borderSide: BorderSide(
                              //         //       color: LightColor.purple
                              //         //   ),
                              //         //   borderRadius: BorderRadius.all(
                              //         //     Radius.circular(15.0),
                              //         //   ),
                              //         // ),
                              //         // disabledBorder: OutlineInputBorder(
                              //         //   borderSide: BorderSide(
                              //         //       color: Colors.white60
                              //         //   ),
                              //         //   borderRadius: BorderRadius.all(
                              //         //     Radius.circular(15.0),
                              //         //   ),
                              //         // ),
                              //         prefixIcon: Icon(Icons.lock),
                              //         //border: InputBorder.none,
                              //         hintText: "Confirm Password",
                              //         filled: true,
                              //        // fillColor: LightColor.yboxbackpurple,
                              //         hintStyle:
                              //         TextStyle(color: Colors.grey)),
                              //   )
                              // ),
                            ],
                          )),

                      // SizedBox(height: 20,),
                      // FadeAnimation(1.7, Center(child: Text("Forgot Password?", style: TextStyle(color: Color.fromRGBO(196, 135, 198, 1)),))),
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
                                    'Log in',
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
                      SizedBox(height: 30,),
                      FadeAnimation(
                          1.5,
                        InkWell(
                          onTap: (){
                            // Navigator.push(context,
                            //     MaterialPageRoute(builder: (context) => SignUpPage()));
                            Navigator.pushNamed(context, SignUpPage.routeName);
                          },
                          child: RichText(
                            text: const TextSpan(
                              text: "Don't have an account? ",
                              style: TextStyle(
                                  color: Color.fromRGBO(113, 56, 208, 1.0),
                                  fontSize: 12),
                              children: <TextSpan>[

                                TextSpan(
                                    text: ' Sign Up',
                                    style: TextStyle(color: Colors.red)
                                ),

                              ],
                            ),
                          ),
                        ),
                          // Text(
                          //   "Don't have an account? Sign Up",
                          //   style: TextStyle(
                          //       color: Color.fromRGBO(49, 39, 79, 1),
                          //       fontWeight: FontWeight.bold,
                          //       fontSize: 30),
                          // )
                      ),
                      // FadeAnimation(2, Center(child: Text("Create Account", style: TextStyle(color: Color.fromRGBO(49, 39, 79, .6)),))),
                    ],
                  ),
                ),
              ],

              if(_otpView)...[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const FadeAnimation(
                          1.5,
                          Text(
                            "Enter your phone number",
                            style: TextStyle(

                                color: Color.fromRGBO(49, 39, 79, 1),
                                fontWeight: FontWeight.normal,
                                fontSize: 15),
                          )),
                      const SizedBox(
                        height: 30,
                      ),
                      FadeAnimation(
                          1.7,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height: 46,
                                //width: 296,
                                padding: EdgeInsets.fromLTRB(32, 0, 32, 0),
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
                                // child: TextField(
                                //   controller: _phoneNumberController,
                                //   decoration: const InputDecoration(
                                //       border: OutlineInputBorder(
                                //         borderRadius: BorderRadius.all(
                                //           Radius.circular(15.0),
                                //         ),
                                //       ),
                                //       focusedBorder: OutlineInputBorder(
                                //         // borderSide: BorderSide(
                                //         //     color: LightColor.purple),
                                //         borderRadius: BorderRadius.all(
                                //           Radius.circular(15.0),
                                //         ),
                                //       ),
                                //       prefixIcon: Icon(Icons.phone),
                                //       //border: InputBorder.none,
                                //       //hintText: "Phone number",
                                //       filled: true,
                                //      // fillColor: LightColor.yboxbackpurple,
                                //       hintStyle: TextStyle(color: Colors.grey)),
                                // ),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: CountryPickerDropdown(
                                        initialValue: 'in',
                                        itemBuilder: _buildDropdownItem,
                                        onValuePicked: (Country country) {
                                          print("${country.name}");
                                        },
                                      ),
                                    ),
                                    const VerticalDivider(
                                      thickness: 0.8,
                                      color: Colors.grey,
                                    ),
                                    Expanded(
                                      child: TextField(
                                        keyboardType: TextInputType.phone,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          //hintText: "Phone Number",
                                        ),
                                        onChanged: (value) {
                                          // this.phoneNo=value;
                                          print(value);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                      const SizedBox(
                        height: 30,
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
                                  //color: kPrimaryColor,
                                  child: Text(
                                    'Get OTP',
                                    style: TextStyle(
                                      fontSize: getProportionateScreenWidth(18),
                                      color: Colors.white,
                                    ),
                                  ),
                                  onPressed: () {
                                    _submitPhoneNumber();
                                    //  Navigator.pushNamed(context, ProfileScreen.routeName);
                                  },
                                ),
                              ),
                            ),
                          )),

                    ],
                  ),
                )
              ],

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

                  if(!_otpView)...[

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
                    // IconButton(
                    //   onPressed: () async {
                    //     setState(() {
                    //       _otpView = true;
                    //       _accountView = false;
                    //     });
                    //   },
                    //   icon: const Icon(
                    //     //  Icons.phone,
                    //     Icons.phone_locked,
                    //     color: Colors.blue,
                    //   ),
                    // ),
                  ],

                  if(!_accountView)...[

                    InkWell(
                      onTap: (){
                        setState(() {
                          _otpView = false;
                          _accountView = true;
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
                    // IconButton(
                    //   onPressed: () async {
                    //     setState(() {
                    //       _otpView = false;
                    //       _accountView = true;
                    //     });
                    //   },
                    //   icon: const Icon(
                    //     //  Icons.phone,
                    //     Icons.mail_outline,
                    //     color: Colors.blue,
                    //   ),
                    // ),
                  ]

                ],
              ),

            ],
          ),
        )
        : ProfileDetailsScreen(),
      ),
    );
  }

  Widget _buildDropdownItem(Country country) => Container(
    width: 100,
    child: Row(
      children: <Widget>[
        CountryPickerUtils.getDefaultFlagImage(country),
        Text("( ${country.isoCode} ) +${country.phoneCode}"),
        //Text("+${country.phoneCode}"),
      ],
    ),
  );

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
      // const SnackBar(
      //   behavior: SnackBarBehavior.floating,
      //   shape: StadiumBorder(),
      //   content: Text("Logged In Successfully"
      //       // onValue['body']['message']
      //       ),
      // );
      Map<String, dynamic> userData = {
        "uid_token": uid,
        "email": user.email,
        "profileImage": photoUrl,
        "user_name": user.displayName
      };
      HapticFeedback.vibrate();
      Navigator.pushNamed(context, ProfileDetailsScreen.routeName);
    }
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
    /// This method is used to login the user
    /// `AuthCredential`(`_phoneAuthCredential`) is needed for the signIn method
    /// After the signIn method from `AuthResult` we can get `FirebaserUser`(`_firebaseUser`)
    try {
      await FirebaseAuth.instance
          .signInWithCredential(this._phoneAuthCredential)
          .then((UserCredential authRes) {
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

  Future<void> _logout() async {
    /// Method to Logout the `FirebaseUser` (`_firebaseUser`)
    try {
      // signout code
      await FirebaseAuth.instance.signOut();
      _firebaseUser = null;
      setState(() {
        _status += 'Signed out\n';
      });
    } catch (e) {
      _handleError(e);
    }
  }

  Future<void> _submitPhoneNumber() async {
    /// NOTE: Either append your phone number country code or add in the code itself
    /// Since I'm in India we use "+91 " as prefix `phoneNumber`
    String phoneNumber = "+91 " + _phoneNumberController.text.toString().trim();
    print(phoneNumber);

    /// The below functions are the callbacks, separated so as to make code more redable
    void verificationCompleted(AuthCredential phoneAuthCredential) {
      print('verificationCompleted');
      setState(() {
        _status += 'verificationCompleted\n';
      });
      this._phoneAuthCredential = phoneAuthCredential;
      print(phoneAuthCredential);
    }

    void verificationFailed(Exception error) {
      print('verificationFailed');
      _handleError(error);
    }

    void codeSent(String verificationId, [int code]) {
      print('codeSent');
      this._verificationId = verificationId;
      print(verificationId);

      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) =>
              OtpScreen(verificationId: verificationId,),));
      this._code = code;
      print(code.toString());
      setState(() {
        _status += 'Code Sent\n';
      });
    }

    void codeAutoRetrievalTimeout(String verificationId) {
      print('codeAutoRetrievalTimeout');
      setState(() {
        _status += 'codeAutoRetrievalTimeout\n';
      });
      print(verificationId);
    }

    await FirebaseAuth.instance.verifyPhoneNumber(
      /// Make sure to prefix with your country code
      phoneNumber: phoneNumber,

      /// `seconds` didn't work. The underlying implementation code only reads in `millisenconds`
      timeout: Duration(seconds: 120),

      /// If the SIM (with phoneNumber) is in the current device this function is called.
      /// This function gives `AuthCredential`. Moreover `login` function can be called from this callback
      /// When this function is called there is no need to enter the OTP, you can click on Login button to sigin directly as the device is now verified
      // verificationCompleted: verificationCompleted,

      /// Called when the verification is failed
      //  verificationFailed: verificationFailed,

      /// This is called after the OTP is sent. Gives a `verificationId` and `code`
      codeSent: codeSent,

      /// After automatic code retrival `tmeout` this function is called
      //  codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    ); // All the callbacks are above
  }

}
