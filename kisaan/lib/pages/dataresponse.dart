import 'package:flutter/material.dart';

class DataResponse extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550 ? 500 : deviceWidth * 0.95;
    final double targetPadding = deviceWidth - targetWidth;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(title: Text("Predicted Data"),),
        body: Container(
          margin: EdgeInsets.all(10),
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: targetPadding / 2),
            children: <Widget>[
              SizedBox(
                height: 15,
              ),
              Text('hey'),
              SizedBox(
                height: 15,
              ),
              // GestureDetector(
              //   child: Container(
              //     child: Text('My Button'),
              //     color: Colors.lightGreenAccent,
              //     padding: EdgeInsets.all(5),
              //   ),
              //   onTap: _submitForm,
              // )
            ],
          ),
        ),
      ),
    );
  }
}
