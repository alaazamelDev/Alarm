import 'package:alarm/customviews/clock_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClockFragment extends StatelessWidget {
  const ClockFragment({
    Key key,
    @required this.formattedTime,
    @required this.formattedDate,
    @required this.offsetSign,
    @required this.timezoneString,
  }) : super(key: key);

  final String formattedTime;
  final String formattedDate;
  final String offsetSign;
  final String timezoneString;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Text(
              'Clock',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 26,
                color: Colors.white,
                fontFamily: 'avenir',
              ),
            ),
          ),
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  formattedTime,
                  style: TextStyle(
                    fontSize: 64,
                    color: Colors.white,
                    fontFamily: 'avenir',
                  ),
                ),
                Text(
                  formattedDate,
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 20,
                    color: Colors.white,
                    fontFamily: 'avenir',
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 4,
            fit: FlexFit.tight,
            child: Align(
              alignment: Alignment.topCenter,
              child: ClockView(
                size: MediaQuery.of(context).size.height / 3,
              ),
            ),
          ),
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Time Zone',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 24,
                      color: Colors.white,
                      fontFamily: 'avenir',
                    )),
                SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.language,
                      color: Colors.white,
                    ),
                    SizedBox(width: 16),
                    Text(
                      'UTC ' + offsetSign + timezoneString,
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontFamily: 'avenir',
                          fontSize: 20,
                          color: Colors.white),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
