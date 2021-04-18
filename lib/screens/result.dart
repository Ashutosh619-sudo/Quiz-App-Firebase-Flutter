import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intern_task/controller/quiz/quiz_controller.dart';
import 'package:intern_task/controller/quiz/quiz_state.dart';
import 'package:intern_task/model/question_model.dart';

class ResultPage extends StatelessWidget {

  final QuizState state;
  final List<Question> questions;

  ResultPage({Key key, this.questions,this.state});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 400,
                  width: double.infinity,
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.all(25),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(183, 130, 225, 1)),
                      child: Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromRGBO(204, 164, 233, 1)),
                        child: Container(
                          padding: const EdgeInsets.all(40),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: RichText(
                            text: TextSpan(
                              text: 'Your Score \n',
                              style: TextStyle(
                                color: Color.fromRGBO(154, 83, 212, 1),
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                    text: (state.correct.length*10).toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30)),
                                TextSpan(
                                    text: 'pt', style: TextStyle(fontSize: 18)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(154, 83, 212, 1),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 120, left: 40, right: 40),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              GestureDetector(
                                onTap: (){
                                  context.read(quizControllerProvider).reset();
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.blue,
                                  ),
                                  child: Icon(
                                    Icons.repeat_rounded,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 5),
                                child: Text(
                                  "Play again",
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey[600],
                                ),
                                child: Icon(
                                  Icons.remove_red_eye_rounded,
                                  color: Colors.white,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                child: Text(
                                  "Review Answer",
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.purple[800],
                                ),
                                child: Icon(
                                  Icons.share_rounded,
                                  color: Colors.white,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                child: Text(
                                  "Share Score",
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.pinkAccent,
                                  ),
                                  child: Icon(
                                    Icons.picture_as_pdf_rounded,
                                    color: Colors.white,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 5),
                                  child: Text(
                                    "Generate PDF",
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.pinkAccent[100],
                                  ),
                                  child: Icon(
                                    Icons.home_rounded,
                                    color: Colors.white,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 5),
                                  child: Text(
                                    "Home",
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.blueGrey[800],
                                  ),
                                  child: Icon(
                                    Icons.leaderboard_rounded,
                                    color: Colors.white,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 5),
                                  child: Text(
                                    "Leaderboard",
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.all(15),
                  padding: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Color.fromRGBO(154, 83, 212, 1).withOpacity(0.4),
                        offset: Offset(0.0, 0.0),
                        blurRadius: 20.0,
                      )
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadiusDirectional.circular(15),
                  ),
                  child: Column(
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text(
                                    "G",
                                    style: TextStyle(
                                        color: Color.fromRGBO(154, 83, 212, 1)),
                                  ),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color.fromRGBO(154, 83, 212, 1)),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "100%",
                                        style: TextStyle(
                                          fontSize: 17,
                                          color:
                                              Color.fromRGBO(154, 83, 212, 1),
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                      Text("Completion"),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text(
                                    "G",
                                    style: TextStyle(
                                        color: Color.fromRGBO(154, 83, 212, 1)),
                                  ),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color.fromRGBO(154, 83, 212, 1)),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        (questions.length).toString(),
                                        style: TextStyle(
                                          fontSize: 17,
                                          color:
                                              Color.fromRGBO(154, 83, 212, 1),
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                      Text("Total Question"),
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ), // 1St
                      Container(
                        margin: EdgeInsets.only(top: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text(
                                    "G",
                                    style: TextStyle(color: Colors.green),
                                  ),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.green),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        (state.correct.length).toString(),
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.green,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                      Text("Correct Answer"),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text(
                                    "G",
                                    style: TextStyle(color: Colors.orange),
                                  ),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.orange),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        (state.incorrect.length).toString(),
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.orange,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                      Text("Wrong Answer"),
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ), // 2nd
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
