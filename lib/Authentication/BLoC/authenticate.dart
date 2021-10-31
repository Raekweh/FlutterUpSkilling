import 'package:ParkingApp/Authentication/UI/register_menu.dart';
import 'package:ParkingApp/Authentication/UI/log_in_menu.dart';
import 'package:flutter/cupertino.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showSignin = true;
  void toogleView()
  {
    setState(() => showSignin =!showSignin);
  }

  @override
  Widget build(BuildContext context) {
    if(showSignin)
      {
        return LoginMenu(toogleView: toogleView);
      }
    else
      {
        return RegisterMenu(toogleView: toogleView);
      }
  }
}
