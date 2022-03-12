import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

   String? email;
  bool logged = false;

  String password = " ";
  String alertText = " ";

  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  bool val = false;
  late String _myFromLocationsResult = " ";
  late String _myToLocationsResult = " ";

  late List<String> _myFromLocations = [];
  late List<String> _myToLocations = [];

  bool isValidEmail(value) {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(value);
  }

  //Password Validation

  bool isValidPassword(value) {
    final passwordRegExp = new RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    return passwordRegExp.hasMatch(value);
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _imageContainer(),
               
                _emailTFTextField(),
               
                _passwordTextField(),
               
                _forgotPassword(),
                _alertText(),
                _submitButton(),
              ],
            ),
          ),
        ),
      ),
    ));
  }

  Widget _imageContainer() {
    return Container(
      height: 200.0,
      child: Image.asset('assets/logo.png'),
    );
  }

 

  Widget _emailTFTextField() {
    return TextFormField(
      textAlign: TextAlign.center,
      validator: (v) {
        if (isValidEmail(v)) {
          email = v!;
          return null;
        } else {
          return 'Please enter a valid email ';
        }
      },
      decoration: InputDecoration(
        hintText: 'Enter Email',
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.purple, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.purple, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
      ),
    );
  }

 

  Widget _passwordTextField() {
    return TextFormField(
      textAlign: TextAlign.center,
      obscureText: true,
      validator: (v) {
        password = v!;
      },
      decoration: InputDecoration(
        hintText: 'Enter Password',
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
      ),
    );
  }

 
  Widget _forgotPassword() {
    return TextButton(
        onPressed: () {
          // Navigator.of(context).pushReplacement(
          //     MaterialPageRoute(builder: (context) => ForgotPassword()));
        },
        child: Text('Forgot Password?'));
  }

  Widget _alertText() {
    return Text(alertText);
  }

  Widget _submitButton() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: Colors.red,
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 400.0,
          height: 42.0,
          child: Text('Login'),
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              final user = _auth
                  .signInWithEmailAndPassword(
                      email: email.toString(), password: password)
                  .catchError((err) {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Wrong email or password"),
                        content: Text(err.message),
                        actions: [
                          FlatButton(
                            child: Text("Ok"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          )
                        ],
                      );
                    });
              });
              final result = _auth.currentUser;

             

              //Navigate Users To their Page

              /*await for (var snapshot
                        in _firestore.collection('users').snapshots()) {
                      for (var savedUser in snapshot.docs) {
                       
                         
                        
                      }
                    }*/

            }
          },
        ),
      ),
      
    );
  }
}