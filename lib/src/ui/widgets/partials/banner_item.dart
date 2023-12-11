import 'package:edspertid/src/values/styles.dart';
import 'package:flutter/material.dart';

class BannerItem extends StatelessWidget {
  const BannerItem({super.key, required this.imageSrc});

  final String imageSrc;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: 284,
        height: 146,
        child: Image.network(
          imageSrc,
          errorBuilder: (context, error, stackTrace) {
            return Text(
                'No Img',
                textAlign: TextAlign.center,
                style: CustomTextStyle.noImage
            );
          },
        ),
      ),
    );
  }
}
