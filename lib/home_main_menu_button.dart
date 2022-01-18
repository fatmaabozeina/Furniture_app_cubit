import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  final fillColor;
  final labelColor;

  final label;
  final buttonAction;

  CategoryButton(
      {this.label, this.buttonAction, this.labelColor, this.fillColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      child: TextButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(10)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(fillColor),
          foregroundColor: MaterialStateProperty.all<Color>(labelColor),
        ),
        onPressed: buttonAction,
        child: Text(
          label,
        ),
      ),
    );
  }
}
