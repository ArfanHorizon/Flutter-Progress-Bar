import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainApp(),
    );
  }
}

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  double _currentValue = 0;

  setEndPressed(double value) {
    setState(() {
      _currentValue = value;
    });
  }

  Widget buildFloatingButton(String text, VoidCallback callback) {
    TextStyle roundTextStyle =
        const TextStyle(fontSize: 16.0, color: Colors.white);
    return new FloatingActionButton(
        child: new Text(text, style: roundTextStyle), onPressed: callback);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
        children: <Widget>[
          Container(
              height: 150,
              child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 75, 20, 20),
                  child: Column(children: [
                    FAProgressBar(
                      currentValue: _currentValue,
                      displayText: '%',
                      progressGradient: LinearGradient(
                        colors: [
                          Colors.blue.withOpacity(0.75),
                          Colors.green.withOpacity(0.75),
                        ],
                      ),
                    ),
                    Spacer(),
                  ]))),
          Container(
              child: Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Container(
                child: Row(
                children: <Widget>[
                buildFloatingButton("0", () => setEndPressed(0)),
                buildFloatingButton("25", () => setEndPressed(25)),
                buildFloatingButton("50", () => setEndPressed(50)),
                buildFloatingButton("85.5", () => setEndPressed(85.5)),
                buildFloatingButton("100", () => setEndPressed(100)),
                buildFloatingButton("200", () => setEndPressed(200)),
              ],
            )),
          )),
        ],
      )),
    );
  }
}
