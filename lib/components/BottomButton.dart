import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';


class BottomButton extends StatelessWidget {
  final String buttonTilte;
  final Function onTap;

  BottomButton({@required this.buttonTilte,@required this.onTap });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(bottom:15.0),
        color: kButtonColor,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kBottumContainerHeight,
        child: Center(
          child: Text(
              buttonTilte,
              style: kLargeButtonTextStyle),
        ),
      ),
    );
  }
}
