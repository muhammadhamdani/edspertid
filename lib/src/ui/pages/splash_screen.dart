import 'package:edspertid/src/ui/pages/auth/login_screen.dart';
import 'package:edspertid/src/ui/pages/tabs_screen.dart';
import 'package:edspertid/src/values/colors.dart';
import 'package:edspertid/src/values/strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(const Duration(seconds: 3)).then((value) =>
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => LoginScreen(title: CustomString.loginTitle)
            )
        )
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.primary,
      body: Center(child: Image.asset('assets/images/logo.png')),
    );
  }
}
