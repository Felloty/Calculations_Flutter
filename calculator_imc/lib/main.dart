import 'package:flutter/material.dart';
import 'package:calculator_imc/screens/home.dart';
import 'package:calculator_imc/screens/obshaga.dart';
import 'package:calculator_imc/screens/study.dart';
import 'package:calculator_imc/screens/work.dart';

import 'src/basics/04_tweens.dart';

void main() {
  //runApp(const CalculatorIMCApp());
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => MyHomePage(),
      '/first': (context) => const AnimationSamples(),
      '/second': (context) => StudyPage(),
      '/third': (context) => const ObshagaPage(),
    },
  ));
}

class Demo {
  final String name;
  final String route;
  final WidgetBuilder builder;

  const Demo({
    required this.name,
    required this.route,
    required this.builder,
  });
}

final basicDemos = [
  Demo(
      name: 'Заработать',
      route: TweenDemo.routeName,
      builder: (context) => const TweenDemo()),
];

final basicDemoRoutes =
    Map.fromEntries(basicDemos.map((d) => MapEntry(d.route, d.builder)));
final allRoutes = <String, WidgetBuilder>{
  ...basicDemoRoutes,
};

class AnimationSamples extends StatelessWidget {
  const AnimationSamples({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Рабочий процесс',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      routes: allRoutes,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final headerStyle = Theme.of(context).textTheme.headline6;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Рабочий процесс'),
      ),
      body: ListView(
        children: [
          ListTile(title: Text('Прийти на работу и...', style: headerStyle)),
          ...basicDemos.map((d) => DemoTile(demo: d)),
        ],
      ),
    );
  }
}

class DemoTile extends StatelessWidget {
  final Demo demo;

  const DemoTile({required this.demo, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(demo.name),
      onTap: () {
        Navigator.pushNamed(context, demo.route);
      },
    );
  }
}
