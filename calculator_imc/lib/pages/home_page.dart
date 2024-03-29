import 'package:flutter/material.dart';
import 'package:calculator_imc/models/todo_model.dart';
import 'package:calculator_imc/widgets/todo_item.dart';

class HomePage1 extends StatefulWidget {
  @override
  _HomePageState1 createState() => _HomePageState1();
}

class _HomePageState1 extends State<HomePage1> {
  List<TodoModel> todos = [];
  TextEditingController todoController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 70,
              ),
              //NOTE: TITLE
              Text(
                "Todo List",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 30,
              ),
              //NOTE: Todo List
              Expanded(
                  child: Column(
                children: todos
                    .map((item) => TodoItem(
                          title: item.title,
                        ))
                    .toList(),
              )),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(
                  bottom: 50,
                ),
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: todoController,
                          decoration: InputDecoration.collapsed(
                              hintText: "Add todo..."),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          print(todoController.text);
                          setState(() {
                            todos.add(TodoModel(
                                title: todoController.text, isDone: false));
                            todoController.text = "";
                          });
                        },
                        child: Icon(
                          Icons.add,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
