import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  const CalculatorButton({ 
    Key? key, 
    required this.text, 
    required this.onTap,
    this.bgColor = const Color(0xff333333),
    this.big = false
  }) : super(key: key);

  final String text;
  final Color bgColor;
  final bool big;
  final Function onTap; 

  @override
  Widget build(BuildContext context) {
    final textStyle = TextButton.styleFrom(
          backgroundColor: bgColor,
          primary: Colors.white,
          shape: const StadiumBorder()
        );

    return Container(
      margin: EdgeInsets.only(bottom: 10, right: 5, left: 5),
      child: TextButton(
        style: textStyle,
        child: Container(
          width: big ? 150 : 65,
          height: 65,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w300
              ),
            ),
          )
        ),
        onPressed: () => onTap()
      )
    );
  }
}