import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  /* This widget is the root of your application. */
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QuizPage(),
    );
  }
}
class Question {
  String question;
  bool correctAnswer;
  Question(this.question, this.correctAnswer);
}
class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final tickIcon = Icon(Icons.check, color: Colors.green);
  final crossIcon = Icon(Icons.clear, color: Colors.red);
  int count = 0;
  List<Icon> iconsList = [];

  final List<Question>questionsList = [
    Question('The first Governer General of Pakistan was Muhammad Ali Jinnah.',true),
    Question('Pakistan won its first Cricket World Cup in 1999.',false),
    Question('Pakistan won its first Olympic gold medal in Hockey in 1960.',true),
    Question('The tomb of Mughal Emperor Jahangir is in Delhi.',false),
    Question('Benazir Bhutto succeeded Zia-ul-Haq as President of Pakistan.',true),
    Question('The national flower of Pakistan is Jasmine.',true),
    Question('Pakistans national flag was designed by Wali Khan.',false),
    Question('The national anthem of Pakistan was written by Jagannath Azad.',true),
    Question('Pakistans film industry is known as Pollywood.',false),
    Question('The Eurasian Lynx is found in remote mountanious regions of North Pakistan.',true),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFFFFFFF),
        body: _body(),
      ),
    );
  }

  _body() {

/*Column1*/
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,

      children: <Widget>[
        Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 110, left: 20, right: 20),
              child: Text(
                questionsList[count].question,
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
            )),

        /* Column2 */
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
          /* True Button */
          RaisedButton(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                'True',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),
            color: Colors.green,
            onPressed: () {
              _checkAnswer(true);
            },
          ),

          SizedBox(height: 8),

          /* False Button */
          RaisedButton(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                'False',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),
            color: Colors.red,
            onPressed: () {
              _checkAnswer(false);
            },
          ),

          /*Row for Tick-Cross Icons to align them horizontally. */
          Row(children: iconsList)
        ],
        ),
      ],
    );
  }

  _checkAnswer(selectedAnswer) {
    if (selectedAnswer == questionsList[count].correctAnswer) {
      /* Correct answer */

      setState(() {
        iconsList.add(tickIcon);

        if (count < questionsList.length - 1) count++;
      });
    }
    else {
      /* Incorrect Answer */
      setState(() {
        iconsList.add(crossIcon);

        if (count < questionsList.length - 1) count++;
      });
    }
  }
}
