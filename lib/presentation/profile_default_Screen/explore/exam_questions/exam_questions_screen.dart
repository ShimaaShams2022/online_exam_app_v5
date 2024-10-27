import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../di.dart';
import '../../../utilities/exam_data.dart';
import 'exam_questions_viewmodel.dart';

class ExamQuestionsScreen extends StatelessWidget {
  const ExamQuestionsScreen({super.key});

  static const String routeName = "ExamsQuestionsScreen";

  @override
  Widget build(BuildContext context) {
    final examDataForSubject = ModalRoute.of(context)?.settings.arguments as ExamData;
    return BlocProvider(
      create: (context) {
        ExamQuestionsViewModel questionsViewModel = getIt.get<ExamQuestionsViewModel>();
        questionsViewModel.exploreQuestions(examDataForSubject.userToken, examDataForSubject.examData.id??"");
        return questionsViewModel;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(examDataForSubject.examData.title??""),

        ),
        body:  BlocBuilder<ExamQuestionsViewModel, ExamQuestionsScreenState>(
          builder: (context, state) {
            if (state is ExamQuestionsLoadingState) {
              return Center(child: CircularProgressIndicator());
            } else if(state is ExamQuestionsSuccessState) {
              return Text(state.questions!.first.exam!.id.toString());
            }
            else {
              return Container();
            }
          },
        ),
        ),
      );

  }
}
