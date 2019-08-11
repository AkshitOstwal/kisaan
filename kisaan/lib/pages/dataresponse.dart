import 'package:flutter/material.dart';

class DataResponse extends StatelessWidget {
  final Map<String, dynamic> _responseData;
  DataResponse(this._responseData);
  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550 ? 500 : deviceWidth * 0.95;
    final double targetPadding = deviceWidth - targetWidth;
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double targetHeight = deviceHeight *.5;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Predicted Data"),
        ),
        body: Container(
          margin: EdgeInsets.all(10),
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: targetPadding / 2),
            children: <Widget>[
              SizedBox(
                height: 15,
              ),
              Container(height: targetHeight ,
                child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Crop Name : ' + _responseData['crop'],style: TextStyle(fontSize: 20),),
                    Text('Place name : ' + _responseData['name'],style: TextStyle(fontSize: 20),),
                    Text('Temprature : ' + _responseData['temp'].toString(),style: TextStyle(fontSize: 20),),
                    Text('Humidity : ' + _responseData['humidity'].toString(),style: TextStyle(fontSize: 20),),
                    Text(
                        'Air Pressure : ' + _responseData['pressure'].toString(),style: TextStyle(fontSize: 20),),
                    Text('Soil Fertility : ' +
                        _responseData["soilFertility"].toString(),style: TextStyle(fontSize: 20),),
                    Text('Light Intensity : ' +
                        _responseData['lightIntensity'].toString(),style: TextStyle(fontSize: 20),),
                  ],
                ),
              ),
              SizedBox(height: 30,),
              Container(color: Colors.black,height: 2,),
              SizedBox(
                height: 50,
              ),
              Center(
                  child: Text('Water Quantity : ' +
                      _responseData['waterQty'].toString() +
                      ' Litres per Acer',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
            ],
          ),
        ),
      ),
    );
  }
}
