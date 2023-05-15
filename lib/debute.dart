import 'package:flutter/material.dart';

class NewPage extends StatefulWidget {
  final String inputString;

  NewPage({required this.inputString});

  @override
  State<NewPage> createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  List<String> images = [];
  List<GlobalKey> _imageKeys = List.generate(4, (_) => GlobalKey());

  int index = 0;
  List<String> moves = ["1.e4", "1.c6","2.d4","2.d5","3.Nc3","3.Nf6","4.e5","4.Nfd7"]; 
  @override
  Widget build(BuildContext context) {
    images = [
      '${widget.inputString}1.png',
      '${widget.inputString}2.png',
      '${widget.inputString}3.png',
      '${widget.inputString}4.png',
      '${widget.inputString}5.png',
      '${widget.inputString}6.png',
      '${widget.inputString}7.png',
      '${widget.inputString}8.png',
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.inputString),
        backgroundColor: Color(0xffcc8e35),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(5, 5, 2.5, 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          'assets/images/${images[index]}',
                          fit: BoxFit.contain,
                          key: _imageKeys[0],
                        ),
                        Text(
                          moves[index],
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(2.5, 5, 5, 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          'assets/images/${images[index + 1]}',
                          key: _imageKeys[1],
                          fit: BoxFit.contain,
                        ),
                        Text(
                          moves[index+1],
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(5, 5, 2.5, 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          'assets/images/${images[index + 2]}',
                          key: _imageKeys[2],
                          fit: BoxFit.contain,
                        ),
                        Text(
                          moves[index+2],
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(2.5, 5, 5, 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          'assets/images/${images[index + 3]}',
                          key: _imageKeys[3],
                          fit: BoxFit.contain,
                        ),
                        Text(
                          moves[index+3],
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    index = 0;
                  });
                },
                child: Icon(Icons.arrow_back),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xffcc8e35),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    index = 4;
                  });
                },
                child: Icon(Icons.arrow_forward),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xffcc8e35),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  color: Color(0xffcc8e35),
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'The Caro-Kann Defense is known above all for its solidity. The defining move, 1...c6, is the fourth most popular reply to 1.e4 and nearly twice as common as the number five move. It prepares for 2...d5 without blocking in the light-squared bishop, which is considered the main drawback of its cousin the French Defense (1.e4 e6). ',
                    maxLines: 7,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      backgroundColor: Color(0xffffda79),
    );
  }
}
