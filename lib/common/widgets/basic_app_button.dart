import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BasicAppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final double? height;
  const BasicAppButton(
      {super.key, required this.onPressed, required this.title, this.height});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight( height ?? 80)//neu kh goi height ra thi mac dinh la 80
      ),
      child: Text(title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
    );
  }
}
