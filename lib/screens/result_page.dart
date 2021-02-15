
import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/BottomButton.dart';


class ResultPage extends StatelessWidget {

  ResultPage({@required this.bmiResult,@required this.resultText,@required this.interpretation});


  final String bmiResult;
  final String resultText;
  final String interpretation;




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
         Expanded(
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Your Result',
                  style:  kTitileStyle,
                    ),
              ),
            ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: Color(0xFF1D1F33),
              cardChild: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                      resultText.toUpperCase(),
                      style: kResultTextStyle),
                  Text(
                    bmiResult,
                    style: kBMIValue,),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: kBodyTextStyle,),

                ],

              ),
            ),

          ),
          BottomButton(buttonTilte: 'RE-CALACULATE', onTap: (){
            Navigator.pop(context);
          }),


        ],
      )

    );
  }
}
