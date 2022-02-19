import 'package:flutter/material.dart';
import 'package:yozu/theme/color/light_color.dart';
import 'package:yozu/utils/size_config.dart';

import 'chat_screen.dart';

class Dashboard extends StatefulWidget {
  static const routeName = '/dashboard-screen';

  final String title, uid;
  const Dashboard({Key key, this.title, this.uid}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          //height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                PreferredSize(
                  child: AppBar(
                    elevation: 0.0,
                    brightness: Brightness.light,
                    backgroundColor: LightColor.yboxbackpurple,
                    automaticallyImplyLeading: false,
                    centerTitle: true,
                    leading: IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        size: 28,
                        color: Colors.black,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                    title: const Text(
                      "YoZu",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // actions:  <Widget>[
                    //   InkWell(
                    //     onTap: (){
                    //       Navigator.of(context).push(
                    //           MaterialPageRoute(builder: (context) =>
                    //           const MessageScreen(chatDetails: '',)));
                    //
                    //     },
                    //     child: const Padding(
                    //       padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                    //       child: Icon(
                    //         Icons.copy_outlined,
                    //         color: Colors.black87,
                    //       ),
                    //     ),
                    //   )
                    //   //	circleAppBarImage()
                    // ],
                  ),
                  preferredSize: Size.square(kToolbarHeight),
                ),
                const SizedBox(
                  height: 30,
                ),


                Container(
                  height: 120,
                  // color: Colors.purple,
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Container(
                        width: 120,
                        height: 120,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20.0),
                              bottomRight: Radius.circular(20.0),
                              topLeft: Radius.circular(20.0),
                              bottomLeft: Radius.circular(20.0)),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.network('https://i.guim.co.uk/img/media/5cbce71c025dd78ca31d03111bd2ee4453a7029e/0_167_2400_1440/master/2400.jpg?width=1200&height=1200&quality=85&auto=format&fit=crop&s=8e818fc25e718ede0125e1443112a757'),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 120,
                        height: 120,
                        //   decoration: BoxDecoration(
                        //     color: Colors.cyan,
                        //   borderRadius: BorderRadius.only(
                        //       topRight: Radius.circular(20.0),
                        //       bottomRight: Radius.circular(20.0),
                        //       topLeft: Radius.circular(20.0),
                        //       bottomLeft: Radius.circular(20.0)),
                        // ),

                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20.0),
                              bottomRight: Radius.circular(20.0),
                              topLeft: Radius.circular(20.0),
                              bottomLeft: Radius.circular(20.0)),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.network('https://www.uidownload.com/files/167/477/242/science-elements-with-a-scientist.jpg'),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 120,
                        height: 120,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20.0),
                              bottomRight: Radius.circular(20.0),
                              topLeft: Radius.circular(20.0),
                              bottomLeft: Radius.circular(20.0)),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.network('https://cdn4.vectorstock.com/i/1000x1000/55/98/scientists-man-at-work-vector-17125598.jpg'),
                        ),
                        // child: Image.network('https://cdn4.vectorstock.com/i/1000x1000/55/98/scientists-man-at-work-vector-17125598.jpg'),
                      ),
                    ],
                  ),
                ),

                Container(
                  margin: EdgeInsets.fromLTRB(20, 20, 20, 15),
                  // padding: EdgeInsets.fromLTRB(25, 15, 25, 15),
                  height: SizeConfig.screenHeight/2 + 160,

                  child: MessageScreen(chatDetails: '',),
                  // child: Container(
                  //
                  //   decoration: const BoxDecoration(
                  //     color: Colors.redAccent,
                  //     borderRadius: BorderRadius.only(
                  //         topRight: Radius.circular(20.0),
                  //         bottomRight: Radius.circular(20.0),
                  //         topLeft: Radius.circular(20.0),
                  //         bottomLeft: Radius.circular(20.0)),
                  //   ),
                  //   child: Align(
                  //     alignment: Alignment.bottomCenter,
                  //     child: Row(
                  //       children: [
                  //         Container(
                  //           margin: EdgeInsets.all(10),
                  //           color: Colors.cyan,
                  //           height: 60,
                  //           width: 270,
                  //         ),
                  //         Container(
                  //           margin: EdgeInsets.all(10),
                  //           color: Colors.cyan,
                  //           height: 60,
                  //           width: 50,
                  //         ),
                  //       ],
                  //
                  //     ),
                  //   ),
                  //   //padding: EdgeInsets.fromLTRB(25, 15, 25, 15),
                  // ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
