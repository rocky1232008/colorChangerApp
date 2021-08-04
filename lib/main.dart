import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Map<String, Color> colors = {'purple': Colors.purple, 'blue':Colors.blue, 'red':Colors.red, 'green':Colors.green, 'black':Colors.black, 'white':Colors.white, 'orange': Colors.orange, 'yellow':Colors.yellow, 'teal':Colors.teal};

  Color? selectedColor;

  void _setColor(String colorName, Color color){
      setState(() {
        selectedColor = color;
      });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: selectedColor,
      appBar: AppBar(backgroundColor: selectedColor,),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
        for(var entry in colors.entries)
          Container(
            margin: EdgeInsets.all(10),
            child: ElevatedButton(child: Text(entry.key), onPressed: (){
              _setColor(entry.key, entry.value);
            },style: ElevatedButton.styleFrom(minimumSize: Size(600, 60), primary: entry.value),),
          )
      ],),
    );
  }
}