import 'package:alarm/customviews/clock_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formattedTime = DateFormat('HH:mm').format(now);
    var formattedDate = DateFormat('EEE,d MMM').format(DateTime.now());
    var timezoneString = now.timeZoneOffset.toString().split('.').first;
    var offsetSign = '';

    if (!timezoneString.startsWith('-')) offsetSign = '+';
    print(timezoneString);

    return Scaffold(
      backgroundColor: Color(0xFF2D2F41),
      body: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BuildMenuButton(
                image: 'assets/clock_icon.png',
                title: 'Clock',
              ),
              BuildMenuButton(
                image: 'assets/alarm_icon.png',
                title: 'Alarm',
              ),
              BuildMenuButton(
                image: 'assets/timer_icon.png',
                title: 'Timer',
              ),
              BuildMenuButton(
                image: 'assets/stopwatch_icon.png',
                title: 'Stopwatch',
              ),
            ],
          ),
          VerticalDivider(
            width: 1,
            color: Colors.white54,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
            child: Expanded(
              child: Container(
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
                        alignment: Alignment.center,
                        child: ClockView(
                          size: MediaQuery.of(context).size.height / 4,
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BuildMenuButton extends StatelessWidget {
  final String image;
  final String title;

  const BuildMenuButton({Key key, this.image, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: TextButton(
          onPressed: () {},
          child: Column(
            children: [
              Image.asset(
                image,
                scale: 1.5,
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                title ?? '',
                style: TextStyle(
                    fontFamily: 'avenir', fontSize: 14, color: Colors.white),
              )
            ],
          )),
    );
  }
}
