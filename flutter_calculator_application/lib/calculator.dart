import 'package:flutter/material.dart';
import 'buttons.dart';

class MyCalulator extends StatefulWidget {
  const MyCalulator({super.key});

  @override
  State<MyCalulator> createState() => _CalulatorPageState();
}

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
          Expanded(child: Container()),
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
                            color: const Color(0xFFee6055),
                            buttonText: buttons[index],
                            textColor: Colors.black);
                      } else if (buttons[index] == '%' ||
                          buttons[index] == '/' ||
                          buttons[index] == 'x' ||
                          buttons[index] == '-' ||
                          buttons[index] == '+' ||
                          buttons[index] == '+' ||
                          buttons[index] == '=') {
                        return MyButton(
                            color: const Color(0xFF248277),
                            buttonText: buttons[index],
                            textColor: Colors.white);
                      } else if (buttons[index] == 'AC') {
                        return MyButton(
                            color: const Color(0xFF96e072),
                            buttonText: buttons[index],
                            textColor: Colors.black);
                      } else {
                        return MyButton(
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
