import 'package:flutter/material.dart';
import 'package:day_8_starter/input_page.dart';

class ResultsPage extends StatelessWidget {
  double bmi;
  String contentFiller;
  String bmiStatus;
  Color bmiStatusColor;

  ResultsPage(this.bmi,this.bmiStatus,this.contentFiller,this.bmiStatusColor);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI RESULTS'),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(flex:2,child: Container(margin: EdgeInsets.fromLTRB(12, 12, 12, 0),child: Text('Your Result',style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),))),
            Expanded(flex:12,
              child: Center(
                child: Container(margin: EdgeInsets.fromLTRB(12, 0, 12, 12),
                  decoration: BoxDecoration(
                    color: Color(0xFF1D1F31),
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),

                  child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 20,),
                    Text(bmiStatus,style: TextStyle(color: bmiStatusColor),),
                    SizedBox(height: 20,),
                    Text('${bmi.toStringAsFixed(2)}',style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),),
                    SizedBox(height: 30,),
                    Text('NORMAL BMI RANGE',style: kLabelTextStyle,),
                    SizedBox(height: 10,),
                    Text('18.5 - 25 kg/m2',style: TextStyle(fontSize: 16, color: Colors.white, letterSpacing: 1.15),),
                    SizedBox(height: 30,),
                    Text(contentFiller,style: TextStyle(fontSize: 16, color: Colors.white, letterSpacing: 1.15),textAlign: TextAlign.center,),
                    SizedBox(height: 30,),
                    FlatButton(color:Color(0xFF0A0D20),onPressed: (){},child: Text('SAVE THIS RESULT',style: TextStyle(color: Colors.white),),)

                  ],
                ),),
              ),
            ),
            Expanded(flex:1,
              child: Container(
                  width: double.infinity,
                  height: 40,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => InputPage()));
                    },
                    child: Text('RE CALCULATE YOUR BMI',style: TextStyle(fontSize: 20,letterSpacing: 1.15),),
                    color: Color(0XFFEB1555),
                  )),
            ),
          ],
        ),
    );
  }
}
