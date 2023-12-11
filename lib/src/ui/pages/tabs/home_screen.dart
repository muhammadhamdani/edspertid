import 'package:edspertid/src/blocs/auth/auth_bloc.dart';
import 'package:edspertid/src/ui/widgets/sections/banner_section.dart';
import 'package:edspertid/src/ui/widgets/sections/box_home_section.dart';
import 'package:edspertid/src/ui/widgets/sections/course_section.dart';
import 'package:edspertid/src/values/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: CircleAvatar(
              radius: 18,
              backgroundImage: NetworkImage(CustomString.placeholderImage),
            ),
          )
        ],
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              CustomString.appName,
              style: const TextStyle(
                  fontSize: 12, fontWeight: FontWeight.w600),
            ),
            Text(
              CustomString.greeting,
              style: const TextStyle(
                  fontSize: 12, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 18),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BoxHomeSection(),
              CourseSection(),
              SizedBox(height: 27),
              BannerSection(),
            ],
          ),
        ),
      ),
    );
  }
}
