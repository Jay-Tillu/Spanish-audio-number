import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:spanish_audio_number/NumberAudio.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static AudioCache player = AudioCache();

  List<NumberAudio> numberList = [
    NumberAudio("music/one.wav", Colors.red, "One"),
    NumberAudio("music/two.wav", Colors.blue, "Two"),
    NumberAudio("music/three.wav", Colors.green, "Three"),
    NumberAudio("music/four.wav", Colors.purple, "Four"),
    NumberAudio("music/five.wav", Colors.amber, "Five"),
    NumberAudio("music/six.wav", Colors.indigo, "Six"),
    NumberAudio("music/seven.wav", Colors.deepOrange, "Seven"),
    NumberAudio("music/eight.wav", Colors.brown, "Eight"),
    NumberAudio("music/nine.wav", Colors.blueGrey, "Nine"),
    NumberAudio("music/ten.wav", Colors.orange, "Ten"),
  ];

  play(String uri) {
    player.play(uri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text("Spanish Audio Number App"),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Image(
                image: AssetImage("assets/images/logo.png"),
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                    childAspectRatio: 2.0,
                  ),
                  itemCount: numberList.length,
                  itemBuilder: (context, i) => SizedBox(
                    width: 50,
                    height: 20,
                    child: MaterialButton(
                      onPressed: () => play(numberList[i].audioUri),
                      color: numberList[i].buttonColor,
                      child: Text(
                        numberList[i].buttonText,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
