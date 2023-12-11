import 'package:edspertid/src/blocs/auth/auth_bloc.dart';
import 'package:edspertid/src/blocs/navigation/navigation_bloc.dart';
import 'package:edspertid/src/ui/pages/auth/login_screen.dart';
import 'package:edspertid/src/ui/pages/tabs/account_screen.dart';
import 'package:edspertid/src/ui/pages/tabs/discussion_screen.dart';
import 'package:edspertid/src/ui/pages/tabs/home_screen.dart';
import 'package:edspertid/src/values/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabsScreen extends StatelessWidget {
  const TabsScreen({super.key});

  static List<Widget> navigationList = <Widget>[
    HomeScreen(title: CustomString.homeTitle),
    DiscussionScreen(title: CustomString.homeTitle),
    AccountScreen(title: CustomString.homeTitle),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NavigationBloc, NavigationState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.grey.shade100,
          body: navigationList.elementAt(state.currentNavigation),
          bottomNavigationBar: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
            child: BottomNavigationBar(
              currentIndex: state.currentNavigation,
              onTap: (index) {
                BlocProvider.of<NavigationBloc>(context)
                    .add(NavigationTabChange(currentNavigation: index));
              },
              backgroundColor: Colors.white,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.chat),
                  label: 'Diskusi Soal',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle),
                  label: 'Account',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
