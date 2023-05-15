import 'package:flutter/material.dart';
import 'debute.dart';

class DebutsPage extends StatelessWidget {
  final List<String> debuts = [
    'Sicilian Defense',
    'French Defense',
    'Ruy López Opening',
    'Caro-Kann Defense',
    'Italian Game',
    'Scandinavian Defense',
    "King's Indian Defense",
    "Slav Defense",
    "King's Gambit",
    "Queen's Gambit",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffda79),
      appBar: AppBar(
        title: Text('Best Debuts'),
        backgroundColor: Color(0xffcc8e35),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: debuts.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xffcc8e35),
                  padding: EdgeInsets.all(15),
                ),
                child: Text(
                  debuts[index],
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewPage(inputString: debuts[index], number: index,),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
