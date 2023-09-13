import 'package:flutter/material.dart';
import 'package:muzik_app/pages/offlinepage.dart';
import 'package:muzik_app/widgets/constants.dart';
import 'package:muzik_app/widgets/largeText.dart';
import 'package:muzik_app/widgets/small_text.dart';

import 'Onilnepage/mainpages/main_online_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        color: colorOne,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.maxFinite,
              height: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: colorOne,
                  image: DecorationImage(
                      image: AssetImage("lib/assets/images/music1.jpg"),
                      fit: BoxFit.cover)),
            ),
            Center(
                child: LargeText(
              text: "Muzik",
              size: 50,
              color: colortwo,
            )),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: LargeText(
                text: "choose to play",
                color: colorfour,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MainOnlinePage()));
                      },
                      child: Container(
                        width: 170,
                        height: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: colorOne,
                            image: DecorationImage(
                                image:
                                    AssetImage("lib/assets/images/online.jpg"),
                                fit: BoxFit.cover)),
                        child: Center(
                            child: Container(
                                margin: EdgeInsets.only(top: 140),
                                child: SmallText(
                                  text: "play online",
                                  size: 22,
                                ))),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => offline()));
                      },
                      child: Container(
                        width: 170,
                        height: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: colorOne,
                            image: DecorationImage(
                                image: AssetImage("lib/assets/images/off.jpg"),
                                fit: BoxFit.cover)),
                        child: Center(
                            child: Container(
                                margin: EdgeInsets.only(top: 140),
                                child: SmallText(
                                  text: "device storage",
                                  size: 22,
                                ))),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
