import 'package:edspertid/src/blocs/banner/banner_bloc.dart';
import 'package:edspertid/src/ui/widgets/partials/banner_item.dart';
import 'package:edspertid/src/values/strings.dart';
import 'package:edspertid/src/values/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BannerSection extends StatelessWidget {
  const BannerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          CustomString.bannerText,
          style: CustomTextStyle.sectionTitle,
        ),
        BlocBuilder<BannerBloc, BannerState>(
            builder: (context, state) {
              if (state is BannerSuccess) {
                return SizedBox(
                  height: 146,
                  child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, i) => BannerItem(
                          imageSrc: state.bannerList[i].eventImage),
                      separatorBuilder: (context, i) =>
                      const SizedBox(width: 8),
                      itemCount: state.bannerList.length),
                );
              }

              return const Center(
                child: CircularProgressIndicator(),
              );
            })
      ],
    );
  }
}
