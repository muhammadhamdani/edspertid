import 'package:edspertid/src/models/exercise_model.dart';
import 'package:edspertid/src/values/styles.dart';
import 'package:flutter/material.dart';

class ExerciseItem extends StatelessWidget {
  const ExerciseItem({super.key, required this.exerciseData});

  final ExerciseData exerciseData;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.all(11),
              child: Image.network(
                exerciseData.icon,
                errorBuilder: (context, error, stackTrace) {
                  return Text(
                      'No Img',
                      textAlign: TextAlign.center,
                      style: CustomTextStyle.noImage
                  );
                },
              ),
            ),
            const SizedBox(height: 8),
            Text(exerciseData.exerciseTitle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style:
                const TextStyle(fontWeight: FontWeight.w700, fontSize: 12)),
            Text('${exerciseData.jumlahDone}/${exerciseData.jumlahSoal} Soal',
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 8,
                    color: Color(0XFF8E8E8E))),
          ],
        ),
      ),
    );
  }
}
