import 'package:edspertid/src/values/colors.dart';
import 'package:edspertid/src/values/strings.dart';
import 'package:flutter/material.dart';

class BoxHomeSection extends StatelessWidget {
  const BoxHomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 147,
      width: double.infinity,
      padding: const EdgeInsets.only(left: 20, top: 26),
      decoration: BoxDecoration(
          color: CustomColor.primary,
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              CustomString.bannerHomeText,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: Align(
                alignment: Alignment.bottomRight,
                child: Image.asset('assets/images/home_banner.png')),
          ),
        ],
      ),
    );
  }
}
