import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'loginScreen.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CalculatorStateScreen();
  }
}

class CalculatorStateScreen extends State {
  String operate = "", operated = "", symbol = "";

  double i1, i2;
  double result;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LoginState.activeUserFirstName.toUpperCase() + '`S CALCULATOR',
          style: GoogleFonts.podkova(fontSize: 22),
        ),
        backgroundColor: Colors.green.shade300,
      ),
      resizeToAvoidBottomPadding: false,
      body: Container(
        padding: const EdgeInsets.fromLTRB(0, 18, 0, 0),
        color: Colors.green.shade100,
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          Text(
            operated,
            style: GoogleFonts.montserrat(
              fontSize: 40,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 216),
          Text(
            result == null ? '= ' : '= ' + result.toString(),
            style: GoogleFonts.montserrat(
              fontSize: 50,
              fontWeight: FontWeight.w400,
            ),
          ),
          Row(
            children: [
              buttonNumberWidget(1),
              buttonNumberWidget(8),
              buttonNumberWidget(9),
              buttonSymbolWidget('/'),
            ],
          ),
          Row(
            children: [
              buttonNumberWidget(4),
              buttonNumberWidget(5),
              buttonNumberWidget(6),
              buttonSymbolWidget("X"),
            ],
          ),
          Row(
            children: [
              buttonNumberWidget(1),
              buttonNumberWidget(2),
              buttonNumberWidget(3),
              buttonSymbolWidget("-"),
            ],
          ),
          Row(
            children: [
              buttonSymbolWidget('.'),
              buttonNumberWidget(0),
              buttonSymbolWidget("%"),
              buttonSymbolWidget("+"),
            ],
          ),
          Row(
            children: [
              buttonSymbolWidget('CLEAR'),
              buttonSymbolWidget("="),
            ],
          ),
        ]),
      ),
    );
  }

  buttonNumberWidget(int index) {
    return Expanded(
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
        onPressed: () {
          if (result != null) {
            operated = "";
            setState(() {
              operate += index.toString();
            });
          } else {
            setState(() {
              operate += index.toString();
            });
          }
        },
        color: Colors.green.shade200,
        child: Text(
          index.toString(),
          style: GoogleFonts.montserrat(
            fontSize: 30,
            fontWeight: FontWeight.w200,
          ),
        ),
      ),
    );
  }

  buttonSymbolWidget(String index) {
    return Expanded(
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
        onPressed: () => selectedOperate(index),
        color: Colors.green.shade200,
        child: Text(
          index.toString(),
          style: GoogleFonts.montserrat(
            fontSize: 30,
            fontWeight: FontWeight.w200,
          ),
        ),
      ),
    );
  }

  equalOperating(double i1, double i2, String symbol) {
    if (symbol == "X")
      return i1 * i2;
    else if (symbol == "/")
      return i1 / i2;
    else if (symbol == "+")
      return i1 + i2;
    else if (symbol == "-")
      return i1 - i2;
    else if (symbol == "%") return i1 % i2;
  }

  selectedOperate(String index) {
    if (index == "CLEAR") {
      setState(() {
        operate = "";
        result = 0;
      });
    }
    if (operate != "") {
      if (index == "X") {
        i1 = double.parse(operate);
        operate = "";
        symbol = "X";
      } else if (index == "-") {
        i1 = double.parse(operate);
        operate = "";
        symbol = "-";
      } else if (index == "/") {
        i1 = double.parse(operate);
        operate = "";
        symbol = "/";
      } else if (index == "+") {
        i1 = double.parse(operate);
        operate = "";
        symbol = "+";
      } else if (index == ".") {
        operate += ".";
      } else if (index == "%") {
        i1 = double.parse(operate);
        operate = "";
        symbol = "%";
      } else if (index == "=") {
        i2 = double.parse(operate);
        setState(() {
          operate = "";
          operated = i1.toString() + " " + symbol + " " + i2.toString();
          result = equalOperating(i1, i2, symbol);
        });
      }
    }
  }
}
