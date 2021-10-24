import 'package:ParkingApp/Register/wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'auth.dart';
import 'models/app_user.dart';

class logIn extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return StreamProvider<AppUser?>.value(
        value: AuthService().user,
        initialData: null,
        child:const MaterialApp(
          home:Wrapper(),
        )
    );
  }
}