import 'package:flutter/material.dart';

import 'package:planb/screens/Welcome/components/background.dart';
import 'package:planb/widgets/roundedButton.dart';
import 'package:planb/constants.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "WELCOME TO EDU",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.05),
            SvgPicture.asset(
              "assets/icons/chat.svg",
              height: size.height * 0.45,
            ),
            SizedBox(height: size.height * 0.05),
            RoundedButton(
              // text: "LOGIN",
              // press: () {
              //   // Navigator.push(
              //   //   context,
              //   //   MaterialPageRoute(
              //   //     builder: (context) {
              //   //       //return LoginScreen();
              //   //     },
              //   //   ),
              //   // );
             // },
            ),
            RoundedButton(
              // text: "SIGN UP",
              // color: kPrimaryLightColor,
              // textColor: Colors.black,
              // press: () {
              //   // Navigator.push(
              //   //   context,
              //   //   MaterialPageRoute(
              //   //     // builder: (context) {
              //   //     //   //return SignUpScreen();
              //   //     // },
              //   //   ),
              //   // );
              //},
            ),
          ],
        ),
      ),
    );
  }
}