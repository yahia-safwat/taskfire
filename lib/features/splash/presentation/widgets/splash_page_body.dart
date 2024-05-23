import 'package:flutter/material.dart';

class SplashPageBody extends StatelessWidget {
  const SplashPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Image(
          image: AssetImage('assets/images/app-logo.png'),
          width: 200,
          height: 200,
        ),
        SizedBox(
          height: 24,
        ),
        Text(
          'Enjoy a Productive Day with TaskFire',
          style: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600),
        ),
      ]),
    );
  }
}
