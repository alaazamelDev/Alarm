import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlarmFragment extends StatefulWidget {
  @override
  _AlarmFragmentState createState() => _AlarmFragmentState();
}

class _AlarmFragmentState extends State<AlarmFragment> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          Text(
            'Alarm',
            style: TextStyle(
              fontSize: 24,
              fontFamily: 'avenir',
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
