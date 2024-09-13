
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'components/my_button.dart';
import 'constant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userInput = '';
  var answer = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            userInput.toString(),
                            style: const TextStyle(
                                fontSize: 30, color: Colors.white),
                          )),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        answer.toString(),
                        style:
                        const TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              SafeArea(
                child: Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          MyButton(
                            title: 'AC',
                            onPress: () {
                              userInput = '';
                              answer = '';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '+/-',
                            onPress: () {
                              userInput += '+/-';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '%',
                            onPress: () {
                              userInput += '%';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '/',
                            onPress: () {
                              userInput += '/';
                              setState(() {});
                            },
                            color: Color(0xffffa00a),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          MyButton(
                            title: '7',
                            onPress: () {
                              userInput += '7';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '8',
                            onPress: () {
                              userInput += '8';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '9',
                            onPress: () {
                              userInput += '9';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: 'x',
                            onPress: () {
                              userInput += 'x';
                              setState(() {});
                            },
                            color: Color(0xffffa00a),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          MyButton(
                            title: '4',
                            onPress: () {
                              userInput += '4';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '5',
                            onPress: () {
                              userInput += '5';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '6',
                            onPress: () {
                              userInput += '6';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '-',
                            onPress: () {
                              userInput += '-';
                              setState(() {});
                            },
                            color: Color(0xffffa00a),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          MyButton(
                            title: '1',
                            onPress: () {
                              userInput += '1';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '2',
                            onPress: () {
                              userInput += '2';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '3',
                            onPress: () {
                              userInput += '3';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '+',
                            onPress: () {
                              userInput += '+';
                              setState(() {});
                            },
                            color: Color(0xffffa00a),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          MyButton(
                            title: '0',
                            onPress: () {
                              userInput += '0';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '.',
                            onPress: () {
                              userInput += '.';
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: 'DEL',
                            onPress: () {
                              userInput =
                                  userInput.substring(0, userInput.length - 1);
                              setState(() {});
                            },
                          ),
                          MyButton(
                            title: '=',
                            onPress: () {
                              equalPress();
                              setState(() {});
                            },
                            color: Color(0xffffa00a),
                          ),
                        ],
                      ),
                      const SafeArea(
                        child: Center(
                          child: Text(
                            '.....~Aamir~.....',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ], //children
          ),
        ),
      ),
    );
  }

  void equalPress() {
    String finalUserInput = userInput;
    finalUserInput = userInput.replaceAll('x', '*');

    Parser p = Parser();
    Expression expression = p.parse(finalUserInput);
    ContextModel contextModel = ContextModel();
    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    answer = eval.toString();
  }
}
