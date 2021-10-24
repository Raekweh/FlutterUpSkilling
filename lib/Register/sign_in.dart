import 'package:flutter/material.dart';

import 'auth.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.brown,
      appBar:AppBar(
        backgroundColor: Colors.brown,
        elevation: 0.0,
        title: Text('Sign in')
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: RaisedButton(
          child: const Text('Signin Anon'),
          onPressed: () async
          {
            dynamic result = await _authService.signInAnon();
            if(result == null)
              {
                print('error signing in');
              }
            else
              {
                print('signed in');
                print(result.uid);
              }
          },
        )
      ),
    );
  }
}
