import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/gender_enum.dart';
import '../constants.dart';
import 'result_page.dart';
import 'package:bmi_calculator/components/BottomButton.dart';
import 'package:bmi_calculator/components/RoundIconButton.dart';
import 'package:bmi_calculator/calculator_brain.dart';



class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  GenderEnum selectedGender;
  int height = 170;
  int weight = 50;
  int age = 25;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          //1st ROW
          Expanded(child: Row(
            children: <Widget>[

              //MALE CARD
              Expanded(child: ReusableCard(
                onPress: (){
                  setState(() {
                    print('Male card pressed');
                     selectedGender = GenderEnum.Male;
                  });
                },
                cardChild: IconContents(
                    icon: FontAwesomeIcons.mars,
                    label: 'MALE'),
                colour: selectedGender == GenderEnum.Male ? kPressedCardColor : kActiveColor ,
              ),),

              //FEMALE CARD
              Expanded(child: ReusableCard (
                onPress: (){
                  setState(() {
                    print('Male card pressed');
                    selectedGender = GenderEnum.Female;
                  });
                },
                cardChild: IconContents(
                    icon: FontAwesomeIcons.venus,
                    label: 'FEMALE'),
                colour: selectedGender == GenderEnum.Female ? kPressedCardColor : kActiveColor ,
              ),),
            ],
          )),


          //2nd ROW

          //HEIGHT CARD(Slider)
          Expanded(child: ReusableCard(
            colour: kActiveColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('HEIGHT' ,
                style: kLabelTextStyle,

                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(
                        height.toString(),
                      style: kNumberFontStyle,
                    ),
                    Text(
                      'cm',
                      style: kLabelTextStyle,
                    ),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    thumbColor: Color(0xFFEB1555),
                    activeTrackColor: Color(0xFFFFFFFF),
                    inactiveTrackColor: Color(0xFF888993),
                    overlayColor: Color(0x1fEB1555),
                    trackHeight: 0.5  ,
                  ),

                  child: Slider(
                      value: height.toDouble(),
                      min:120.0,
                      max: 220.0,
                      onChanged: (double newValue){
                        setState(() {
                          print(newValue);
                          height = newValue.round();
                        });
                        },
                  ),
                ),
              ],
            ),
          ),),


          //3rd ROW
          Expanded(child: Row(
            children: <Widget>[




              //WEIGHT CARD
              Expanded(child: ReusableCard(
                colour: kActiveColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'WEIGHT',
                      style: kLabelTextStyle,
                    ),
                    Text(
                      weight.toString(),
                      style: kNumberFontStyle,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                          onPressed: (){
                            setState(() {
                              if(weight >10)
                                {
                                  weight--;
                                }
                            });
                          },
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        RoundIconButton(
                          icon: FontAwesomeIcons.plus,
                          onPressed:(){
                            setState(() {
                              weight++;
                            });
                          },
                        ),

                      ],
                    )

                  ],
                ),
              ),),

              //AGE CARD
              Expanded(child: ReusableCard(
                colour: kActiveColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'AGE',
                      style: kLabelTextStyle,
                    ),
                    Text(
                      age.toString(),
                      style: kNumberFontStyle,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                          onPressed: (){
                            setState(() {
                              if(age > 10)
                                {
                                  age--;
                                }
                            });
                          },
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        RoundIconButton(
                          icon: FontAwesomeIcons.plus,
                          onPressed:(){
                            setState(() {
                              age++;
                            });
                          },
                        ),

                      ],
                    )

                  ],
                ),
              ),),
            ],
          ),
          ),
          BottomButton(buttonTilte: 'CALACULATE',
              onTap: (){
            CalculatorBrain calc = CalculatorBrain(height: height,weight: weight);



            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context)=> ResultPage(
                      bmiResult: calc.getCalculateBmi(),
                      interpretation: calc.getInterpretaion(),
                      resultText: calc.getResult(),

                    )));
          }),
        ],
      )

    );
  }
}










