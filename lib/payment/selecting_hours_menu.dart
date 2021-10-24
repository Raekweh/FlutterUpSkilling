import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_braintree/flutter_braintree.dart';

class SelectingHours extends StatefulWidget {
  const SelectingHours({Key? key}) : super(key: key);

  @override
  _SelectingHoursState createState() => _SelectingHoursState();
}

class _SelectingHoursState extends State<SelectingHours> {
  TextEditingController _hoursController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('payment'),
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back), onPressed: () {
            Navigator.pop(context);
          },
          )
        ),
        body: Center(
            child: Column(children: <Widget>[
          Container(
            child: Text(
              'Select Hours',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
          ),
          Container(
            child: TextField(
              controller: _hoursController,
              keyboardType: TextInputType.number,
              style: TextStyle(fontSize: 15, color: Colors.black),
            ),
          ),
          Container(
              child: FlatButton(
            onPressed: () async {
              var request = BraintreeDropInRequest(
                tokenizationKey: 'sandbox_v236wq6h_cxbs52ptwm5vd2hf',
                collectDeviceData: true,
                paypalRequest: BraintreePayPalRequest(
                  amount: '${int.parse(_hoursController.text) * 3}',
                ),
                cardEnabled: true,
              );
              BraintreeDropInResult? result =
                  await BraintreeDropIn.start(request);
              if (result != null) {
                print(result.paymentMethodNonce.description);
                print(result.paymentMethodNonce.nonce);
              }
            },
            child: Text('Pay'),
            color: Colors.blueAccent,
          ))
        ])));
  }
}
