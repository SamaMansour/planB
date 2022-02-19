import 'package:flutter/material.dart';
import 'package:planb/constants.dart';

class RoundedButton extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: newElevatedButton(),
      ),
    );
  }

  //Used:ElevatedButton as FlatButton is deprecated.
  //Here we have to apply customizations to Button by inheriting the styleFrom

  Widget newElevatedButton() {
    return ElevatedButton(
      child: Text(
      'Welcome',
        style: TextStyle(color: Colors.purple),
      ),
      onPressed:(){

      } ,
      style: ElevatedButton.styleFrom(
          primary: Colors.purple,
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          textStyle: TextStyle(
              color: Colors.purple, fontSize: 14, fontWeight: FontWeight.w500)),
    );
  }
}