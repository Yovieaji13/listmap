import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


// import 'package:flutter/services.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double input = 0;
  double kelvin = 0;
  double reamur = 0;
  var listItem = ["Kelvin", "Reamur"];
  final inputController = TextEditingController();
  String _newValue = "Kelvin";

  get result => null;
  // double _result = 0;

  void inputRumus() {
    setState(() {
      input = double.parse(inputController.text);
      kelvin = input + 273;
      reamur = (4 / 5) * input;
    });
  }

  // void perhitunganSuhu() {
  //   setState(() {
  //     var _inputUser = double.parse(inputController.text);
  //     if (_newValue == "Kelvin")
  //       _result = _inputUser + 273;
  //     else
  //       _result = (4 / 5) * _inputUser;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Konverter Suhu"),
        ),
        body: Container(
            margin: EdgeInsets.all(8),
            child: Column(
              children: [
                TextFormField(
                  controller: inputController,
                  decoration: InputDecoration(
                    hintText: "Masukkan Suhu Dalam Celcius",
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9+\,]'))
                  ],
                  keyboardType: TextInputType.numberWithOptions(
                      decimal: true, signed: false),
                ),
                DropdownButton<String>(
                  items: listItem.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  value: _newValue,
                  onChanged: (String changeValue) {
                    setState(() {
                      _newValue = changeValue;
                    });
                  },
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Hasil",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      result.toStringAsFixed(1),
                      style: TextStyle(fontSize: 30),
                    )
                  ],
                ),
                RaisedButton(
                    color: Colors.blue,
                    onPressed: inputRumus,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Konversi Suhu',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    )),
              ],
            )),
      ),
    );
  }
}
