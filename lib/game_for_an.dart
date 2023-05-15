import 'package:flutter/material.dart';

List<Map<String, String>> dataArray = [
  {
    'date': '2023-05-01',
    'time': '15:00',
    'side': 'White',
    'opponent': '@panstepan',
    'result': 'Win',
  },
  {
    'date': '2023-05-02',
    'time': '18:30',
    'side': 'White',
    'opponent': '@rayan_gosling',
    'result': 'Loss',
  },
  {
    'date': '2023-05-03',
    'time': '14:15',
    'side': 'Black',
    'opponent': '@undividedchaos',
    'result': 'Draw',
  },
];

class GamePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Game Analysis'),
        backgroundColor: Color(0xffcc8e35), // Зміна кольору верхньої панелі
      ),
      body: Container(
        color: Color(0xffffda79),
        child: ListView.builder(
          itemCount: dataArray.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GameDetailsPage(index),
                  ),
                );
              },
              child: Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                color: Color(0xffcc8e35),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Date: ${dataArray[index]['date']}',
                      style: TextStyle(fontSize: 20), // Збільшення шрифту
                    ),
                    Text(
                      'Time: ${dataArray[index]['time']}',
                      style: TextStyle(fontSize: 20), // Збільшення шрифту
                    ),
                    Text(
                      'Side: ${dataArray[index]['side']}',
                      style: TextStyle(fontSize: 20), // Збільшення шрифту
                    ),
                    Text(
                      'Opponent: ${dataArray[index]['opponent']}',
                      style: TextStyle(fontSize: 20), // Збільшення шрифту
                    ),
                    Text(
                      'Result: ${dataArray[index]['result']}',
                      style: TextStyle(fontSize: 20), // Збільшення шрифту
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class GameDetailsPage extends StatelessWidget {
  final int index;

  GameDetailsPage(this.index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Game Details'),
      ),
      body: Container(
        color: Color(0xffffda79),
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Date: ${dataArray[index]['date']}'),
            Text('Time: ${dataArray[index]['time']}'),
            Text('Side: ${dataArray[index]['side']}'),
            Text('Opponent: ${dataArray[index]['opponent']}'),
            Text('Result: ${dataArray[index]['result']}'),
          ],
        ),
      ),
    );
  }
}
