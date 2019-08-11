import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:kisaan/models/language.dart';
import 'package:kisaan/pages/dataresponse.dart';

class DataEntry extends StatefulWidget {
  @override
  _DataEntryState createState() => _DataEntryState();
}

class _DataEntryState extends State<DataEntry> {
  LangMode _langMode = LangMode.English;
  final Map<String, dynamic> _formData = {
    'crop': null,
    'name': null,
    'temp': null,
    'humidity': null,
    'pressure': null,
    // 'waterQty': null,
    'soilFertility': null,
    'lightIntensity': null,
  };
  final Map<String, dynamic> _responseData = {
    'crop': null,
    'name': null,
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
        labelText:
            '${_langMode == LangMode.English ? 'Crop name' : 'फसल का नाम'}',
        hintText:
            '${_langMode == LangMode.English ? 'Enter Crop name.' : 'फसल का नाम दर्ज करें।'}',
      ),
      controller: _cropNameTextController,
      // initialValue: product == null ? null : product.title,
      validator: (String value) {
        if (value.isEmpty) {
          return '${_langMode == LangMode.English ? "Crop name is required and can't be empty" : 'फसल का नाम आवश्यक है और खाली नहीं हो सकता'}';
        }
        return null;
      },
      onSaved: (String value) {
        _formData['crop'] = _cropNameTextController.text;
      },
    );
  }

  Widget _buildPlaceNameTextField() {
    if (_placeNameTextController.text.trim() == '') {
      _placeNameTextController.text = '';
    }
    return TextFormField(
      decoration: InputDecoration(
        labelText:
            '${_langMode == LangMode.English ? 'Place name' : 'स्थान का नाम'}',
        hintText:
            '${_langMode == LangMode.English ? 'Enter place' : 'जगह दर्ज करें'}',
      ),
      controller: _placeNameTextController,
      // initialValue: product == null ? null : product.title,
      validator: (String value) {
        if (value.isEmpty) {
          return '${_langMode == LangMode.English ? "Place Name is required and can't be empty" : 'जगह का नाम आवश्यक है और खाली नहीं हो सकता'}';
        }
        return null;
      },
      onSaved: (String value) {
        _formData['name'] = _placeNameTextController.text;
      },
    );
  }

  Widget _buildTempTextField() {
    if (_tempTextController.text.trim() == '') {
      _tempTextController.text = '';
    }
    return TextFormField(
      decoration: InputDecoration(
        labelText: '${_langMode == LangMode.English ? 'Temp' : 'तापमान'}',
        hintText:
            '${_langMode == LangMode.English ? 'Enter Temprature' : 'तापमान दर्ज करें'}',
      ),
      controller: _tempTextController,
      keyboardType: TextInputType.number,
      // initialValue: product == null ? null : product.title,
      validator: (String value) {
        if (value.isEmpty) {
          return '${_langMode == LangMode.English ? "Temprature is required and can't be empty" : 'अस्थायी आवश्यकता है और खाली नहीं हो सकता'}';
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
        labelText: '${_langMode == LangMode.English ? 'Humidity' : 'नमी'}',
        hintText:
            '${_langMode == LangMode.English ? 'Enter Humidity' : 'आर्द्रता दर्ज करें'}',
      ),
      controller: _humidityTextController,
      keyboardType: TextInputType.number,
      // initialValue: product == null ? null : product.title,
      validator: (String value) {
        if (value.isEmpty) {
          return '${_langMode == LangMode.English ? "Humidity input is required and can't be empty" : 'आर्द्रता इनपुट की आवश्यकता है और खाली नहीं हो सकता'}';
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
        labelText:
            '${_langMode == LangMode.English ? 'Air Pressure' : 'हवा का दबाव'}',
        hintText:
            '${_langMode == LangMode.English ? 'Enter Pressure' : 'वायु दाब प्रविष्ट करें'}',
      ),
      controller: _pressureTextController,
      keyboardType: TextInputType.number,
      // initialValue: product == null ? null : product.title,
      validator: (String value) {
        if (value.isEmpty) {
          return '${_langMode == LangMode.English ? "Pressure is required and can't be empty" : 'दबाव की आवश्यकता है और खाली नहीं हो सकता'}';
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
        labelText:
            '${_langMode == LangMode.English ? 'Soil fertility' : 'मिट्टी की उर्वरता'}',
        hintText:
            '${_langMode == LangMode.English ? 'Enter Soil Fertility' : 'मृदा उर्वरता दर्ज करें'}',
      ),
      controller: _soilFertilityTextController,
      keyboardType: TextInputType.number,
      // initialValue: product == null ? null : product.title,
      validator: (String value) {
        if (value.isEmpty) {
          return '${_langMode == LangMode.English ? "Soil Fertility is required and can't be empty" : 'मृदा उर्वरता आवश्यक है और खाली नहीं हो सकती'}';
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
        labelText:
            '${_langMode == LangMode.English ? 'Light Intensity' : 'प्रकाश की तीव्रता'}',
        hintText:
            '${_langMode == LangMode.English ? 'Enter Intensity of light' : 'प्रकाश की तीव्रता दर्ज करें'}',
      ),
      controller: _lightIntensityTextController,
      keyboardType: TextInputType.number,
      // initialValue: product == null ? null : product.title,
      validator: (String value) {
        if (value.isEmpty) {
          return '${_langMode == LangMode.English ? "Light Intensity is required and can't be empty" : 'प्रकाश की तीव्रता की आवश्यकता है और खाली नहीं हो सकता'}';
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
        child: Text(
            '${_langMode == LangMode.English ? 'Predict' : 'भविष्यवाणी करें'}'),
        color: Theme.of(context).accentColor,
        onPressed: () async {
          _formKey.currentState.validate();
          _formKey.currentState.save();
          print(json.encode(_formData));

          try  {
            print('hey');
            final http.Response response = await http.post(
                'https://codeforvision.pythonanywhere.com/api',
                body: json.encode(_formData));
            print(response);
            final Map<String, dynamic> responseData =
                json.decode(response.body);
            final Map<String, dynamic> recievedId = {'id': responseData['id']};
            final http.Response finalResponse = await http.post(
                'https://codeforvision.pythonanywhere.com/api/getwaterlevel',
                body: json.encode(recievedId));
            print(finalResponse);
            
          } catch (error) {
            return false;
          }

          _responseData['crop'] = _formData['crop'];
          _responseData['name'] = _formData['name'];
          _responseData['temp'] = _formData['temp'];
          _responseData['humidity'] = _formData['humidity'];
          _responseData['pressure'] = _formData['pressure'];
          _responseData["soilFertility"] = _formData['soilFertility'];
          _responseData['lightIntensity'] = _formData['lightIntensity'];
          _responseData['waterQty'] = 10;

          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => DataResponse(_responseData)));
          return true;
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
        actions: <Widget>[
          IconButton(
            onPressed: () {
              if (_langMode == LangMode.English) {
                setState(() {
                  _langMode = LangMode.Hindi;
                });
              } else {
                setState(() {
                  _langMode = LangMode.English;
                });
              }
            },
            icon: Icon(Icons.translate),
          )
        ],
      ),
      body: _buildPageContent(context),
    );
  }
}

// 'https://codeforvision.pythonanywhere.com/api'
