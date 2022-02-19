import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:yozu/theme/color/light_color.dart';
import 'package:yozu/utils/constants.dart';
import 'package:yozu/utils/size_config.dart';

import 'dashboard.dart';

class ProfileDetailsScreen extends StatefulWidget {

  static const routeName = '/profile-screen';
  const ProfileDetailsScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ProfileDetailsScreenState createState() => _ProfileDetailsScreenState();
}

class _ProfileDetailsScreenState extends State<ProfileDetailsScreen>
    with TickerProviderStateMixin {

  FirebaseStorage storageReference = FirebaseStorage.instance;

  String _standard, _board;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _referController = TextEditingController();
  final TextEditingController _schoolController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    SizeConfig().init(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            const Text(
            "YoZu",
            style: TextStyle(
                color: LightColor.ylightpurple,
                fontWeight: FontWeight.bold,
                fontSize: 40),
          ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Tell us about yourself",
              style: TextStyle(
                  color: LightColor.ylightpurple,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
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
                        // border: OutlineInputBorder(
                        //   borderRadius: BorderRadius.all(
                        //     Radius.circular(15.0),
                        //   ),
                        // ),
                        // focusedBorder: OutlineInputBorder(
                        //   borderSide: BorderSide(color: LightColor.purple),
                        //   borderRadius: BorderRadius.all(
                        //     Radius.circular(15.0),
                        //   ),
                        // ),
                        prefixIcon: Container(
                          padding: EdgeInsets.all(11),
                          height: 15,
                          width: 15,
                          child: Image.asset(
                            'assets/icons/icons/Profile.png',),
                        ),
                        border: InputBorder.none,
                        hintText: "Your name",
                        //filled: true,
                        //fillColor: LightColor.yboxbackpurple,
                        hintStyle: TextStyle(color: Colors.grey)),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
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
                        // border: OutlineInputBorder(
                        //   borderSide: BorderSide(color: Colors.white60),
                        //   borderRadius: BorderRadius.all(
                        //     Radius.circular(15.0),
                        //   ),
                        // ),
                        // focusedBorder: OutlineInputBorder(
                        //   borderSide: BorderSide(color: LightColor.purple),
                        //   borderRadius: BorderRadius.all(
                        //     Radius.circular(15.0),
                        //   ),
                        // ),
                        // disabledBorder: OutlineInputBorder(
                        //   borderSide: BorderSide(color: Colors.white60),
                        //   borderRadius: BorderRadius.all(
                        //     Radius.circular(15.0),
                        //   ),
                        // ),
                        prefixIcon: Container(
                          padding: EdgeInsets.all(11),
                          height: 15,
                          width: 15,
                          child: Image.asset(
                            'assets/icons/icons/email.png',),
                        ),
                        border: InputBorder.none,
                        hintText: "E-mail",
                        filled: true,
                        //fillColor: LightColor.yboxbackpurple,
                        hintStyle: TextStyle(color: Colors.grey)),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
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
                          // border: OutlineInputBorder(
                          //   borderSide: BorderSide(color: Colors.white60),
                          //   borderRadius: BorderRadius.all(
                          //     Radius.circular(15.0),
                          //   ),
                          // ),
                          // focusedBorder: OutlineInputBorder(
                          //   borderSide: BorderSide(color: LightColor.purple),
                          //   borderRadius: BorderRadius.all(
                          //     Radius.circular(15.0),
                          //   ),
                          // ),
                          // disabledBorder: OutlineInputBorder(
                          //   borderSide: BorderSide(color: Colors.white60),
                          //   borderRadius: BorderRadius.all(
                          //     Radius.circular(15.0),
                          //   ),
                          // ),
                          prefixIcon: Container(
                            padding: EdgeInsets.all(11),
                            height: 15,
                            width: 15,
                            child: Image.asset(
                              'assets/icons/icons/School.png',),
                          ),
                          suffixIcon: Icon(Icons.search),
                          border: InputBorder.none,
                          hintText: "School name",
                          filled: true,
                          //fillColor: LightColor.yboxbackpurple,
                          hintStyle: TextStyle(color: Colors.grey)),
                    )),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Class",
                      style: TextStyle(
                        color: Color.fromRGBO(113, 56, 208, 1.0),
                         // color: Color.fromRGBO(49, 39, 79, 1),
                          fontWeight: FontWeight.normal,
                          fontSize: 20),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Container(
                        width: 70,
                        height: 48,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: <Color>[
                              LightColor.yorange,
                              LightColor.ypurple,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(17),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(1.5),
                          child: Container(

                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: <Color>[
                                  Color.fromRGBO(255, 241, 255, 1.0),
                                  Color.fromRGBO(243, 231, 255, 1.0),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: const Center(
                              child: Text('6 th'),
                            ),
                          ),
                        ),
                      ),

                      // Container(
                      //   width: 70,
                      //   height: 48,
                      //   decoration: BoxDecoration(
                      //     gradient: const LinearGradient(
                      //       colors: <Color>[
                      //         LightColor.yorange,
                      //         LightColor.ypurple,
                      //       ],
                      //     ),
                      //     borderRadius: BorderRadius.circular(17),
                      //   ),
                      //   child: Padding(
                      //     padding: const EdgeInsets.all(1.5),
                      //     child: Container(
                      //
                      //       decoration: BoxDecoration(
                      //             gradient: const LinearGradient(
                      //               colors: <Color>[
                      //                 Color.fromRGBO(255, 241, 255, 1.0),
                      //                 Color.fromRGBO(243, 231, 255, 1.0),
                      //               ],
                      //             ),
                      //             borderRadius: BorderRadius.circular(15),
                      //       ),
                      //       child: const Center(
                      //         child: Text('6 th'),
                      //       ),
                      //     ),
                      //   ),
                      // ),

                      const SizedBox(
                        width: 10,
                      ),

                      InkWell(
                        onTap: (){
                          setState(() {
                            _standard = "7th";
                          });
                        },
                        child: Container(
                          width: 70,
                          height: 48,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: <Color>[
                                LightColor.yorange,
                                LightColor.ypurple,
                              ],
                            ),
                            borderRadius: BorderRadius.circular(17),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(1.5),
                            child: Container(

                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: <Color>[
                                    Color.fromRGBO(255, 241, 255, 1.0),
                                    Color.fromRGBO(243, 231, 255, 1.0),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: const Center(
                                child: Text('7th'),
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Container(
                      //   width: 70,
                      //   height: 48,
                      //   child: OutlinedButton(
                      //     child: Text(
                      //       "7 th",
                      //       style: TextStyle(color: LightColor.ypurple),
                      //     ),
                      //     onPressed: () {
                      //       setState(() {
                      //         _standard = "7th";
                      //       });
                      //     },
                      //     style: ButtonStyle(
                      //       backgroundColor:
                      //       MaterialStateProperty.resolveWith<Color>(
                      //               (states) {
                      //             return LightColor.yboxbackpurple;
                      //           }),
                      //       // overlayColor:
                      //       //     MaterialStateProperty.resolveWith<Color>(
                      //       //         (states) {
                      //       //   if (states.contains(MaterialState.pressed)) {
                      //       //     return Colors.red;
                      //       //   }
                      //       //   return Colors.transparent;
                      //       // }),
                      //       side: MaterialStateProperty.resolveWith((states) {
                      //         Color _borderColor;
                      //
                      //         if (states.contains(MaterialState.disabled)) {
                      //           _borderColor = Colors.greenAccent;
                      //         } else if (states
                      //             .contains(MaterialState.pressed)) {
                      //           _borderColor = Colors.yellow;
                      //         } else {
                      //           _borderColor = LightColor.ypurple;
                      //         }
                      //
                      //         return BorderSide(color: _borderColor, width: 1);
                      //       }),
                      //       shape: MaterialStateProperty.resolveWith<
                      //           OutlinedBorder>((_) {
                      //         return RoundedRectangleBorder(
                      //             borderRadius: BorderRadius.circular(16));
                      //       }),
                      //     ),
                      //   ),
                      // ),
                      const SizedBox(
                        width: 10,
                      ),

                      InkWell(
                        onTap: (){
                          setState(() {
                            _standard = "8th";
                          });
                        },
                        child: Container(
                          width: 70,
                          height: 48,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: <Color>[
                                LightColor.yorange,
                                LightColor.ypurple,
                              ],
                            ),
                            borderRadius: BorderRadius.circular(17),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(1.5),
                            child: Container(

                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: <Color>[
                                    Color.fromRGBO(255, 241, 255, 1.0),
                                    Color.fromRGBO(243, 231, 255, 1.0),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: const Center(
                                child: Text('8 th'),
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Container(
                      //   width: 70,
                      //   height: 48,
                      //   child: OutlinedButton(
                      //     child: Text(
                      //       "8 th",
                      //       style: TextStyle(color: LightColor.ypurple),
                      //     ),
                      //     onPressed: () {
                      //       setState(() {
                      //         _standard = "8th";
                      //       });
                      //     },
                      //     style: ButtonStyle(
                      //       backgroundColor:
                      //       MaterialStateProperty.resolveWith<Color>(
                      //               (states) {
                      //             return LightColor.yboxbackpurple;
                      //           }),
                      //       // overlayColor:
                      //       //     MaterialStateProperty.resolveWith<Color>(
                      //       //         (states) {
                      //       //   if (states.contains(MaterialState.pressed)) {
                      //       //     return Colors.red;
                      //       //   }
                      //       //   return Colors.transparent;
                      //       // }),
                      //       side: MaterialStateProperty.resolveWith((states) {
                      //         Color _borderColor;
                      //
                      //         if (states.contains(MaterialState.disabled)) {
                      //           _borderColor = Colors.greenAccent;
                      //         } else if (states
                      //             .contains(MaterialState.pressed)) {
                      //           _borderColor = Colors.yellow;
                      //         } else {
                      //           _borderColor = LightColor.ypurple;
                      //         }
                      //
                      //         return BorderSide(color: _borderColor, width: 1);
                      //       }),
                      //       shape: MaterialStateProperty.resolveWith<
                      //           OutlinedBorder>((_) {
                      //         return RoundedRectangleBorder(
                      //             borderRadius: BorderRadius.circular(16));
                      //       }),
                      //     ),
                      //   ),
                      // ),
                      const SizedBox(
                        width: 10,
                      ),

                      InkWell(
                        onTap: (){
                          setState(() {
                            _standard = "9th";
                          });
                        },
                        child: Container(
                          width: 70,
                          height: 48,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: <Color>[
                                LightColor.yorange,
                                LightColor.ypurple,
                              ],
                            ),
                            borderRadius: BorderRadius.circular(17),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(1.5),
                            child: Container(

                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: <Color>[
                                    Color.fromRGBO(255, 241, 255, 1.0),
                                    Color.fromRGBO(243, 231, 255, 1.0),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: const Center(
                                child: Text('9 th'),
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Container(
                      //   width: 70,
                      //   height: 48,
                      //   child: OutlinedButton(
                      //     child: Text(
                      //       "9 th",
                      //       style: TextStyle(color: LightColor.ypurple),
                      //     ),
                      //     onPressed: () {
                      //       setState(() {
                      //         _standard = "9th";
                      //       });
                      //     },
                      //     style: ButtonStyle(
                      //       backgroundColor:
                      //       MaterialStateProperty.resolveWith<Color>(
                      //               (states) {
                      //             return LightColor.yboxbackpurple;
                      //           }),
                      //       // overlayColor:
                      //       //     MaterialStateProperty.resolveWith<Color>(
                      //       //         (states) {
                      //       //   if (states.contains(MaterialState.pressed)) {
                      //       //     return Colors.red;
                      //       //   }
                      //       //   return Colors.transparent;
                      //       // }),
                      //       side: MaterialStateProperty.resolveWith((states) {
                      //         Color _borderColor;
                      //
                      //         if (states.contains(MaterialState.disabled)) {
                      //           _borderColor = Colors.greenAccent;
                      //         } else if (states
                      //             .contains(MaterialState.pressed)) {
                      //           _borderColor = Colors.yellow;
                      //         } else {
                      //           _borderColor = LightColor.ypurple;
                      //         }
                      //
                      //         return BorderSide(color: _borderColor, width: 1);
                      //       }),
                      //       shape: MaterialStateProperty.resolveWith<
                      //           OutlinedBorder>((_) {
                      //         return RoundedRectangleBorder(
                      //             borderRadius: BorderRadius.circular(16));
                      //       }),
                      //     ),
                      //   ),
                      // ),
                      const SizedBox(
                        width: 10,
                      ),

                      InkWell(
                        onTap: (){
                          setState(() {
                            _standard = "10th";
                          });
                        },
                        child: Container(
                          width: 70,
                          height: 48,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: <Color>[
                                LightColor.yorange,
                                LightColor.ypurple,
                              ],
                            ),
                            borderRadius: BorderRadius.circular(17),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(1.5),
                            child: Container(

                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: <Color>[
                                    Color.fromRGBO(255, 241, 255, 1.0),
                                    Color.fromRGBO(243, 231, 255, 1.0),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: const Center(
                                child: Text('10 th'),
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Container(
                      //   width: 70,
                      //   height: 48,
                      //   child: OutlinedButton(
                      //     child: Text(
                      //       "10 th",
                      //       style: TextStyle(color: LightColor.ypurple),
                      //     ),
                      //     onPressed: () {
                      //       setState(() {
                      //         _standard = "10th";
                      //       });
                      //     },
                      //     style: ButtonStyle(
                      //       backgroundColor:
                      //       MaterialStateProperty.resolveWith<Color>(
                      //               (states) {
                      //             return LightColor.yboxbackpurple;
                      //           }),
                      //       // overlayColor:
                      //       //     MaterialStateProperty.resolveWith<Color>(
                      //       //         (states) {
                      //       //   if (states.contains(MaterialState.pressed)) {
                      //       //     return Colors.red;
                      //       //   }
                      //       //   return Colors.transparent;
                      //       // }),
                      //       side: MaterialStateProperty.resolveWith((states) {
                      //         Color _borderColor;
                      //
                      //         if (states.contains(MaterialState.disabled)) {
                      //           _borderColor = Colors.greenAccent;
                      //         } else if (states
                      //             .contains(MaterialState.pressed)) {
                      //           _borderColor = Colors.yellow;
                      //         } else {
                      //           _borderColor = LightColor.ypurple;
                      //         }
                      //
                      //         return BorderSide(color: _borderColor, width: 1);
                      //       }),
                      //       shape: MaterialStateProperty.resolveWith<
                      //           OutlinedBorder>((_) {
                      //         return RoundedRectangleBorder(
                      //             borderRadius: BorderRadius.circular(16));
                      //       }),
                      //     ),
                      //   ),
                      // ),
                      const SizedBox(
                        width: 10,
                      ),

                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Board",
                      style: TextStyle(
                          color: Color.fromRGBO(113, 56, 208, 1.0),
                          // color: Color.fromRGBO(49, 39, 79, 1),
                          fontWeight: FontWeight.normal,
                          fontSize: 20),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      InkWell(
                        onTap: (){
                          setState(() {
                            _board = "CBSE";
                          });
                        },
                        child: Container(
                          width: 70,
                          height: 48,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: <Color>[
                                LightColor.yorange,
                                LightColor.ypurple,
                              ],
                            ),
                            borderRadius: BorderRadius.circular(17),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(1.5),
                            child: Container(

                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: <Color>[
                                    Color.fromRGBO(255, 241, 255, 1.0),
                                    Color.fromRGBO(243, 231, 255, 1.0),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: const Center(
                                child: Text('CBSE'),
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Container(
                      //   width: 70,
                      //   height: 48,
                      //   child: OutlinedButton(
                      //     child: Text(
                      //       "CBSE",
                      //       style: TextStyle(color: LightColor.ypurple),
                      //     ),
                      //     onPressed: () {
                      //       setState(() {
                      //         _board = "CBSE";
                      //       });
                      //     },
                      //     style: ButtonStyle(
                      //       backgroundColor:
                      //       MaterialStateProperty.resolveWith<Color>(
                      //               (states) {
                      //             return LightColor.yboxbackpurple;
                      //           }),
                      //       // overlayColor:
                      //       //     MaterialStateProperty.resolveWith<Color>(
                      //       //         (states) {
                      //       //   if (states.contains(MaterialState.pressed)) {
                      //       //     return Colors.red;
                      //       //   }
                      //       //   return Colors.transparent;
                      //       // }),
                      //       side: MaterialStateProperty.resolveWith((states) {
                      //         Color _borderColor;
                      //
                      //         if (states.contains(MaterialState.disabled)) {
                      //           _borderColor = Colors.greenAccent;
                      //         } else if (states
                      //             .contains(MaterialState.pressed)) {
                      //           _borderColor = Colors.yellow;
                      //         } else {
                      //           _borderColor = LightColor.ypurple;
                      //         }
                      //
                      //         return BorderSide(color: _borderColor, width: 1);
                      //       }),
                      //       shape: MaterialStateProperty.resolveWith<
                      //           OutlinedBorder>((_) {
                      //         return RoundedRectangleBorder(
                      //             borderRadius: BorderRadius.circular(16));
                      //       }),
                      //     ),
                      //   ),
                      // ),
                      const SizedBox(
                        width: 10,
                      ),

                      InkWell(
                        onTap: (){
                          setState(() {
                            _board = "ICSE";
                          });
                        },
                        child: Container(
                          width: 70,
                          height: 48,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: <Color>[
                                LightColor.yorange,
                                LightColor.ypurple,
                              ],
                            ),
                            borderRadius: BorderRadius.circular(17),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(1.5),
                            child: Container(

                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: <Color>[
                                    Color.fromRGBO(255, 241, 255, 1.0),
                                    Color.fromRGBO(243, 231, 255, 1.0),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: const Center(
                                child: Text('ICSE'),
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Container(
                      //   width: 70,
                      //   height: 48,
                      //   child: OutlinedButton(
                      //     child: Text(
                      //       "ICSE",
                      //       style: TextStyle(color: LightColor.ypurple),
                      //     ),
                      //     onPressed: () {
                      //       setState(() {
                      //         _board = "ICSE";
                      //       });
                      //     },
                      //     style: ButtonStyle(
                      //       backgroundColor:
                      //       MaterialStateProperty.resolveWith<Color>(
                      //               (states) {
                      //             return LightColor.yboxbackpurple;
                      //           }),
                      //       // overlayColor:
                      //       //     MaterialStateProperty.resolveWith<Color>(
                      //       //         (states) {
                      //       //   if (states.contains(MaterialState.pressed)) {
                      //       //     return Colors.red;
                      //       //   }
                      //       //   return Colors.transparent;
                      //       // }),
                      //       side: MaterialStateProperty.resolveWith((states) {
                      //         Color _borderColor;
                      //
                      //         if (states.contains(MaterialState.disabled)) {
                      //           _borderColor = Colors.greenAccent;
                      //         } else if (states
                      //             .contains(MaterialState.pressed)) {
                      //           _borderColor = Colors.yellow;
                      //         } else {
                      //           _borderColor = LightColor.ypurple;
                      //         }
                      //
                      //         return BorderSide(color: _borderColor, width: 1);
                      //       }),
                      //       shape: MaterialStateProperty.resolveWith<
                      //           OutlinedBorder>((_) {
                      //         return RoundedRectangleBorder(
                      //             borderRadius: BorderRadius.circular(16));
                      //       }),
                      //     ),
                      //   ),
                      // ),
                      const SizedBox(
                        width: 10,
                      ),

                      InkWell(
                        onTap: (){
                          setState(() {
                            _board = "STATE";
                          });
                        },
                        child: Container(
                          width: 70,
                          height: 48,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: <Color>[
                                LightColor.yorange,
                                LightColor.ypurple,
                              ],
                            ),
                            borderRadius: BorderRadius.circular(17),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(1.5),
                            child: Container(

                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: <Color>[
                                    Color.fromRGBO(255, 241, 255, 1.0),
                                    Color.fromRGBO(243, 231, 255, 1.0),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: const Center(
                                child: Text('STATE'),
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Container(
                      //   width: 90,
                      //   height: 48,
                      //   child: OutlinedButton(
                      //     child: Text(
                      //       "STATE",
                      //       style: TextStyle(color: LightColor.ypurple),
                      //     ),
                      //     onPressed: () {
                      //       setState(() {
                      //         _board = "STATE";
                      //       });
                      //     },
                      //     style: ButtonStyle(
                      //       backgroundColor:
                      //       MaterialStateProperty.resolveWith<Color>(
                      //               (states) {
                      //             return LightColor.yboxbackpurple;
                      //           }),
                      //       // overlayColor:
                      //       //     MaterialStateProperty.resolveWith<Color>(
                      //       //         (states) {
                      //       //   if (states.contains(MaterialState.pressed)) {
                      //       //     return Colors.red;
                      //       //   }
                      //       //   return Colors.transparent;
                      //       // }),
                      //       side: MaterialStateProperty.resolveWith((states) {
                      //         Color _borderColor;
                      //
                      //         if (states.contains(MaterialState.disabled)) {
                      //           _borderColor = Colors.greenAccent;
                      //         } else if (states
                      //             .contains(MaterialState.pressed)) {
                      //           _borderColor = Colors.yellow;
                      //         } else {
                      //           _borderColor = LightColor.ypurple;
                      //         }
                      //
                      //         return BorderSide(color: _borderColor, width: 1);
                      //       }),
                      //       shape: MaterialStateProperty.resolveWith<
                      //           OutlinedBorder>((_) {
                      //         return RoundedRectangleBorder(
                      //             borderRadius: BorderRadius.circular(16));
                      //       }),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
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
                  // border: OutlineInputBorder(
                  //   borderRadius: BorderRadius.all(
                  //     Radius.circular(15.0),
                  //   ),
                  // ),
                  // focusedBorder: OutlineInputBorder(
                  //   borderSide: BorderSide(color: LightColor.purple),
                  //   borderRadius: BorderRadius.all(
                  //     Radius.circular(15.0),
                  //   ),
                  // ),
                    prefixIcon: Container(
                      padding: EdgeInsets.all(11),
                      height: 15,
                      width: 15,
                      child: Image.asset(
                        'assets/icons/icons/reference code.png',),
                    ),
                    border: InputBorder.none,
                    hintText: "Referral Code",
                    //filled: true,
                    //fillColor: LightColor.yboxbackpurple,
                    hintStyle: TextStyle(color: Colors.grey)),
              ),
            ),
            // Container(
            //   height: 52,
            //
            //   padding: EdgeInsets.fromLTRB(32, 5, 32, 0),
            //   decoration: BoxDecoration(
            //     gradient: const LinearGradient(
            //       // begin: Alignment.centerLeft,
            //       // end: Alignment.centerRight,
            //       colors: <Color>[
            //         Color.fromRGBO(255, 241, 255, 1.0),
            //         Color.fromRGBO(243, 231, 255, 1.0),
            //       ],
            //     ),
            //     borderRadius: BorderRadius.circular(15),
            //   ),
            //   //width: 240,
            //   child: const TextField(
            //     decoration: InputDecoration(
            //         // border: OutlineInputBorder(
            //         //   borderRadius: BorderRadius.all(
            //         //     Radius.circular(15.0),
            //         //   ),
            //         // ),
            //         // focusedBorder: OutlineInputBorder(
            //         //   borderSide: BorderSide(color: LightColor.purple),
            //         //   borderRadius: BorderRadius.all(
            //         //     Radius.circular(15.0),
            //         //   ),
            //         // ),
            //         // prefixIcon: Icon(Icons.all_inbox_outlined),
            //         border: InputBorder.none,
            //         hintText: "Referral Code",
            //         filled: true,
            //         hintStyle: TextStyle(color: Colors.grey)
            //     ),
            //   ),
            //),

            const SizedBox(
              height: 20,
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, Dashboard.routeName);
                // Navigator.of(context).push(
                //     MaterialPageRoute(builder: (context) =>
                //          const Dashboard(),));
              },
              textColor: Colors.white,
              padding: const EdgeInsets.all(0.0),
              shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              child: Container(
                width: 150,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[
                        LightColor.yorange,
                        LightColor.ypurple,
                      ],
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10.0))
                ),
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: const Align(
                  alignment: Alignment.center,
                  child: Text(
                      'Enter',
                      style: TextStyle(fontSize: 20)
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );


  }

}
