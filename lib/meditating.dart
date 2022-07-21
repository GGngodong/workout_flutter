import 'dart:async';

import 'package:flutter/material.dart';
import 'package:workout_app_by_ikkoy/timer.dart';
import 'package:workout_app_by_ikkoy/sidebar.dart';

class MeditateExercise extends StatefulWidget {
  const MeditateExercise({Key? key}) : super(key: key);
  @override
  State<MeditateExercise> createState() => _MeditateExerciseState();
}

class _MeditateExerciseState extends State<MeditateExercise> {
  List timerValue = [
    ['Breathing', false, 0, 1],
    ['Rest', false, 0, 1],
  ];

  void habitStarted(int index) {
    var setTime = DateTime.now();
    int elapsedTime = timerValue[index][2];
    setState(() {
      timerValue[index][1] = !timerValue[index][1];
    });

    if (timerValue[index][1] == true) {
      Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          if (!timerValue[index][1]) {
            timer.cancel();
          }

          var currentTime = DateTime.now();
          timerValue[index][2] = elapsedTime +
              currentTime.second -
              setTime.second +
              60 * (currentTime.minute - setTime.minute) +
              60 * 60 * (currentTime.hour - setTime.hour);
        });
      });
    }
  }

  void settingsOpen(int index) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Settings for  ${timerValue[index][0]}'),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Pull Up Exercise'),
        centerTitle: false,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Image.asset('images/meditate.jpg'),
            const Divider(
              height: 20,
              thickness: 5,
              color: Colors.black,
            ),
            const Text(
              'Meditate',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: timerValue.length,
                itemBuilder: (BuildContext context, index) {
                  return HabitTile(
                    habitName: timerValue[index][0],
                    onTap: () {
                      habitStarted(index);
                    },
                    settingsTap: () {
                      settingsOpen(index);
                    },
                    timeSpent: timerValue[index][2],
                    timeGoal: timerValue[index][3],
                    habitStarted: timerValue[index][1],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      drawer: const MenuSide(),
    );
  }
}
