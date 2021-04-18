import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';


class Question extends Equatable{
  final String question;
  final String correct;
  final List<dynamic> options;


  const Question({
    @required this.question,
    @required this.correct,
    @required this.options
  });

  @override
  List<Object> get props =>[
    question,
    correct,
    options,
  ];

  factory Question.fromQuery(QueryDocumentSnapshot snapshot){
    if(snapshot==null) return null;

    return Question(
      question: snapshot.data()["question"], 
      correct: snapshot.data()["correct"], 
      options: snapshot.data()["options"]);

  }

}