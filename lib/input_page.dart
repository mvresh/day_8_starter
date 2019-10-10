import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Container dummy = Container(
    margin: EdgeInsets.all(12),
    decoration: BoxDecoration(

      color: Color(0xFF1D1F31),
      borderRadius: BorderRadius.all(Radius.circular(12),),),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableWidget(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(FontAwesomeIcons.mars,size: 60,),
                        SizedBox(height: 10,),
                        Text('Male',style: TextStyle(fontSize: 15),),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableWidget(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(FontAwesomeIcons.mars,size: 60,),
                        SizedBox(height: 10,),
                        Text('Male',style: TextStyle(fontSize: 15),),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ReusableWidget(),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableWidget(),
                ),
                Expanded(
                  child: ReusableWidget(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ReusableWidget extends StatelessWidget {
  final Color color;
  final Widget child;

  ReusableWidget({this.color = const Color(0xFF1D1F31),this.child });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color(0xFF1D1F31),
        borderRadius: BorderRadius.all(Radius.circular(12),),),
      child:child,
    );
  }
}
