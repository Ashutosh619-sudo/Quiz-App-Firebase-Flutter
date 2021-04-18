import 'package:flutter/material.dart';
import 'package:intern_task/controller/quiz/quiz_controller.dart';
import 'package:intern_task/controller/quiz/quiz_state.dart';
import 'package:intern_task/model/question_model.dart';
import 'package:intern_task/screens/option_widget.dart';
import 'package:intern_task/screens/question_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class QuestionPage extends StatelessWidget {
  final PageController pageController;
  final QuizState state;
  final List<Question> questions;

  const QuestionPage({
    Key key,
    @required this.pageController,
    @required this.state,
    @required this.questions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      physics: NeverScrollableScrollPhysics(),
      itemCount: questions.length,
      itemBuilder: (context, index){
      final question = questions[index];
      return Scaffold(
        body: Stack(
          children: [
            Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
              child: Container(
                height: MediaQuery.of(context).size.height*0.35,
                decoration: BoxDecoration(
                  color: Colors.purple[600],
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.0),bottomRight: Radius.circular(20.0))
                ),
              ),
                ),
            ],
          ),
          QuestionWidget(
            question: question.question,
            numberOfQuestions: questions.length,
            currentQuestionNumber: index+1,),
          
          Positioned(
          top: (MediaQuery.of(context).size.height*0.03),
          left: (MediaQuery.of(context).size.width*0.12),
          child: Stack(
            children: [
              Container(
              padding: EdgeInsets.all(8.0),
              width: 100,
              height: 100,
            margin: EdgeInsets.all(100.0),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Center(child: Text((index+1).toString())),
                  CircularProgressIndicator(
                  value:(index+1)/questions.length,
                  strokeWidth: 6.0,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.purple[600])),
                ]),
            ),
            ]),
          ),
          
        Positioned(
          top: MediaQuery.of(context).size.height*0.53,
          left: MediaQuery.of(context).size.width*0.14,
          child: Center(
            child: Container(
              child: Column(
                    children: question.options
                        .map(
                          (e) => Padding(
                            padding: EdgeInsets.only(top: 15.0),
                            child: OptionWidget(
                              answer: e,
                              isSelected: e == state.selectedAnswer,
                              isCorrect: e == question.correct,
                              isDisplayingAnswer: state.answered,
                              onTap: () => context
                                  .read(quizControllerProvider)
                                  .submitAnswer(question, e),    
                            ),
                          ),
                        )
                        .toList(),
                  ),
            ),
          ),
        ),

          ],
        ),
      );
    }
    );
  }
}