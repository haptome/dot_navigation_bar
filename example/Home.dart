import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
      bottomNavigationBar: DotNavigationBar(
        items: <DotNavigationBarIteam>[
          DotNavigationBarIteam(icon: LineAwesomeIcons.home, onTap: () {}),
          DotNavigationBarIteam(icon: LineAwesomeIcons.safari, onTap: () {}),
          DotNavigationBarIteam(icon: LineAwesomeIcons.briefcase, onTap: () {}),
          DotNavigationBarIteam(icon: LineAwesomeIcons.user, onTap: () {}),
        ],
        color: Colors.grey.withOpacity(0.5),
        activeColor: Colors.green[200],
        dotColor: Colors.green,
        backgroundShadowColor: Colors.green[200],
        
      ),
    );
  }
}
