import 'package:flutter/material.dart';
import 'package:planb/screens/login.dart';
import 'package:planb/screens/signup.dart';
import 'package:planb/widgets/roundedButton.dart';
import 'package:planb/constants.dart';
import 'package:flutter_svg/svg.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
     
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Column(
              children: <Widget>[
                 Text(
                  'PlanB',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                
                   SvgPicture.asset(
                    "assets/chat.svg",
                    height: size.height * 0.45,
                  ),
                  
                
               
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                elevation: 5.0,
                color: Color.fromARGB(255, 187, 150, 187),
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Log In',
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                color: Colors.purple,
                borderRadius: BorderRadius.circular(30.0),
                elevation: 5.0,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SignupScreen()),
                    );
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Signup',
                  ),
                ),
              ),
            ),
           
          ],
        ),
      ),

    );
  }
}