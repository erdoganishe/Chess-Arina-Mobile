import 'package:flutter/material.dart';
import 'debuts.dart';
import 'game_for_an.dart';
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffcc8e35),
        title: Text('CHESS ARENA'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Color(0xffffda79),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage('assets/images/board.png'),
                        height: MediaQuery.of(context).size.height * 0.15,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => DebutsPage()),
                          );
                        },
                        child: Text(
                          'Debuts database',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xffcc8e35),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage('assets/images/magnifier.png'),
                        height: MediaQuery.of(context).size.height * 0.15,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => GamePage()),
                          );
                        },
                        child: Text(
                          'Analys',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xffcc8e35),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            color: Color(0xffcc8e35),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: MediaQuery.of(context).size.height * 0.005,
                  child: Icon(Icons.telegram),
                ),
                Expanded(
                  child: Text(
                    'Telegram bot - @chessarenabot',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
