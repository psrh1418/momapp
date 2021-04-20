import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: VoiceHome(),
    );
  }
}

class VoiceHome extends StatefulWidget {
  const VoiceHome({Key key}) : super(key: key);

  @override
  _VoiceHomeState createState() => _VoiceHomeState();
}

class _VoiceHomeState extends State<VoiceHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('resultTExt'),
        SizedBox(
          height: 100,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.cancel),
              mini: true,
              backgroundColor: Colors.deepOrange,
            ),
            SizedBox(
              width: 50,
            ),
            FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.mic),
            ),
            SizedBox(
              width: 50,
            ),
            FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.stop),
              mini: true,
              backgroundColor: Colors.deepPurple,
            ),
          ],
        )
      ],
    ));
  }
}
