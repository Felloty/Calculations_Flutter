import 'package:flutter/material.dart';
import 'package:calculator_imc/pages/home.page.dart';

class ObshagaPage extends StatelessWidget {
  const ObshagaPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Калькулятор Стоимости',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: const HomePage(),
    );
  }
}
