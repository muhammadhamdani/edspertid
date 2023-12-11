import 'package:edspertid/src/blocs/auth/auth_bloc.dart';
import 'package:edspertid/src/ui/pages/auth/register_screen.dart';
import 'package:edspertid/src/ui/pages/tabs_screen.dart';
import 'package:edspertid/src/ui/widgets/partials/custom_button.dart';
import 'package:edspertid/src/values/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        // TODO: implement listener
        if(state is AuthFailed){
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }

        if(state is AuthSuccess){
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                  const TabsScreen()
              )
          );
        }
      },
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.grey.shade100,
            body: SafeArea(
                child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 32),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            CustomString.loginTitle,
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Image.asset('assets/images/login_image.png'),
                      const SizedBox(height: 56),
                      Text(
                        CustomString.greeting,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 22,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        CustomString.greetingSub,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Color(0xFF6A7483),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      CustomButton(
                        buttonText: CustomString.loginWithGoogle,
                        buttonIcon: 'assets/images/google.png',
                        buttonColor: Colors.black,
                        buttonTextColor: Colors.white,
                        fullWidth: false,
                        width: 190,
                        height: 40,
                        onPressed: () {
                          context.read<AuthBloc>().add(
                              SignInWithGoogleEvent());
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => RegisterScreen(
                          //             title: CustomString.registerTitle)
                          //     )
                          // );
                        },
                      ),
                      CustomButton(
                        buttonText: CustomString.loginWithApple,
                        buttonIcon: 'assets/images/apple.png',
                        buttonColor: Colors.black,
                        buttonTextColor: Colors.white,
                        fullWidth: false,
                        width: 190,
                        height: 40,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            )),
          );
        },
      ),
    );
  }
}
