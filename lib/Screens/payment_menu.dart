import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ParkingApp/Payment/selecting_hours_menu.dart';
import 'package:ParkingApp/Payment/validation.dart';

class Payment extends StatelessWidget {
  TextEditingController areaIDController = TextEditingController();
  TextEditingController vechileIDController = TextEditingController();
  Validation _validation = new Validation();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              title: Text('Payment'),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Center(
                  child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Area ID',
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      controller: areaIDController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Area ID',
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Vechile ID',
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      controller: vechileIDController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Vechile ID',
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(25),
                    child: FlatButton(
                      child: Text(
                        'Next',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      color: Colors.blueAccent,
                      textColor: Colors.white,
                      onPressed: () {
                        if (_validation
                                .validVehiclePlate(vechileIDController.text) &&
                            _validation.validAreaID(areaIDController.text)) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SelectingHours()));
                        } else {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  _buildPopupDialog(context));
                        }
                      },
                    ),
                  ),
                ],
              )),
            )));
  }
}

Widget _buildPopupDialog(BuildContext context) {
  return new AlertDialog(
    title: const Text('Error'),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Please check your inputs"),
      ],
    ),
    actions: <Widget>[
      new FlatButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        textColor: Theme.of(context).primaryColor,
        child: Text('Close'),
      ),
    ],
  );
}