import 'package:chat_bot_flutter/src/core/services/routes/routes.dart';
import 'package:chat_bot_flutter/src/core/utils/assets.dart';
import 'package:flutter/material.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: size.height * .15),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.center,
              child: Text(
                'Your AI Assistant',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.5,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(
                  size.width * .01, size.height * .01, 0, 0),
              width: size.width * .8,
              alignment: Alignment.center,
              child: const Text(
                'Using this software,you can ask you questions and receive articles using artificial intelligence assistant',
                style: TextStyle(
                  letterSpacing: 1,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                size.width * .15,
                size.height * .1,
                size.width * .15,
                size.height * .1,
              ),
              child: Image.asset(
                Assets.onBoardingImage,
              ),
            ),
            SizedBox(height: size.height * .06),
            SizedBox(
              width: size.width * .9,
              height: size.height * .06,
              child: TextButton(
                onPressed: () {
                  Navigator.popAndPushNamed(context, Routes.inbox);
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: size.width * .01,
                    ),
                    const Text(
                      'Continue',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: size.width * .06,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
