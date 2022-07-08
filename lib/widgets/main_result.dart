import 'package:flutter/material.dart';

class MainResult extends StatelessWidget {
  const MainResult({ 
    Key? key, 
    required this.text
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 20),
      child: FittedBox(
        fit: BoxFit.contain,
        child: Text(
          text,
          style: const TextStyle(fontSize: 50),
        ),
      ),
    );
  }
}