import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kisaan/pages/dataresponse.dart';

class DataEntry extends StatefulWidget {
  @override
  _DataEntryState createState() => _DataEntryState();
}

class _DataEntryState extends State<DataEntry> {
  final Map<String, dynamic> _formData = {
    'cropName': null,
    'placeName': null,
    'temp': null,
    'humidity': null,
    'pressure': null,
    // 'waterQty': null,
    'soilFertility': null,
    'lightIntensity': null,
  };
  final Map<String, dynamic> _responseData = {
    'cropName': null,
    'placeName': null,
    'temp': null,
    'humidity': null,
    'pressure': null,
    'waterQty': null,
    'soilFertility': null,
    'lightIntensity': null,
  };
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _cropNameTextController = TextEditingController();
  final _placeNameTextController = TextEditingController();
  final _tempTextController = TextEditingController();
  final _humidityTextController = TextEditingController();
  final _pressureTextController = TextEditingController();
  // final _waterQtyTextController = TextEditingController();
  final _soilFertilityTextController = TextEditingController();
  final _lightIntensityTextController = TextEditingController();

  Widget _buildCropNameTextField() {
    if (_cropNameTextController.text.trim() == '') {
      _cropNameTextController.text = '';
    }
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Crop name',
        hintText: 'Enter Crop name.',
      ),
      controller: _cropNameTextController,
      // initialValue: product == null ? null : product.title,
      validator: (String value) {
        if (value.isEmpty) {
          return "Crop name is required and can't be empty";
        }
        return null;
      },
      onSaved: (String value) {
        _formData['cropName'] = _cropNameTextController.text;
      },
    );
  }

  Widget _buildPlaceNameTextField() {
    if (_placeNameTextController.text.trim() == '') {
      _placeNameTextController.text = '';
    }
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'place name',
        hintText: 'Enter place',
      ),
      controller: _placeNameTextController,
      // initialValue: product == null ? null : product.title,
      validator: (String value) {
        if (value.isEmpty) {
          return "Place Name is required and can't be empty";
        }
        return null;
      },
      onSaved: (String value) {
        _formData['placeName'] = _placeNameTextController.text;
      },
    );
  }

  Widget _buildTempTextField() {
    if (_tempTextController.text.trim() == '') {
      _tempTextController.text = '';
    }
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Temp',
        hintText: 'Enter Temprature',
      ),
      controller: _tempTextController,
      keyboardType: TextInputType.number,
      // initialValue: product == null ? null : product.title,
      validator: (String value) {
        if (value.isEmpty) {
          return "Temprature is required and can't be empty";
        }
        return null;
      },
      onSaved: (String value) {
        _formData['temp'] = double.parse(_tempTextController.text);
      },
    );
  }

  Widget _buildHumidityTextField() {
    if (_humidityTextController.text.trim() == '') {
      _humidityTextController.text = '';
    }
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Humidity',
        hintText: 'Enter Humidity',
      ),
      controller: _humidityTextController,
      keyboardType: TextInputType.number,
      // initialValue: product == null ? null : product.title,
      validator: (String value) {
        if (value.isEmpty) {
          return "Humidity input is required and can't be empty";
        }
        return null;
      },
      onSaved: (String value) {
        _formData['humidity'] = double.parse(_humidityTextController.text);
      },
    );
  }

  Widget _buildPressureTextField() {
    if (_pressureTextController.text.trim() == '') {
      _pressureTextController.text = '';
    }
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Pressure',
        hintText: 'Enter Pressure',
      ),
      controller: _pressureTextController,
      keyboardType: TextInputType.number,
      // initialValue: product == null ? null : product.title,
      validator: (String value) {
        if (value.isEmpty) {
          return "Pressure is required and can't be empty";
        }
        return null;
      },
      onSaved: (String value) {
        _formData['pressure'] = double.parse(_pressureTextController.text);
      },
    );
  }

  // Widget _buildWaterQtyTextField() {
  //   if (_waterQtyTextController.text.trim() == '') {
  //     _waterQtyTextController.text = '';
  //   }
  //   return TextFormField(
  //     decoration: InputDecoration(
  //       labelText: 'Water Qty',
  //       hintText: 'Enter Water Qty',
  //     ),
  //     controller: _waterQtyTextController,
  //     // initialValue: product == null ? null : product.title,
  //     validator: (String value) {
  //       if (value.isEmpty || value.length < 5) {
  //         return "Water Qty is required and can't be empty";
  //       }
  //       return null;
  //     },
  //     onSaved: (String value) {
  //       _formData['waterQty'] = _waterQtyTextController.text;
  //     },
  //   );
  // }

  Widget _buildSoilFertilityTextField() {
    if (_soilFertilityTextController.text.trim() == '') {
      _soilFertilityTextController.text = '';
    }
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Soil fertility',
        hintText: 'Enter Soil Fertility',
      ),
      controller: _soilFertilityTextController,
      keyboardType: TextInputType.number,
      // initialValue: product == null ? null : product.title,
      validator: (String value) {
        if (value.isEmpty) {
          return "Soil Fertility is required and can't be empty";
        }
        return null;
      },
      onSaved: (String value) {
        _formData['soilFertility'] =
            double.parse(_soilFertilityTextController.text);
      },
    );
  }

  Widget _buildLightIntensityTextField() {
    if (_lightIntensityTextController.text.trim() == '') {
      _lightIntensityTextController.text = '';
    }
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Light Intensity',
        hintText: 'Enter Intensity of light',
      ),
      controller: _lightIntensityTextController,
      keyboardType: TextInputType.number,
      // initialValue: product == null ? null : product.title,
      validator: (String value) {
        if (value.isEmpty) {
          return "Light Intensity is required and can't be empty";
        }
        return null;
      },
      onSaved: (String value) {
        _formData['lightIntensity'] =
            double.parse(_lightIntensityTextController.text);
      },
    );
  }

  Widget _buildSubmitButton() {
    return Center(
      child: RaisedButton(
        child: Text('Predict'),
        color: Theme.of(context).accentColor,
        onPressed: () {
          _formKey.currentState.validate();
          _formKey.currentState.save();
          print(json.encode(_formData));

          _responseData['cropName'] = _formData['cropName'];
          _responseData['placeName'] = _formData['placeName'] ;
          _responseData['temp'] = _formData['temp'];
          _responseData['humidity'] = _formData['humidity'];
          _responseData['pressure'] = _formData['pressure'];
          _responseData["soilFertility"] = _formData['soilFertility'];
          _responseData['lightIntensity'] = _formData['lightIntensity'];
          _responseData['waterQty'] = 10;

          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => DataResponse()));
          
        },
      ),
    );
  }

  Widget _buildPageContent(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550 ? 500 : deviceWidth * 0.95;
    final double targetPadding = deviceWidth - targetWidth;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Container(
        margin: EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: targetPadding / 2),
            children: <Widget>[
              _buildCropNameTextField(),
              _buildPlaceNameTextField(),
              _buildTempTextField(),
              _buildHumidityTextField(),
              _buildPressureTextField(),
              // _buildWaterQtyTextField(),
              _buildSoilFertilityTextField(),
              _buildLightIntensityTextField(),

              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 15,
              ),
              _buildSubmitButton(),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kisaan'),
      ),
      body: _buildPageContent(context),
    );
  }
}
