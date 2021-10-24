import 'package:flutter/material.dart';
import 'auth.dart';

class RegisterMenu extends StatefulWidget {

  final Function toogleView;
  RegisterMenu({required this.toogleView});

  @override
  _RegisterMenuState createState() => _RegisterMenuState();
}

class _RegisterMenuState extends State<RegisterMenu> {

  final AuthService _authService = AuthService();

  String email = '';
  String password ='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        elevation: 0.0,
        title: Text('Register'),
        centerTitle: true,
        actions: <Widget>[
        FlatButton.icon(
          icon: Icon(Icons.person),
          label: Text('Log In'),
          onPressed: () {
            widget.toogleView();
          },
        )
      ],
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20.0,),
                  TextFormField(
                    onChanged: (val)
                    {
                      setState(() => email = val);
                    },
                  ),
                  SizedBox(height: 20.0,),
                  TextFormField(
                    obscureText: true,
                    onChanged: (val)
                    {
                      setState(() => password = val);
                    },
                  ),
                  SizedBox(height: 20.0,),
                  RaisedButton
                    (
                    color:Colors.blueAccent,
                    child: Text('Register',
                        style: TextStyle(color:Colors.white)),
                    onPressed: () async
                    {
                      print(email);
                      print(password);
                    },
                  )
                ],
              )
          )
      ),
    );
  }
}
