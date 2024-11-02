import 'package:calculator/constants/clr_constants.dart';
import 'package:calculator/screens/components/button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  var userinput = "";
  var answer = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                userinput.toString(),
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 45,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                answer,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Button(
                  txtcolor: Colors.black,
                  title: "AC",
                  color: lightgray,
                  onpress: () {
                    userinput = '';
                    answer = '';
                    setState(() {});
                  },
                ),
                Button(
                  txtcolor: Colors.black,
                  title: "^",
                  color: lightgray,
                  onpress: () {
                    userinput += '^';
                    setState(() {});
                  },
                ),
                Button(
                  txtcolor: Colors.black,
                  title: "%",
                  color: lightgray,
                  onpress: () {
                    userinput += '%';
                    setState(() {});
                  },
                ),
                Button(
                  txtcolor: Colors.white,
                  title: "/",
                  color: orange,
                  onpress: () {
                    userinput += '/';
                    setState(() {});
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Button(
                  txtcolor: Colors.white,
                  title: "7",
                  color: darkgray,
                  onpress: () {
                    userinput += '7';
                    setState(() {});
                  },
                ),
                Button(
                  txtcolor: Colors.white,
                  title: "8",
                  color: darkgray,
                  onpress: () {
                    userinput += '8';
                    setState(() {});
                  },
                ),
                Button(
                  txtcolor: Colors.white,
                  title: "9",
                  color: darkgray,
                  onpress: () {
                    userinput += '9';
                    setState(() {});
                  },
                ),
                Button(
                  txtcolor: Colors.white,
                  title: "X",
                  color: orange,
                  onpress: () {
                    userinput += 'X';
                    setState(() {});
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Button(
                  txtcolor: Colors.white,
                  title: "4",
                  color: darkgray,
                  onpress: () {
                    userinput += '4';
                    setState(() {});
                  },
                ),
                Button(
                  txtcolor: Colors.white,
                  title: "5",
                  color: darkgray,
                  onpress: () {
                    userinput += '5';
                    setState(() {});
                  },
                ),
                Button(
                  txtcolor: Colors.white,
                  title: "6",
                  color: darkgray,
                  onpress: () {
                    userinput += '6';
                    setState(() {});
                  },
                ),
                Button(
                  txtcolor: Colors.white,
                  title: "-",
                  color: orange,
                  onpress: () {
                    userinput += '-';
                    setState(() {});
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Button(
                  txtcolor: Colors.white,
                  title: "1",
                  color: darkgray,
                  onpress: () {
                    userinput += '1';
                    setState(() {});
                  },
                ),
                Button(
                  txtcolor: Colors.white,
                  title: "2",
                  color: darkgray,
                  onpress: () {
                    userinput += '2';
                    setState(() {});
                  },
                ),
                Button(
                  txtcolor: Colors.white,
                  title: "3",
                  color: darkgray,
                  onpress: () {
                    userinput += '3';
                    setState(() {});
                  },
                ),
                Button(
                  txtcolor: Colors.white,
                  title: "+",
                  color: orange,
                  onpress: () {
                    userinput += '+';
                    setState(() {});
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Button(
                  txtcolor: Colors.white,
                  title: "0",
                  color: darkgray,
                  onpress: () {
                    userinput += '0';
                    setState(() {});
                  },
                ),
                Button(
                  txtcolor: Colors.white,
                  title: ".",
                  color: darkgray,
                  onpress: () {
                    userinput += '.';
                    setState(() {});
                  },
                ),
                Button(
                  txtcolor: Colors.white,
                  title: "DEL",
                  color: darkgray,
                  onpress: () {
                    userinput = userinput.substring(0, userinput.length - 1);
                    setState(() {});
                  },
                ),
                Button(
                  txtcolor: Colors.white,
                  title: "=",
                  color: orange,
                  onpress: () {
                    equalpress();
                    setState(() {});
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  void equalpress() {
    String finaluserinput = userinput.toString();
    finaluserinput = finaluserinput.replaceAll('X', '*');
    Parser p = Parser();
    Expression expression = p.parse(finaluserinput);
    ContextModel contextModel = ContextModel();
    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    answer = eval.toString();
  }
}
