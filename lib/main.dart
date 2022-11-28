import 'dart:async';
import 'package:flutter/material.dart';
import 'Board.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Halloween Game',
      home: MyHomePage(title: 'Halloween Game'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _score = 0;

  @override
  void initState(){
    super.initState();
    Timer.periodic(Duration.zero,(timer) => setState(() => _score = BoardSlot.numPressed,));
    Board.flash(5);
  }

  @override
  Widget build(BuildContext context) {
    Size m = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: const Color.fromARGB(172, 223, 93, 0),
      ),
      body: SafeArea(
        child: Column(children: [
          (_score >= 10 ? const Padding(padding: EdgeInsets.all(16), child: Text('Happy Halloween!', style: TextStyle(color: Colors.orange, fontSize: 20, fontFamily: 'caveat'))): const Text('')),
          Text(
            'Buttons pressed: $_score',
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
          Expanded(child: SizedBox(width: m.width, height: m.height, child: GridView.count(shrinkWrap: true,crossAxisSpacing: 10, mainAxisSpacing: 10,crossAxisCount: 4, children: arr)))
          ] 
        ),
      ),
      backgroundColor: const Color.fromARGB(225, 0, 0, 0),
    );
  }
}


