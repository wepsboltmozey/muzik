import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muzik_app/controllers/playercontroller.dart';
import 'package:muzik_app/widgets/constants.dart';
import 'package:muzik_app/widgets/small_text.dart';
import 'package:on_audio_query/on_audio_query.dart';

class offline extends StatefulWidget {
  const offline({super.key});

  @override
  State<offline> createState() => _offlineState();
}

class _offlineState extends State<offline> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabcontroller = TabController(length: 4, vsync: this);
    var controller = Get.put(Playercontroller());
    return SafeArea(
      child: Scaffold(
        backgroundColor: colorOne,
        body: SingleChildScrollView(
          child: Container(
            color: colorOne,
            width: double.maxFinite,
            height: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.only(left: 30, right: 30),
                  child: TextField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: "Search for music",
                        hintStyle: TextStyle(
                            color: colorfour,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.8),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            width: 1,
                            style: BorderStyle.solid,
                          ),
                        ),
                        filled: true,
                        fillColor: colortwo,
                        contentPadding: EdgeInsets.all(12),
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TabBar(
                        labelPadding: EdgeInsets.only(left: 20, right: 20),
                        controller: _tabcontroller,
                        unselectedLabelColor: colorfour,
                        labelColor: colorfive,
                        isScrollable: true,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicatorColor: colortwo,
                        tabs: [
                          Tab(
                            text: "Songs",
                          ),
                          Tab(
                            text: "PlayList",
                          ),
                          Tab(
                            text: "Folders",
                          ),
                          Tab(
                            text: "Artists",
                          )
                        ]),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    width: double.maxFinite,
                    height: 630,
                    child: FutureBuilder<List<SongModel>>(
                      future: controller.audioQuery.querySongs(
                          ignoreCase: true,
                          orderType: OrderType.ASC_OR_SMALLER,
                          sortType: null,
                          uriType: UriType.EXTERNAL),
                      builder: (context, snapshot) {
                        if (snapshot.data == null) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (snapshot.data!.isEmpty) {
                          return SmallText(text: "No Song is found");
                        } else {
                          return TabBarView(
                              controller: _tabcontroller,
                              children: [
                                Container(
                                    decoration: BoxDecoration(color: colorOne),
                                    child: ListView.builder(
                                        itemCount: snapshot.data!.length,
                                        scrollDirection: Axis.vertical,
                                        physics: BouncingScrollPhysics(),
                                        itemBuilder: (context, int index) {
                                          return Container(
                                              color: colortwo,
                                              margin: EdgeInsets.only(
                                                  left: 20,
                                                  right: 20,
                                                  bottom: 5,
                                                  top: 5),
                                              child: Obx(
                                                () => ListTile(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15)),
                                                  tileColor: colorfive,
                                                  title: SmallText(
                                                      text: snapshot
                                                          .data![index]
                                                          .displayNameWOExt),
                                                  subtitle: SmallText(
                                                      text:
                                                          "${snapshot.data![index].artist}"),
                                                  leading: QueryArtworkWidget(
                                                    id: snapshot
                                                        .data![index].id,
                                                    type: ArtworkType.AUDIO,
                                                    nullArtworkWidget:
                                                        Container(
                                                      width: 50,
                                                      child: Image.asset(
                                                          "lib/assets/images/online.jpg"),
                                                    ),
                                                  ),
                                                  trailing: controller.playIndex
                                                                  .value ==
                                                              index &&
                                                          controller
                                                              .isplaying.value
                                                      ? Icon(
                                                          Icons.play_arrow,
                                                          color: colorfour,
                                                        )
                                                      : null,
                                                  onTap: () {
                                                    controller.playSong(
                                                        snapshot
                                                            .data![index].uri,
                                                        index);
                                                  },
                                                ),
                                              ));
                                        })),
                                Text("cdjhjh"),
                                Text("jvjw"),
                                Text("jvjw")
                              ]);
                        }
                      },
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
