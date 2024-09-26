import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class add extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Color(0xFFE57734),
        ),
        child: Icon(
          CupertinoIcons.add,
          size: 15,
          color: Colors.white,
        ),
      ),
    );
  }
}