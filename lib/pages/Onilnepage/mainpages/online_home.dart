import 'package:flutter/material.dart';
import 'package:muzik_app/pages/Onilnepage/mainpages/album_list.dart';
import 'package:muzik_app/pages/Onilnepage/mainpages/album_view.dart';
import 'package:muzik_app/pages/Onilnepage/mainpages/musicdetail.dart';
import 'package:muzik_app/widgets/constants.dart';
import 'package:muzik_app/widgets/largeText.dart';

import '../../../widgets/album_card.dart';

class OnlineHomePage extends StatefulWidget {
  const OnlineHomePage({super.key});

  @override
  State<OnlineHomePage> createState() => _OnlineHomePageState();
}

class _OnlineHomePageState extends State<OnlineHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorOne,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          color: colorOne,
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Container(
                  height: 40,
                  padding: EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15), color: colortwo),
                  child: TextField(
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 20,
                        ),
                        hintText: "Search album,song...",
                        hintStyle: TextStyle(
                          color: Colors.white,
                        )),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    margin: EdgeInsets.only(
                      left: 20,
                    ),
                    child: LargeText(text: "Recently PLayed")),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.maxFinite,
                  height: 200,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.all(16),
                    child: Row(
                      children: [
                        AlbumCard(
                          label: "Best Mode",
                          image: AssetImage("lib/assets/images/online.jpg"),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AlbumList(),
                                ));
                          },
                        ),
                        SizedBox(width: 16),
                        AlbumCard(
                          label: "Mot6ivation Mix",
                          image: AssetImage("lib/assets/images/online.jpg"),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AlbumList(),
                                ));
                          },
                        ),
                        SizedBox(width: 11),
                        AlbumCard(
                          label: "Top 50-Global",
                          image: AssetImage("lib/assets/images/online.jpg"),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AlbumList(),
                                ));
                          },
                        ),
                        SizedBox(width: 16),
                        AlbumCard(
                          label: "Power Gaming",
                          image: AssetImage("lib/assets/images/online.jpg"),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AlbumList(),
                                ));
                          },
                        ),
                        SizedBox(width: 16),
                        AlbumCard(
                          label: "Top songs - Global",
                          image: AssetImage("lib/assets/images/online.jpg"),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AlbumList(),
                                ));
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                    margin: EdgeInsets.only(left: 20),
                    child: LargeText(text: "Current Play List")),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          RowAlbumCard(
                            label: "Top 50 - Global",
                            image: AssetImage("lib/assets/images/online.jpg"),
                          ),
                          SizedBox(width: 16),
                          RowAlbumCard(
                            label: "Best Mode",
                            image: AssetImage("lib/assets/images/online.jpg"),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          RowAlbumCard(
                            label: "RapCaviar",
                            image: AssetImage("lib/assets/images/online.jpg"),
                          ),
                          SizedBox(width: 16),
                          RowAlbumCard(
                            label: "Eminem",
                            image: AssetImage("lib/assets/images/online.jpg"),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          RowAlbumCard(
                            label: "Top 50 - USA",
                            image: AssetImage("lib/assets/images/online.jpg"),
                          ),
                          SizedBox(width: 16),
                          RowAlbumCard(
                            label: "Pop Remix",
                            image: AssetImage("lib/assets/images/online.jpg"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
