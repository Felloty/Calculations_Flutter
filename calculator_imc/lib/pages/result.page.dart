import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final double imc;

  const ResultPage({Key? key, required this.imc}) : super(key: key);

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
    List results = getResult();
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Row(
            children: const [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text("Результат",
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
                ),
              )
            ],
          ),
        ),
        Expanded(
          flex: 12,
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
                        Expanded(
                          flex: 4,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(results[0].toUpperCase(),
                                  style: TextStyle(
                                      color: results[1],
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(imc.toString(),
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 60,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(results[2],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 18)),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  List getResult() {
    if (imc < 0) {
      return [
        "Некорректно введённые данные, повторите попытку",
        Colors.orangeAccent,
        "Стоимость оплаты не может быть меньше нуля!"
      ];
    } else {
      return [
        "Ваша стоимость оплаты в рублях",
        Colors.greenAccent,
        "Стоимость оплаты соответствует диапазону!"
      ];
    }
  }
}
