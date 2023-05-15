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

List<List<String>> chessMoves = [
  [
    '1. e4 e5',
    '2. Nf3 Nc6',
    '3. Bb5 a6',
    '4. Ba4 Nf6',
    '5. O-O Be7',
    '6. Re1 b5',
    '7. Bb3 d6',
    '8. c3 O-O',
    '9. h3 Nb8',
    '10. d4 Nbd7',
    '11. Nbd2 Bb7',
    '12. Bc2 Re8',
    '13. Nf1 Bf8',
    '14. Ng3 g6',
    '15. Bg5'
  ],
  [
    '1. e4 c5',
    '2. Nf3 d6',
    '3. d4 cxd4',
    '4. Nxd4 Nf6',
    '5. Nc3 a6',
    '6. Bg5 e6',
    '7. f4 Be7',
    '8. Qf3 Qc7',
    '9. O-O-O Nbd7',
    '10. g4 b5',
    '11. Bxf6 Nxf6',
    '12. g5 Nd7',
    '13. f5 Bxg5+',
    '14. Kb1 O-O',
    '15. fxe6'
  ],
  [
    '1. d4 Nf6',
    '2. c4 e6',
    '3. Nf3 d5',
    '4. Nc3 c6',
    '5. e3 Nbd7',
    '6. Qc2 Bd6',
    '7. g4 h6',
    '8. Rg1 e5',
    '9. cxd5 Nxd5',
    '10. Bd2 Qe7',
    '11. O-O-O Nxc3',
    '12. Bxc3 e4',
    '13. Nd2 Nf6',
    '14. g5 hxg5',
    '15. Rxg5'
  ],
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
                    builder: (context) => GameDetailsPage(index: index),
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

  GameDetailsPage({required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Game Details'),
        backgroundColor: Color(0xffcc8e35),
      ),
      body: Container(
        color: Color(0xffffda79),
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Date: ${dataArray[index]['date']}',
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'Time: ${dataArray[index]['time']}',
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'Side: ${dataArray[index]['side']}',
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'Opponent: ${dataArray[index]['opponent']}',
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'Result: ${dataArray[index]['result']}',
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Moves:',
              style: TextStyle(fontSize: 24.0),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: chessMoves[index].length,
                itemBuilder: (context, moveIndex) {
                  return ListTile(
                    title: Text(chessMoves[index][moveIndex]),
                  );
                },
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
