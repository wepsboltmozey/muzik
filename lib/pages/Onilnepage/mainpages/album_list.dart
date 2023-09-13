import 'package:flutter/material.dart';
import 'package:muzik_app/pages/Onilnepage/mainpages/musicdetail.dart';
import 'package:muzik_app/widgets/constants.dart';
import 'package:muzik_app/widgets/small_text.dart';

import '../../../api_management/model.dart';
import '../../../api_management/services.dart';

class AlbumList extends StatefulWidget {
  const AlbumList({Key? key}) : super(key: key);

  @override
  State<AlbumList> createState() => _AlbumListState();
}

class _AlbumListState extends State<AlbumList> {
  List<MusicDataResponse> musicList = [];

  @override
  void initState() {
    super.initState();
    fetchMusicData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(backgroundColor: colorOne, body: customListCard()));
  }

  Future<void> fetchMusicData() async {
    final musiclist = await ApiService().getAllFetchMusicData();
    setState(() {
      musicList = musiclist;
    });
  }

  Widget customListCard() {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      MusicDetailPage(response: musicList[index]),
                ));
          },
          child: Container(
            color: colorfive,
            margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 8, bottom: 8, right: 8, top: 4),
                    child: SizedBox(
                      child: FadeInImage.assetNetwork(
                          height: 60,
                          width: 60,
                          placeholder: "lib/assets/images/off.jpg",
                          image: musicList[index].image.toString(),
                          fit: BoxFit.fill),
                    ),
                  ),
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SmallText(
                        text: musicList[index].title.toString(),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      SmallText(text: musicList[index].artist.toString())
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
      itemCount: musicList.length,
    );
  }
}
