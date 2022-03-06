//NAMA : DWIARY PM
//NIM  : 2031710115
//KONVERTER SUHU JOBSHEET 3 PEMROGRAMAN MOBILE
import 'dart:html';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController controller1 = TextEditingController();

  double D = 0;
  double P = 0;
  double M = 0;

  void Convert() {
    setState(() {
      D = double.parse(controller1.text);
      M = 0.8 * D;
      P = D + 273;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Jobsheet Pertemuan 2",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Konverter Suhu Dwiary'),
        ),
        body: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            children: [
              Input(controller1: controller1),
              SizedBox(
                height: 100,
                width: 100,
              ),
              Result(),
              Result1(P: P, M: M),
              SizedBox(
                height: 200,
                width: 250,
              ),
              Container(
                width: double.infinity,
                height: 40,
                child: RaisedButton(
                  onPressed: Convert,
                  color: Colors.blueAccent,
                  textColor: Colors.white,
                  child: Text('Konversi Suhu'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Input extends StatelessWidget {
  const Input({
    Key? key,
    required this.controller1,
  }) : super(key: key);

  final TextEditingController controller1;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller1,
      decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Masukkan Suhu Dalam Celcius'),
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
    );
  }
}

class Result1 extends StatelessWidget {
  const Result1({
    Key? key,
    required this.P,
    required this.M,
  }) : super(key: key);

  final double P;
  final double M;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('$P', style: TextStyle(fontSize: 30)),
        SizedBox(
          width: 300,
          height: 100,
        ),
        Text('$M', style: TextStyle(fontSize: 30))
      ],
    );
  }
}

class Result extends StatelessWidget {
  const Result({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text('Suhu dalam Kelvin'),
        SizedBox(
          width: 200,
        ),
        Text('Suhu dalam Reamur'),
      ],
    );
  }
}
