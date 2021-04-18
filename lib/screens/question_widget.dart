import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intern_task/controller/quiz/quiz_controller.dart';

class QuestionWidget extends HookWidget {
  final String question;
  final int numberOfQuestions;
  final int currentQuestionNumber;

  QuestionWidget({Key key, this.question,this.numberOfQuestions,this.currentQuestionNumber});


  Widget build(BuildContext context) {
    final quizState = useProvider(quizControllerProvider.state);
    double numberOfRights =quizState.correct.length/numberOfQuestions;
    double numberOfWrongs =quizState.incorrect.length/numberOfQuestions;
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.20,
      left:MediaQuery.of(context).size.width*0.025,
      child: Container(
     
      height: MediaQuery.of(context).size.height*0.3,
      width: MediaQuery.of(context).size.width*0.95,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        boxShadow: [
          BoxShadow(
            color:  Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          )
        ]
      ),
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Text(quizState.correct.length.toString(),style: TextStyle(fontSize: 16.0,color: Colors.teal, fontWeight: FontWeight.w500),)),
                Container(
                  //height: 10.0,
                  width: 50.0,
                  child: LinearProgressIndicator(value:numberOfRights,minHeight: 8.0,valueColor: AlwaysStoppedAnimation<Color>(Colors.teal),backgroundColor: Colors.white,),
                  ),
                  ]),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Text(quizState.incorrect.length.toString(),style: TextStyle(color: Colors.orange,fontSize: 16.0,fontWeight: FontWeight.w500),)),
                Container(
                  //height: 10.0,
                  width: 50.0,
                  child: LinearProgressIndicator(value: numberOfWrongs,minHeight: 8.0,valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),backgroundColor: Colors.white,),
                  ),
                  ]),
              
            ],
          ),
          SizedBox(height: 25.0,),
        Center(
          child: Container(
            //padding: EdgeInsets.only(top: 30.0),
            child:Text("Question ${currentQuestionNumber}/${numberOfQuestions}",
            style: TextStyle(
              fontSize: 17.0,
              color: Color.fromRGBO(159, 89, 215, 1),
              fontWeight: FontWeight.w500
            ),) ,),
        ),
        SizedBox(height: 25.0,),
        Container(
          padding: EdgeInsets.only(left: 10.0,right: 10.0),
          child: Text(question
          ,style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0
          ),),
        )
        ],
        ),
        ),
      ),
    );
  }
}