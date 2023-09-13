import 'package:flutter/material.dart';
import 'package:muzik_app/widgets/constants.dart';

import '../pages/Onilnepage/mainpages/album_view.dart';

class AlbumCard extends StatelessWidget {
  final ImageProvider image;
  final String label;
  final Function onTap;
  final double size;
  const AlbumCard({
    Key? key,
    required this.image,
    required this.label,
    required this.onTap,
    this.size = 120,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AlbumView(
              image: image,
            ),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            image: image,
            width: size,
            height: size,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10),
          Text(
            label,
            style: TextStyle(color: colorfour, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class RowAlbumCard extends StatelessWidget {
  final AssetImage image;
  final String label;
  RowAlbumCard({
    Key? key,
    required this.image,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        margin: EdgeInsets.only(
          left: 20,
        ),
        decoration: BoxDecoration(
          color: colorfive,
          borderRadius: BorderRadius.circular(10),
        ),
        clipBehavior: Clip.antiAlias,
        child: Row(
          children: [
            Image(
              image: image,
              height: 90,
              width: 48,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(color: colorfour, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
