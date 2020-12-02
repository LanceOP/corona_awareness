import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';
import 'package:photo_view/photo_view.dart';
class Protective extends StatefulWidget {
  @override
  _ProtectiveState createState() => _ProtectiveState();
}

class _ProtectiveState extends State<Protective> {
  String bullet = "\u2022 ";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Protective measures',style:GoogleFonts.montserrat(fontWeight: FontWeight.bold),),
      ),
      body: PhotoViewGallery.builder(
        itemCount: imgList.length,
        builder: (context, index) {
          return PhotoViewGalleryPageOptions(
            imageProvider: AssetImage(imgList[index]),
            minScale: PhotoViewComputedScale.contained * 0.8,
            maxScale: PhotoViewComputedScale.covered * 2,
          );
        },
      ),
    );
  }
}
