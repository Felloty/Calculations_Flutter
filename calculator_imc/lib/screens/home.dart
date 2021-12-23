import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Помощник студента МТУСИ"),
        backgroundColor: Colors.deepPurple,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: this.selectedIndex,
        backgroundColor: Colors.deepPurple,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_balance_wallet,
              color: Colors.white,
            ),
            title: Text(
              "Работа",
              style: TextStyle(color: Colors.white),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.assignment,
              color: Colors.white,
            ),
            title: Text(
              "Учеба",
              style: TextStyle(color: Colors.white),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.apartment,
              color: Colors.white,
            ),
            title: Text(
              "Общага",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
        onTap: (int index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, "/first");
              break;
            case 1:
              Navigator.pushNamed(context, "/second");
              break;
            case 2:
              Navigator.pushNamed(context, "/third");
              break;
            case 3:
              Navigator.pushNamed(context, "/fourth");
              break;
          }
        },
      ),
    );
  }
}
