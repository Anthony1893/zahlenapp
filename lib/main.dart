import 'package:flutter/material.dart';
import 'package:shake/shake.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'A long time ago in a galaxy far, far away' ),

    );
  }

}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override

  void initState() {
    super.initState();
    ShakeDetector detector = ShakeDetector.autoStart(onPhoneShake: () {
      print('should play');
      playShakeSound();
    });
    // To close: detector.stopListening();
    // ShakeDetector.waitForStart() waits for user to call detector.startListening();
  }
  Future<AudioPlayer> playLocalAsset(String name) async {
    AudioCache cache = new AudioCache();
    //At the next line, DO NOT pass the entire reference such as assets/yes.mp3. This will not work.
    //Just pass the file name only.
    return await cache.play(name);

  }

  playShakeSound() {
    playLocalAsset(_songs[_counter % _songs.length]);
  }

  int _counter = 1;
  final _songs = ["sound5.mp3", "moan.mp3", "sound1.mp3", "sound2.mp3","sound3.mp3"];

   void _incrementCounter() {
    setState(() {
      if (_counter > 4) {
        _counter = 1;
      }
      else
    {
      _counter++;
    }
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.

    });
  }

  void _increment() {
    setState(() {
      if(_counter < 2){
        _counter = 5;
      }
      else
      {
        _counter--;
      }
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.

    });
  }

  @override
  Widget build(BuildContext context) {

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(

        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.

          title: Text(widget.title),

        ),


        backgroundColor: Colors.black,

        body: Center(


          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.

          child: Column(


            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Invoke "debug painting" (press "p" in the console, choose the
            // "Toggle Debug Paint" action from the Flutter Inspector in Android
            // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
            // to see the wireframe for each widget.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
            'Shake your Phone and choose between 5 sounds',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.yellow, fontSize: 18.0),
          ),
              Image.asset('assets/fort.png'),
             // Text(

            //    'Zähle wärend du Xiao Xiao hörst',
       //     style: TextStyle(fontWeight: FontWeight.bold),
        //      ),
        //      Text(
         //           'Schüttel dein Handy',
         //     ),
          Text(
             '$_counter' ,
             style: TextStyle(fontWeight: FontWeight.bold, color: Colors.yellow, fontSize: 50.00),


            ),
            ],
          ),

        ),


        floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FloatingActionButton(
                onPressed: _increment,
                tooltip: 'Increment',

                child: Icon(Icons.remove),

              ),
              Container(
                width: 250.0,
                height: 0.0,
              ),

              FloatingActionButton(

                onPressed: _incrementCounter,
                tooltip: 'Increment',
                child: Icon(Icons.add), // This trailing comma makes auto-formatting nicer for build methods

              )
            ]
        )
    );
  }
}
