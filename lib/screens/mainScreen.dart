import 'package:MyPersonalTools/screens/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          LoginState.activeUserFirstName.toUpperCase() + '`S PERSONAL TOOLS',
          style: GoogleFonts.podkova(fontSize: 22),
        ),
        backgroundColor: Colors.green.shade300,
        automaticallyImplyLeading: false,
      ),
      body: containerWidget(context),
    );
  }

  containerWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 150.0, vertical: 100),
      decoration: BoxDecoration(
        color: Colors.green.shade100,
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        IconButton(
          icon: FaIcon(FontAwesomeIcons.clipboardList),
          tooltip: 'My To Do List',
          iconSize: 80,
          color: Colors.green.shade400,
          onPressed: () => Navigator.pushNamed(context, "/todo"),
        ),
        SizedBox(
          height: 20,
        ),
        IconButton(
          icon: FaIcon(FontAwesomeIcons.calculator),
          iconSize: 80,
          tooltip: 'My Calculator',
          color: Colors.green.shade400,
          onPressed: () => Navigator.pushNamed(context, "/calculator"),
        ),
        SizedBox(
          height: 20,
        ),
        IconButton(
          icon: FaIcon(FontAwesomeIcons.glassWhiskey),
          iconSize: 80,
          tooltip: 'Water',
          color: Colors.green.shade400,
          onPressed: () => Navigator.pushNamed(context, "/water"),
        ),
        SizedBox(
          height: 20,
        ),
        IconButton(
          icon: FaIcon(FontAwesomeIcons.mailBulk),
          iconSize: 80,
          tooltip: 'Mail',
          color: Colors.green.shade400,
          onPressed: () => Navigator.pushNamed(context, "/hes"),
        ),
      ]),
    );
  }
}
