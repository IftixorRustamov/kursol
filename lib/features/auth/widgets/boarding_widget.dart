import 'package:flutter/material.dart';

class BoardingWidget extends StatelessWidget {
  final String text;
  const BoardingWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO: Add background color in theme
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: Stack(
                alignment: Alignment.center,
                children: [Image.asset('assets/images/splash4.png')],
              ),
            ),
            const SizedBox(height: 20),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 40,
                height: 48 / 40,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
