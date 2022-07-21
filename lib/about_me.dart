import 'package:flutter/material.dart';
import 'package:workout_app_by_ikkoy/sidebar.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('About Me'),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          // background image and bottom contents
          Column(
            children: <Widget>[
              SizedBox(
                height: 200.0,
                width: double.infinity,
                child: Image.asset(
                  'images/baground_images.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: const Center(
                    child: Text(
                      'Zidane Ikkoy Ramadhan'
                      '\nlinkedin.com/ikkoyramadhan/',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),

          Positioned(
            top: 150.0,
            child: Container(
              height: 100.0,
              width: 100.0,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/ikkoy.jpeg'),
                  fit: BoxFit.cover,
                ),
                shape: BoxShape.circle,
              ),
            ),
          )
        ],
      ),
      drawer: const MenuSide(),
    );
  }
}
