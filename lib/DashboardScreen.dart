import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'ChatScreen.dart';
import 'DoctorAiMain.dart';
import 'DoctorProfile.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Stack(
                alignment: Alignment.topLeft,
                children: [
                  Container(
                    margin: const EdgeInsets.all(0),
                    padding: const EdgeInsets.all(0),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.15,
                    decoration: BoxDecoration(
                      color: const Color(0xff07f3de),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.zero,
                      border:
                          Border.all(color: const Color(0x4d9e9e9e), width: 1),
                    ),
                  ),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(16, 24, 16, 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  "Chikitsak",
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 22,
                                    color: Color(0xff020000),
                                  ),
                                ),
                                Text(
                                  "Ai",
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 22,
                                    color: Color(0xfffba808),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(16, 0, 16, 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Icon(
                              Icons.adjust,
                              color: Color(0xff110101),
                              size: 20,
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(4, 0, 0, 0),
                              child: Text(
                                "- Innovation Saving Life",
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.clip,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14,
                                  color: Color(0xff130101),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      "DashBoard",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        fontSize: 16,
                        color: Color(0xff000000),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(0),
                padding: const EdgeInsets.all(0),
                height: 100,
                decoration: const BoxDecoration(
                  color: Color(0x1fffffff),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.zero,
                ),
                child: ListView(
                  scrollDirection: Axis.vertical,
                  padding: const EdgeInsets.fromLTRB(10, 0, 15, 0),
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  children: [
                    ///***If you have exported images you must have to copy those images in assets/images directory.
                    Image.asset(
                      "assets/pc.png",
                      height: 140,
                      width: 140,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      "Functions",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        fontSize: 16,
                        color: Color(0xff000000),
                      ),
                    ),
                  ],
                ),
              ),
              GridView(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 0.7,
                ),
                children: [
                  GestureDetector(
                    onTap: () {
                      // Handle container tap
                      // Navigate to DoctorProfile.dart page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DoctorAimain(),
                        ),
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.all(0),
                      padding: const EdgeInsets.all(0),
                      width: 200,
                      height: 100,
                      decoration: const BoxDecoration(
                        color: Color(0x00ffffff),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.zero,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.all(0),
                            padding: const EdgeInsets.all(0),
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 203, 220, 222),
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child:

                                ///***If you have exported images you must have to copy those images in assets/images directory.

                                Image.asset(
                              "assets/qna.jpg",
                              // image: AssetImage("images/qna.jpg"),
                              height: 40,
                              width: 40,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                            child: Text(
                              "ChikitsakAI",
                              textAlign: TextAlign.start,
                              maxLines: 1,
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 14,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      // Handle container tap
                      // Open Netmeds online website
                      launch('https://www.netmeds.com/');
                    },
                    child: Container(
                      margin: const EdgeInsets.all(0),
                      padding: const EdgeInsets.all(0),
                      width: 200,
                      height: 100,
                      decoration: const BoxDecoration(
                        color: Color(0x00ffffff),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.zero,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.all(0),
                            padding: const EdgeInsets.all(0),
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 203, 220, 222),
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child:

                                ///***If you have exported images you must have to copy those images in assets/images directory.
                                Image.asset(
                              "assets/online.jpg",
                              height: 40,
                              width: 40,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                            child: Text(
                              "OrderMedi",
                              textAlign: TextAlign.start,
                              maxLines: 1,
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 14,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Handle container tap
                      // Navigate to Settings.dart page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DoctorProfile(),
                        ),
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.all(0),
                      padding: const EdgeInsets.all(0),
                      width: 200,
                      height: 100,
                      decoration: const BoxDecoration(
                        color: Color(0x00000000),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.zero,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.all(0),
                            padding: const EdgeInsets.all(0),
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 203, 220, 222),
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child:

                                ///***If you have exported images you must have to copy those images in assets/images directory.
                                Image.asset(
                              "assets/doctorM.png",
                              height: 40,
                              width: 40,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                            child: Text(
                              "Doctors",
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 14,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(0),
                    padding: const EdgeInsets.all(0),
                    width: 200,
                    height: 100,
                    decoration: const BoxDecoration(
                      color: Color(0x00ffffff),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.zero,
                    ),

                    /// --------------------------------------------------------------
                    //   child: Column(
                    //     mainAxisAlignment: MainAxisAlignment.start,
                    //     crossAxisAlignment: CrossAxisAlignment.center,
                    //     mainAxisSize: MainAxisSize.max,
                    //     children: [
                    //       Container(
                    //         alignment: Alignment.center,
                    //         margin: EdgeInsets.all(0),
                    //         padding: EdgeInsets.all(0),
                    //         width: 70,
                    //         height: 70,
                    //         decoration: BoxDecoration(
                    //           color: Color(0xffffffff),
                    //           shape: BoxShape.rectangle,
                    //           borderRadius: BorderRadius.circular(8.0),
                    //         ),
                    //         child:

                    //             ///***If you have exported images you must have to copy those images in assets/images directory.
                    //             Image(
                    //           image: AssetImage("images/ambu.png"),
                    //           height: 40,
                    //           width: 40,
                    //           fit: BoxFit.cover,
                    //         ),
                    //       ),
                    //       Padding(
                    //         padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                    //         child: Text(
                    //           "Ambulance",
                    //           textAlign: TextAlign.start,
                    //           maxLines: 1,
                    //           overflow: TextOverflow.clip,
                    //           style: TextStyle(
                    //             fontWeight: FontWeight.w400,
                    //             fontStyle: FontStyle.normal,
                    //             fontSize: 14,
                    //             color: Color(0xff000000),
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // Container(
                    //   alignment: Alignment.center,
                    //   margin: EdgeInsets.all(0),
                    //   padding: EdgeInsets.all(0),
                    //   width: 200,
                    //   height: 100,
                    //   decoration: BoxDecoration(
                    //     color: Color(0x00ffffff),
                    //     shape: BoxShape.rectangle,
                    //     borderRadius: BorderRadius.zero,
                    //   ),
                    // child: Column(
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    //   crossAxisAlignment: CrossAxisAlignment.center,
                    //   mainAxisSize: MainAxisSize.max,
                    //   children: [
                    //     Container(
                    //       alignment: Alignment.center,
                    //       margin: EdgeInsets.all(0),
                    //       padding: EdgeInsets.all(0),
                    //       width: 70,
                    //       height: 70,
                    //       decoration: BoxDecoration(
                    //         color: Color(0xffffffff),
                    //         shape: BoxShape.rectangle,
                    //         borderRadius: BorderRadius.circular(8.0),
                    //       ),
                    //       child:

                    //           ///***If you have exported images you must have to copy those images in assets/images directory.
                    //           Image(
                    //         image: AssetImage("images/report.png"),
                    //         height: 40,
                    //         width: 40,
                    //         fit: BoxFit.cover,
                    //       ),
                    //     ),
                    //     Padding(
                    //       padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                    //       child: Text(
                    //         "Reports",
                    //         textAlign: TextAlign.start,
                    //         overflow: TextOverflow.clip,
                    //         style: TextStyle(
                    //           fontWeight: FontWeight.w400,
                    //           fontStyle: FontStyle.normal,
                    //           fontSize: 14,
                    //           color: Color(0xff000000),
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),

                    /// -------------------------------------------------
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 60,
          color: const Color.fromARGB(255, 5, 241, 241),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: const Icon(Icons.chat),
                onPressed: () {
                  // Navigate to ChatScreen.dart page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ChatScreen(),
                    ),
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.home),
                onPressed: () {
                  // Do something
                },
              ),
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {
                  // Navigate to Settings.dart page
                  //  Navigator.push(
                  //    context,
                  //    MaterialPageRoute(
                  //      builder: (context) => Settings(),
                  //    ),
                  //  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
