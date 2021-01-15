import 'package:MyPersonalTools/screens/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:percent_indicator/percent_indicator.dart';

class WaterScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return WaterState();
  }
}

class WaterState extends State<WaterScreen> {
  TextEditingController txtWeight = new TextEditingController();
  double per;
  String manyGlass = LoginState.manyGlass.toString();
  @override
  void initState() {
    per = 0.0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "DAILY WATER NEED OF " + LoginState.activeUserFirstName.toUpperCase(),
          style: GoogleFonts.podkova(fontSize: 22),
        ),
        backgroundColor: Colors.green.shade300,
      ),
      body: builContext(context),
      resizeToAvoidBottomPadding: false,
    );
  }

  builContext(BuildContext context) {
    //print(LoginState.activeUser);
    //getWaterData();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.green.shade100,
      ),
      child: Padding(
        padding: const EdgeInsets.all(35.0),
        child: Column(
          children: [
            Text(
              'Today should drink ' + manyGlass + ' glasses of water ',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 90,
            ),
            CircularPercentIndicator(
              radius: 200.0,
              lineWidth: 30.0,
              percent: per,
              progressColor: Colors.green,
            ),
            SizedBox(
              height: 90,
            ),
            FlatButton(
              onPressed: () => percent(),
              child: Column(
                children: [
                  FaIcon(
                    FontAwesomeIcons.glassWhiskey,
                    size: 60,
                  ),
                  Text(
                    'I drank water',
                    style: TextStyle(fontSize: 18),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  percent() {
    if (double.tryParse(manyGlass) != null) {
      setState(() {
        per = per + (1 / double.tryParse(manyGlass));
      });
      print(per);
      if (per >= 1) per = 0.0;
    }
  }
}
