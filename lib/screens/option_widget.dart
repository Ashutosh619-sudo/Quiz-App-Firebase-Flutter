import 'package:flutter/material.dart';

class OptionWidget extends StatefulWidget {

  final String answer;
  final bool isSelected;
  final bool isCorrect;
  final bool isDisplayingAnswer;
  final VoidCallback onTap;

  OptionWidget({Key key,
  @required this.answer,
  @required this.isSelected,
  @required this.isCorrect,
  @required this.isDisplayingAnswer,
  @required this.onTap,
  });

  @override
  _OptionWidgetState createState() => _OptionWidgetState();
}

class _OptionWidgetState extends State<OptionWidget> {


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        //margin: EdgeInsets.only(top: 5.0,bottom: 10.0),
        width: MediaQuery.of(context).size.width*0.70,
        height: MediaQuery.of(context).size.height*0.06,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: widget.isDisplayingAnswer
                ? widget.isCorrect
                    ? Colors.green
                    : widget.isSelected
                        ? Colors.red
                        : Colors.white
                : Colors.white,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          boxShadow: [
            BoxShadow(
              color:  Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 3,
              offset: Offset(0, 3),
            )
          ]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text(widget.answer,style: TextStyle(fontSize: 16.0),)),
            Container(
              padding: EdgeInsets.all(10.0),
              child: widget.isDisplayingAnswer?widget.isCorrect?Icon(Icons.check,color: Colors.green,):widget.isSelected?Icon(Icons.thumb_down,color:Colors.red):SizedBox.shrink():SizedBox.shrink(),
              )
        ],),
      ),
    );
  }
}