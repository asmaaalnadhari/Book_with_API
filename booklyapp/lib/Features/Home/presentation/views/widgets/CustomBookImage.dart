import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({Key? key, required this.imgUrl}) : super(key: key);
  final String imgUrl;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
    //  height:MediaQuery.sizeOf(context).height *.3,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: AspectRatio(
          aspectRatio: 2.6/4,
          child: CachedNetworkImage(
            imageUrl:imgUrl,
            fit: BoxFit.fill,
            placeholder:(context, url, ) => const Center(child: CircularProgressIndicator()) ,
            errorWidget: (context, url, error) => const Icon(
              Icons.error,
            ),

          ),
        ),
      ),
    );
  }
}

