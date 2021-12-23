import 'package:calculator_imc/pages/result.page.dart';
import 'package:calculator_imc/widgets/button.sex.widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _currentSliderValue = 6;
  int _currentAgeValue = 800;
  int _currentWeightValue = 20;
  bool active = true;
  double imc = 0.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Калькулятор Стоимости Проживания"),
        backgroundColor: Colors.deepPurple,
      ),
      body: _body(),
    );
  }

  _body() {
    return Column(
      children: [
        Expanded(
          flex: 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              ButtonSex(
                title: "Второе общежитие",
                icon: "assets/man-white.png",
                color: !active ? Colors.deepPurple.shade300 : Colors.deepPurple,
                method: () {
                  setState(() {
                    active = !active;
                  });
                },
              ),
              ButtonSex(
                title: "Четвёртое общежитие",
                icon: "assets/girl-white.png",
                color: active ? Colors.deepPurple.shade300 : Colors.deepPurple,
                method: () {
                  setState(() {
                    active = !active;
                  });
                },
              ),
            ],
          ),
        ),
        Expanded(
          flex: 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    color: Colors.deepPurple,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Кол-во квадратных метров",
                            style: TextStyle(color: Colors.white)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${_currentSliderValue.toInt()}",
                              style: const TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.bold),
                            ),
                            const Text("m²",
                                style: TextStyle(color: Colors.white),
                                textAlign: TextAlign.end),
                          ],
                        ),
                        Slider(
                          value: _currentSliderValue,
                          min: 6,
                          max: 24,
                          divisions: 24,
                          activeColor: Colors.white,
                          inactiveColor: Colors.white,
                          thumbColor: Colors.white,
                          label: _currentSliderValue.round().toString(),
                          onChanged: (double value) {
                            setState(() {
                              _currentSliderValue = value;
                            });
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _getCard(
                  title: "Кол-во прожитых дней",
                  currentValue: _currentWeightValue,
                  methodRemove: () {
                    setState(() {
                      _currentWeightValue--;
                    });
                  },
                  methodAdd: () {
                    setState(() {
                      _currentWeightValue++;
                    });
                  }),
              _getCard(
                  title: "Дотация от профсоюза в рублях",
                  currentValue: _currentAgeValue,
                  methodRemove: () {
                    setState(() {
                      _currentAgeValue--;
                    });
                  },
                  methodAdd: () {
                    setState(() {
                      _currentAgeValue++;
                    });
                  }),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  child: Container(
                    color: Colors.deepPurple,
                    child: const Center(
                      child: Text(
                        "Подсчёт",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  onTap: () {
                    imc = (12 * _currentSliderValue * _currentWeightValue -
                        _currentAgeValue);
                    //imc = ((imc * 1000).ceil() / 1000);
                    print(imc);

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResultPage(imc: imc)));
                  },
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  _getCard(
      {required String title,
      int currentValue = 0,
      dynamic methodRemove,
      dynamic methodAdd}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          color: Colors.deepPurple,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title, style: const TextStyle(color: Colors.white)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${currentValue.toInt()}",
                    style: const TextStyle(
                        fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: MaterialButton(
                          onPressed: methodRemove,
                          child: const Icon(Icons.remove),
                          shape: const CircleBorder(side: BorderSide.none),
                          color: Colors.white),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: MaterialButton(
                          onPressed: methodAdd,
                          child: const Icon(Icons.add),
                          shape: const CircleBorder(side: BorderSide.none),
                          color: Colors.white),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
