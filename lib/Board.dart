import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

var arr = List.generate(16, (index) => BoardSlot(index));
var toShow;
int ms = 700;

class BoardSlot extends StatefulWidget {
  const BoardSlot(this.id, {super.key});
  static int numPressed = 0;
  static var images = ['assets/corn.jpeg', 'assets/candy.png', 'assets/bat.jpeg'];
  final int id;
  @override
  State<BoardSlot> createState() => _BoardSlotState();
}

class _BoardSlotState extends State<BoardSlot> {
  bool _notHidden = false;
  bool _notClicked = true;
  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(milliseconds: ms), (timer) async {
      if (toShow.contains(widget.id)) {
        setState(() => _notHidden = !_notHidden);
        await Future.delayed(Duration(milliseconds: ms));
        setState(() => _notHidden = !_notHidden);
        _notClicked = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _notHidden,
      child: IconButton(
        splashRadius: .5,
        onPressed: () {
          if (_notClicked) {
            BoardSlot.numPressed++;
            _notClicked = false;
          }
        },
        icon: Image.asset(
          BoardSlot.images[Random().nextInt(BoardSlot.images.length)]
        )
      )
    );
  }
}

class Board {
  static void flash(int numShow) {
    Timer.periodic(Duration(milliseconds: ms), (timer) {
      toShow = List.generate(Random().nextInt(numShow), (i) => Random().nextInt(arr.length)).toSet();
    });
  }
}
