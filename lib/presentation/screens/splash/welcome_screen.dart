import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mycart/presentation/components/buttons.dart';

import '../../../routes.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 60,
            ),
            Text(
              'Welcome to Bolt',
              style:
                  Theme.of(context).textTheme.headline1?.copyWith(fontSize: 20),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'Explore us',
              style:
                  Theme.of(context).textTheme.headline2?.copyWith(fontSize: 18),
            ),
            SizedBox(height: 130),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset(
                'assets/images/login.png',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 130,
            ),
            DefaultButton(
              onPressed: () {
                Navigator.pushNamed(context, Screens.loginScreen);
              },
              lable: 'login',
            ),
            SizedBox(
              height: 15,
            ),
            DefaultButton(
              onPressed: () {
                Navigator.pushNamed(context, Screens.registerScreen);
              },
              lable: 'Sign up',
            )
          ],
        ),
      ),
    );
  }
}
