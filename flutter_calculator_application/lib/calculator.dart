import 'package:flutter/material.dart';
import 'buttons.dart';
import 'package:math_expressions/math_expressions.dart';

class MyCalulator extends StatefulWidget {
  const MyCalulator({super.key});

  @override
  State<MyCalulator> createState() => _CalulatorPageState();
}

var question = '';
var answer = '0';

class _CalulatorPageState extends State<MyCalulator> {
  final List<String> buttons = [
    'AC',
    'DEL',
    '%',
    '/',
    '9',
    '8',
    '7',
    'x',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    'ANS',
    '=',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF469d89),
      body: Column(
        children: <Widget>[
          Expanded(
              child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                const SizedBox(height: 50),
                Container(
                    padding: const EdgeInsets.all(20),
                    alignment: Alignment.centerLeft,
                    child: Text(question,
                        style: const TextStyle(
                            fontSize: 50, color: Colors.white))),
                Container(
                  padding: const EdgeInsets.all(20),
                  alignment: Alignment.centerRight,
                  child: Text(
                    answer,
                    style: const TextStyle(fontSize: 62, color: Colors.white),
                  ),
                )
              ],
            ),
          )),
          Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(4),
                child: GridView.builder(
                    itemCount: buttons.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4),
                    itemBuilder: (context, index) {
                      if (buttons[index] == 'DEL') {
                        return MyButton(
                            buttontapped: () {
                              setState(() {
                                question =
                                    question.substring(0, question.length - 1);
                              });
                            },
                            color: const Color(0xFFee6055),
                            buttonText: buttons[index],
                            textColor: Colors.black);
                      } else if (buttons[index] == '%' ||
                          buttons[index] == '/' ||
                          buttons[index] == 'x' ||
                          buttons[index] == '-' ||
                          buttons[index] == '+' ||
                          buttons[index] == '+') {
                        return MyButton(
                            buttontapped: () {
                              if (answer == '0') {
                                setState(() {
                                  question += buttons[index];
                                });
                              } else if (question == '') {
                                setState(() {
                                  question = answer;
                                  question += buttons[index];
                                });
                              } else {
                                setState(() {
                                  question += buttons[index];
                                });
                              }
                            },
                            color: const Color(0xFF248277),
                            buttonText: buttons[index],
                            textColor: Colors.white);
                      } else if (buttons[index] == 'AC') {
                        return MyButton(
                            buttontapped: () {
                              setState(() {
                                question = '';
                                answer = '0';
                              });
                            },
                            color: const Color(0xFF96e072),
                            buttonText: buttons[index],
                            textColor: Colors.black);
                      } else if (buttons[index] == '=') {
                        return MyButton(
                            buttontapped: () {
                              setState(() {
                                equalButton();
                                question = '';
                              });
                            },
                            color: const Color(0xFF16db65),
                            buttonText: buttons[index],
                            textColor: Colors.black);
                      } else {
                        return MyButton(
                            buttontapped: () {
                              setState(() {
                                question += buttons[index];
                              });
                            },
                            color: const Color.fromARGB(255, 172, 202, 195),
                            buttonText: buttons[index],
                            textColor: Colors.black);
                      }
                    }),
              ))
        ],
      ),
    );
  }
}

void equalButton() {
  String finalQuestion = question;
  finalQuestion = finalQuestion.replaceAll('x', '*');

  Parser p = Parser();
  Expression exp = p.parse(finalQuestion);
  ContextModel cm = ContextModel();
  double eval = exp.evaluate(EvaluationType.REAL, cm);

  if (eval % 1 == 0) {
    int i;
    i = eval.toInt();
    answer = i.toString();
  } else {
    answer = eval.toString();
  }
}
