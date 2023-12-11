import 'package:edspertid/src/blocs/auth/auth_bloc.dart';
import 'package:edspertid/src/ui/pages/auth/login_screen.dart';
import 'package:edspertid/src/ui/pages/auth/profile_screen.dart';
import 'package:edspertid/src/values/colors.dart';
import 'package:edspertid/src/values/strings.dart';
import 'package:edspertid/src/values/styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          backgroundColor: CustomColor.primary,
          title: Text(
            CustomString.accountTitle,
            style: const TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.w700),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ProfileScreen(title: CustomString.profileTitle)));
                },
                child: Text(
                  CustomString.edit,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ))
          ],
          centerTitle: true,
        ),
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is AuthFailed) {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (context) =>
                      LoginScreen(title: CustomString.loginTitle)),
              (route) => false,
            );
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 121,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: CustomColor.primary,
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15))),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Email: \n ${user.email}',
                              style: const TextStyle(fontSize: 24),
                              textAlign: TextAlign.center,
                            ),
                            // Text(
                            //   'Muhammad Chamdani Sukron',
                            //   style: TextStyle(
                            //       fontSize: 20,
                            //       color: Colors.white,
                            //       fontWeight: FontWeight.w400),
                            // ),
                            // SizedBox(height: 5),
                            // Text(
                            //   'SMAN 1 Kediri',
                            //   style: TextStyle(
                            //       fontSize: 12,
                            //       color: Colors.white,
                            //       fontWeight: FontWeight.w400),
                            // )
                          ],
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.network(
                              'https://gravatar.com/avatar/6313912d578134001bceb9b6a01fb8fe?s=400&d=mp&r=x',
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Container(
                      height: 330,
                      width: double.infinity,
                      decoration: CustomBoxDecoration.card,
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Identitas Diri',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                            SizedBox(height: 25),
                            Text(
                              'Nama Lengkap',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Muhammad Chamdani Sukron',
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w400),
                            ),
                            SizedBox(height: 15),
                            Text(
                              'Email',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'muhammadhamdani017@gmail.com',
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w400),
                            ),
                            SizedBox(height: 15),
                            Text(
                              'Jenis Kelamin',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Laki-Laki',
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w400),
                            ),
                            SizedBox(height: 15),
                            Text(
                              'Kelas',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'XII-IPA',
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w400),
                            ),
                            SizedBox(height: 15),
                            Text(
                              'Sekolah',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'SMAN 1 Kediri',
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      )),
                  const SizedBox(height: 15),
                  Container(
                    decoration: CustomBoxDecoration.card,
                    child: TextButton(
                        onPressed: () {
                          context.read<AuthBloc>().add(SignOutEvent());
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.exit_to_app,
                              color: Colors.red,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              CustomString.logout,
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.red,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        )
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
