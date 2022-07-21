import 'package:flutter/material.dart';
import 'package:workout_app_by_ikkoy/about_me.dart';
import 'package:workout_app_by_ikkoy/bench_press_exercise.dart';
import 'package:workout_app_by_ikkoy/meditating.dart';

import 'package:workout_app_by_ikkoy/pull_up_exercise.dart';

class MenuSide extends StatelessWidget {
  const MenuSide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey[200],
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('Giganius Chadson'),
            accountEmail: const Text('ikkoy@workx.com'),
            currentAccountPicture: ClipOval(
              child: Image.asset(
                'images/gigachad.jpg',
                width: 90,
                height: 90,
                fit: BoxFit.cover,
              ),
            ),
            decoration: const BoxDecoration(
              color: Colors.deepPurple,
            ),
          ),
          ListTile(
            leading: const ImageIcon(AssetImage('images/icon/pull_up_icon.png'),
                size: 30),
            title: const Text('Pull Up'),
            onTap: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                    builder: (context) => const PullUpExercise())),
          ),
          ListTile(
            leading: const ImageIcon(
                AssetImage('images/icon/bench_press_icon.png'),
                size: 30),
            title: const Text('Bench Press'),
            onTap: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                    builder: (context) => const BenchPressExercise())),
          ),
          ListTile(
            leading: const ImageIcon(
                AssetImage('images/icon/meditate_icon.png'),
                size: 30),
            title: const Text('Meditating'),
            onTap: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                    builder: (context) => const MeditateExercise())),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('About Me'),
            onTap: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const AboutMe())),
          ),
        ],
      ),
    );
  }
}
