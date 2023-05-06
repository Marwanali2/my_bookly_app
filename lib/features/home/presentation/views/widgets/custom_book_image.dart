import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';
import 'package:lottie/lottie.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({Key? key, required this.imageUrl}) : super(key: key);
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GoRouter.of(context).push(AppRouter.kBookDetailsView),
      child: ClipRRect(

        child: AspectRatio(
          // نسبة العرض الي الطول اللي هتكون ثابتة بداخل ال sizedbox
          aspectRatio: 2.7 / 4,
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            imageBuilder: (context, imageProvider) {
              return  Container(
                decoration: BoxDecoration(
                  border:
                  Border.all(color: Colors.white30, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(18),
                  image:  DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(imageUrl,),
                  ),
                ),
              );
            },
            placeholder: (context, url) =>const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => Container(
              child: Lottie.network("https://assets2.lottiefiles.com/packages/lf20_vzj1xd0x.json"),
              decoration: BoxDecoration(
                border: Border.all(color:Colors.white30, style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(18)
              ),
            ),
          ),
          // child: Container(
          //   // width: 150,
          //   // height: 224,
          //   decoration: BoxDecoration(
          //       border:
          //           Border.all(color: Colors.white30, style: BorderStyle.solid),
          //       borderRadius: BorderRadius.circular(18),
          //       image:  DecorationImage(
          //         fit: BoxFit.fill,
          //         image: NetworkImage(imageUrl,),
          //       ),
          //   ),
          // ),
        ),
      ),
    );
  }
}
