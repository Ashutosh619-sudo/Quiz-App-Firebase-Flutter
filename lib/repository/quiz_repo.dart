import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intern_task/model/question_model.dart';

final quizRepositoryProvider =
    Provider<QuizRepository>((ref) => QuizRepository(ref.read));

class QuizRepository{
  final Reader _read;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  QuizRepository(this._read);

  Future<List<Question>> getQuestions()async{
    QuerySnapshot qs = await firestore.collection("questions").get();
    List<QueryDocumentSnapshot> all_questions = qs.docs;
    return all_questions.map((e) => Question.fromQuery(e)).toList();
  }

}