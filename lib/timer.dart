import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HabitTile extends StatelessWidget {
  final String habitName;
  final VoidCallback onTap;
  final VoidCallback settingsTap;
  final int timeSpent;
  final int timeGoal;

  final bool habitStarted;

  const HabitTile({
    Key? key,
    required this.habitName,
    required this.onTap,
    required this.settingsTap,
    required this.timeSpent,
    required this.timeGoal,
    required this.habitStarted,
  }) : super(key: key);

  String formatMinToSec(int totalSeconds) {
    String sec = (totalSeconds % 60).toString();
    String min = (totalSeconds ~/ 60).toStringAsFixed(1);
    if (sec.length == 1) {
      '$sec ${0}  $sec';
    }

    if (min[1] == '.') {
      min = min.substring(0, 1);
    }
    return '$min:$sec';
  }

  double percentCompleted() {
    return timeSpent / (timeGoal * 60);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        padding: const EdgeInsets.all(25.0),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: onTap,
                  child: SizedBox(
                    height: 60,
                    width: 60,
                    child: Stack(
                      children: [
                        CircularPercentIndicator(
                          radius: 30,
                          percent:
                              percentCompleted() < 1 ? percentCompleted() : 1,
                          progressColor: percentCompleted() > 0.5
                              ? (percentCompleted() > 0.75
                                  ? Colors.green
                                  : Colors.orange)
                              : Colors.red,
                        ),
                        Center(
                          child: Icon(
                            habitStarted ? Icons.pause : Icons.play_arrow,
                            size: 35,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 40,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      habitName,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${formatMinToSec(timeSpent)} |  ${(percentCompleted() * 100).toStringAsFixed(0)} %',
                    ),
                  ],
                ),
              ],
            ),
            GestureDetector(
              onTap: settingsTap,
              child: const Icon(Icons.settings),
            ),
          ],
        ),
      ),
    );
  }
}
