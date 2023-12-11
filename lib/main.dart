import 'package:edspertid/firebase_options.dart';
import 'package:edspertid/src/blocs/auth/auth_bloc.dart';
import 'package:edspertid/src/blocs/banner/banner_bloc.dart';
import 'package:edspertid/src/blocs/course/course_bloc.dart';
import 'package:edspertid/src/blocs/exercise/exercise_bloc.dart';
import 'package:edspertid/src/blocs/navigation/navigation_bloc.dart';
import 'package:edspertid/src/repositories/auth_repository.dart';
import 'package:edspertid/src/repositories/banner_repository.dart';
import 'package:edspertid/src/repositories/course_repository.dart';
import 'package:edspertid/src/repositories/exercise_repository.dart';
import 'package:edspertid/src/ui/pages/splash_screen.dart';
import 'package:edspertid/src/ui/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc(authRepository: AuthRepository())),
        BlocProvider(create: (context) => NavigationBloc()),
        BlocProvider<BannerBloc>(
          create: (context) => BannerBloc(bannerRepository: BannerRepository())
            ..add(GetBannerListEvent()),
        ),
        BlocProvider<CourseBloc>(
          create: (context) => CourseBloc(courseRepository: CourseRepository())
            ..add(GetCourseListEvent(majorName: 'IPA')),
        ),
        BlocProvider(
          create: (context) =>
              ExerciseBloc(exerciseRepository: ExerciseRepository()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
        initialRoute: '/',
        onGenerateRoute: RouteGenerate().generateRoute,
      ),
    );
  }
}
