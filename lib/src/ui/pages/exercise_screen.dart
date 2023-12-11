import 'package:edspertid/src/blocs/exercise/exercise_bloc.dart';
import 'package:edspertid/src/ui/widgets/partials/exercise_item.dart';
import 'package:edspertid/src/values/colors.dart';
import 'package:edspertid/src/values/strings.dart';
import 'package:edspertid/src/values/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExerciseScreen extends StatelessWidget {
  const ExerciseScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: CustomColor.primary,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          title,
          style: CustomTextStyle.appTitle,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Text(
              CustomString.selectExercise,
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 12),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: BlocBuilder<ExerciseBloc, ExerciseState>(
                builder: (context, state) {
                  if (state is ExerciseSuccess) {
                    return GridView.builder(
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.4,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                        ),
                        shrinkWrap: true,
                        itemCount: state.exerciseList.length,
                        itemBuilder: (context, i) {
                          return ExerciseItem(
                              exerciseData: state.exerciseList[i]);
                        });
                  }

                  if(state is ExerciseFailed){
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/notfound.png'),
                          const Text(
                            'Yah, Paket Tidak Tersedia',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                              'Tenang, masih banyak yang bisa kamu pelajari.\n cari lagi yuk!',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500))
                        ],
                      ),
                    );
                  }

                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
