import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentMenu extends StatefulWidget {
  const PaymentMenu({Key? key}) : super(key: key);

  @override
  _PaymentMenuState createState() => _PaymentMenuState();
}

class _PaymentMenuState extends State<PaymentMenu> {
  TextEditingController areaIDController = TextEditingController();
  TextEditingController vechileIDController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(
          title: Text('Payment'),
          centerTitle: true,
        ),
        body: Center(
          child: new Column(children: <Widget>[
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

                },
              ),
            ),
          ],)
        )
      )
    );
  }
}
