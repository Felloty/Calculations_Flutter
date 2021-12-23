import 'package:flutter/material.dart';
import 'package:calculator_imc/screens/home.dart';
import 'package:calculator_imc/screens/obshaga.dart';
import 'package:calculator_imc/screens/study.dart';
import 'package:calculator_imc/screens/work.dart';

void main() {
  //runApp(const CalculatorIMCApp());
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => MyHomePage(),
      '/first': (context) => WorkPage(),
      '/second': (context) => StudyPage(),
      '/third': (context) => const ObshagaPage(),
    },
  ));
}
