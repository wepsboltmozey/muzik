import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:muzik_app/api_management/services.dart';
import 'package:muzik_app/pages/Onilnepage/mainpages/album_list.dart';
import 'package:muzik_app/pages/Onilnepage/mainpages/musicdetail.dart';
import 'package:muzik_app/pages/Onilnepage/mainpages/online_home.dart';
import 'package:muzik_app/widgets/constants.dart';
import 'package:muzik_app/widgets/largeText.dart';
import 'package:muzik_app/widgets/small_text.dart';

import '../../../api_management/model.dart';
import '../../../widgets/album_card.dart';

class AlbumView extends StatefulWidget {
  final ImageProvider image;

  const AlbumView({Key? key, required this.image}) : super(key: key);
  @override
  _AlbumViewState createState() => _AlbumViewState();
}

class _AlbumViewState extends State<AlbumView> {
  ScrollController scrollController = ScrollController();
  // ScrollController scrollController =;
  double imageSize = 0;
  double initialSize = 240;
  double containerHeight = 500;
  double containerinitalHeight = 500;
  double imageOpacity = 1;
  bool showTopBar = false;

  @override
  void initState() {
    imageSize = initialSize;
    scrollController = ScrollController()
      ..addListener(() {
        imageSize = initialSize - scrollController.offset;
        if (imageSize < 0) {
          imageSize = 0;
        }
        containerHeight = containerinitalHeight - scrollController.offset;
        if (containerHeight < 0) {
          containerHeight = 0;
        }
        imageOpacity = imageSize / initialSize;
        if (scrollController.offset > 224) {
          showTopBar = true;
        } else {
          showTopBar = false;
        }
        print(scrollController.offset);
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cardSize = MediaQuery.of(context).size.width / 2 - 32;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: containerHeight,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            color: colortwo,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Opacity(
                  opacity: imageOpacity.clamp(0, 1.0),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.5),
                          offset: Offset(0, 20),
                          blurRadius: 32,
                          spreadRadius: 16,
                        )
                      ],
                    ),
                    child: Image(
                      image: widget.image,
                      width: imageSize,
                      height: imageSize,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              controller: scrollController,
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0),
                          Colors.black.withOpacity(0),
                          Colors.black.withOpacity(1),
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Column(
                        children: [
                          SizedBox(height: initialSize + 32),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SmallText(
                                    text:
                                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum"),
                                SizedBox(height: 8),
                                Row(
                                  children: [
                                    Image(
                                      image: AssetImage(
                                          "lib/assets/images/online.jpg"),
                                      width: 32,
                                      height: 32,
                                    ),
                                    SizedBox(width: 8),
                                    LargeText(text: "Muzik")
                                  ],
                                ),
                                SizedBox(height: 8),
                                SmallText(text: "1,888,132 likes 5h 3m"),
                                SizedBox(height: 16),
                                Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.favorite,
                                          color: colorfive,
                                        ),
                                        SizedBox(width: 16),
                                        Icon(
                                          Icons.more_horiz,
                                          color: colorfive,
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    color: colorOne,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SmallText(
                            text:
                                "text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard "),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "You might also like",
                          style: TextStyle(
                              color: colorfour, fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AlbumCard(
                                size: cardSize,
                                label: "Get Turnt",
                                image:
                                    AssetImage("lib/assets/images/online.jpg"),
                                onTap: () {},
                              ),
                              AlbumCard(
                                size: cardSize,
                                label: "Get Turnt",
                                image:
                                    AssetImage("lib/assets/images/online.jpg"),
                                onTap: () {},
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AlbumCard(
                                size: cardSize,
                                label: "Get Turnt",
                                image:
                                    AssetImage("lib/assets/images/album6.jpg"),
                                onTap: () {},
                              ),
                              AlbumCard(
                                size: cardSize,
                                label: "Get Turnt",
                                image:
                                    AssetImage("lib/assets/images/album9.jpg"),
                                onTap: () {},
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AlbumCard(
                                size: cardSize,
                                label: "Get Turnt",
                                image:
                                    AssetImage("lib/assets/images/album10.jpg"),
                                onTap: () {},
                              ),
                              AlbumCard(
                                size: cardSize,
                                label: "Get Turnt",
                                image:
                                    AssetImage("lib/assets/images/album4.jpg"),
                                onTap: () {},
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          // App bar
          Positioned(
              child: Container(
            child: AnimatedContainer(
              duration: Duration(milliseconds: 250),
              color: showTopBar
                  ? Color(0xFFC61855).withOpacity(1)
                  : Color(0xFFC61855).withOpacity(0),
              padding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              child: SafeArea(
                child: Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        left: 0,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OnlineHomePage()));
                          },
                          child: Icon(
                            Icons.keyboard_arrow_left,
                            size: 38,
                            color: colorfour,
                          ),
                        ),
                      ),
                      // AnimatedOpacity(
                      //   duration: Duration(milliseconds: 250),
                      //   opacity: showTopBar ? 1 : 0,
                      //   child: Text(
                      //     "Ophelia",
                      //     style: Theme.of(context).textTheme.headline6,
                      //   ),
                      // ),
                      Positioned(
                        right: 0,
                        bottom:
                            80 - containerHeight.clamp(120.0, double.infinity),
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        // ignore: prefer_const_constructors
                                        builder: (context) => AlbumList()));
                              },
                              child: Container(
                                width: 64,
                                height: 64,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: colortwo,
                                ),
                                child: Icon(
                                  Icons.play_arrow,
                                  size: 38,
                                  color: colorfour,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ))
        ],
      ),
    );
  }
}
