import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intern_task/controller/quiz/quiz_controller.dart';
import 'package:intern_task/controller/quiz/quiz_state.dart';
import 'package:intern_task/model/question_model.dart';
import 'package:intern_task/repository/quiz_repo.dart';
import 'package:intern_task/screens/question_page.dart';
import 'package:intern_task/screens/result.dart';
import 'package:intern_task/widget/circular_button.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: StartQuiz(),
      ),
    );
  }
}

final quizQuestionsProvider = FutureProvider.autoDispose<List<Question>>(
  (ref) => ref.watch(quizRepositoryProvider).getQuestions(),
);


class StartQuiz extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final quizQuestion = useProvider(quizQuestionsProvider);
    final pageController = usePageController();
    return Scaffold(
      body: quizQuestion.when(
        data: (questions)=>buildBody(context,pageController,questions), 
        loading: ()=> const Center(child: CircularProgressIndicator(),), 
        error: (error, _)=>Center(child:Text(error.toString()))),
      bottomSheet: quizQuestion.maybeWhen(
        data:(questions){
          final quizeState = useProvider(quizControllerProvider.state);
          if(!quizeState.answered) return const SizedBox();
          return CustomButton(
            title: pageController.page.toInt() + 1 < questions.length
                  ? 'Next Question'
                  : 'See Results',
            onTap: (){
              context
                    .read(quizControllerProvider)
                    .nextQuestion(questions, pageController.page.toInt());
              if (pageController.page.toInt() + 1 < questions.length) {
                  pageController.nextPage(
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.linear,
                  );
                }        
            },
          );
        },
        orElse: ()=>const SizedBox()
      ) 
    );
  }
}

  Widget buildBody(
    BuildContext context,
    PageController pageController,
    List<Question> questions,
  ) {
    if (questions.isEmpty) return Center(child:Text('No questions found.'));

    final quizState = useProvider(quizControllerProvider.state);
    return quizState.status == QuizStatus.complete
        ? ResultPage(state: quizState, questions: questions)
        : QuestionPage(
            pageController: pageController,
            state: quizState,
            questions: questions,
          );
  }