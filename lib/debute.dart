import 'package:flutter/material.dart';

class NewPage extends StatefulWidget {
  final String inputString;
  final int number;

  NewPage({required this.inputString, required this.number});

  @override
  State<NewPage> createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  List<String> images = [];
  List<GlobalKey> _imageKeys = List.generate(4, (_) => GlobalKey());

  int index = 0;
  List<List<String>> text = [
    [
      "1.e4",
      "1.c5",
      "2.Nc3",
      "2.d6",
      "3.d4",
      "3.cxd4",
      "4.Qxd4",
      "4.Nf6",
      "The Sicilian Defense is the most popular response to White's 1.e4. Employed by masters and beginners alike, the Sicilian Defense is a reputable and positionally sound opening. "
    ],
    [
      "1.e4",
      "1.e6",
      "2.d4",
      "2.d5",
      "3.e5",
      "3.Bd7",
      "4.a6",
      "4.c5",
      "The French Defense is one of the most popular Black responses to 1.e4. It has consistently been a part of masters' repertoire since the 1800s and one of the favorites of positional players."
    ],
    [
      "1.e4",
      "1.e5",
      "2.Nf3",
      "2.Nc6",
      "3.Bb5",
      "3.Nf6",
      "4.d3",
      "4.Ne7",
      "The Ruy Lopez (also known as the Spanish Opening or Spanish Game) is one of the oldest and most analyzed openings in chess history."
    ],
    [
      "1.e4",
      "1.c6",
      "2.d4",
      "2.d5",
      "3.Nc3",
      "3.Nf6",
      "4.e5",
      "4.Nfd7",
      "The Caro-Kann Defense is known above all for its solidity. The defining move, 1...c6, is the fourth most popular reply to 1.e4 and nearly twice as common as the number five move. It prepares for 2...d5 without blocking in the light-squared bishop, which is considered the main drawback of its cousin the French Defense (1.e4 e6). "
    ],
    [
      "1.e4",
      "1.e5",
      "2.Nf3",
      "2.Nc6",
      "3.Bc4",
      "3.Nf6",
      "4.Ng5",
      "4.d5",
      "The Italian Game is one of the oldest openings in chess and has been around for centuries. This classical 1.e4 opening can lead to slower and positional games as well as open, tactical battles."
    ],
    [
      "1.e4",
      "1.d5",
      "2.exd4",
      "2.Nf6",
      "3.d4",
      "3.Qxd5",
      "4.Nc3",
      "4.Qd6",
      "The Scandinavian Defense, formerly better known in English language texts as the Center-Counter, is Black's seventh most popular response to 1.e4."
    ],
    [
      "1.d4",
      "1.Nf6",
      "2.c4",
      "2.g6",
      "3.Nf3",
      "3.Bg7",
      "4.Nc3",
      "4.O-O",
      "The King's Indian Defense is a hypermodern aggressive opening for Black as a response for 1.d4. "
    ],
    [
      "1.d4",
      "1.d5",
      "2.c4",
      "2.c6",
      "3.cxd5",
      "3.cxd5",
      "4.Bf4",
      "4.Nc6",
      "The Slav Defense is a solid opening for Black in response to White's Queen's Gambit (1.d4 d5 2.c4). "
    ],
    [
      "1.e4",
      "1.e5",
      "2.f4",
      "2.exf4",
      "3.Nf3",
      "3.g5",
      "4.h4",
      "4.d5",
      "The King's Gambit is an age-old aggressive opening that Romantic chess players revered."
    ],
    [
      "1.d4",
      "1.d5",
      "2.c4",
      "2.e6",
      "3.cxd5",
      "3.exd5",
      "4.Nc3",
      "4.Nf6",
      "The Queen's Gambit is one of the oldest and most reputable 1.d4 openings for White. Unlike 1.e4 openings, the Queen's Gambit usually evolves into a strategic game rather than an all-out tactical battle. "
    ]
  ];
  List<String> moves = [
    "1.e4",
    "1.c6",
    "2.d4",
    "2.d5",
    "3.Nc3",
    "3.Nf6",
    "4.e5",
    "4.Nfd7"
  ];
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
                          text[widget.number][index],
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
                          text[widget.number][index+1],
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
                          text[widget.number][index+2],
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
                          text[widget.number][index+3],
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
                    text[widget.number][8],
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
