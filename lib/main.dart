import 'package:flutter/material.dart';
import 'package:speech_recognition/speech_recognition.dart';

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
  SpeechRecognition _speechRecognition;
  bool _isAvailable = false;
  bool _isListening = false;

  String resultText = "";

  @override
  void initState() {
    super.initState();
  }

  void initSpeechRecognizer() {
    _speechRecognition = SpeechRecognition();

    _speechRecognition.setAvailabilityHandler((bool result) {
      setState(() {
        _isAvailable = result;
      });
    });

    _speechRecognition.setRecognitionStartedHandler(() {
      setState(() {
        _isListening = true;
      });
    });

    _speechRecognition.setRecognitionResultHandler((String speech) {
      setState(() {
        resultText = speech;
      });
    });

    _speechRecognition.setRecognitionCompleteHandler(() {
      setState(() {
        _isListening = false;
      });
    });

    _speechRecognition.activate().then((result) {
      setState(() {
        _isAvailable = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
            color: Colors.cyanAccent[100],
            borderRadius: BorderRadius.circular(6.0),
          ),
          padding: EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 12.0,
          ),
          child: Text(
            resultText,
            style: TextStyle(fontSize: 24.0),
          ),
        ),
        SizedBox(
          height: 100,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //clear icon
            FloatingActionButton(
              onPressed: () {
                if (_isListening)
                  _speechRecognition.cancel().then(
                        (result) => setState(() {
                          _isListening = result;
                          resultText = "";
                        }),
                      );
              },
              child: Icon(Icons.cancel),
              mini: true,
              backgroundColor: Colors.deepOrange,
            ),
            SizedBox(
              width: 50,
            ),
            //record icon
            FloatingActionButton(
              onPressed: () {
                if (_isAvailable && !_isListening) print("start program");
                _speechRecognition
                    .listen(locale: "en_US")
                    .then((result) => print('$result'));
              },
              child: Icon(Icons.mic),
            ),
            SizedBox(
              width: 50,
            ),
            //stop icon
            FloatingActionButton(
              onPressed: () {
                if (_isListening)
                  _speechRecognition.stop().then(
                        (result) => setState(() => _isListening = result),
                      );
              },
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
