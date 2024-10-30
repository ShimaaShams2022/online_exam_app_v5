import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app_v5/presentation/app_theme/app_theme_data.dart';
import 'package:online_exam_app_v5/presentation/profile_default_Screen/explore/exam_questions/exam_body.dart';
import 'package:online_exam_app_v5/presentation/profile_default_Screen/explore/exam_questions/show_timer_widget.dart';
import '../../../../di.dart';
import '../../../utilities/exam_data.dart';
import 'exam_questions_viewmodel.dart';


class ExamQuestionsScreen extends StatefulWidget {
  const ExamQuestionsScreen({super.key});

  static const String routeName = "ExamsQuestionsScreen";

  @override
  State<ExamQuestionsScreen> createState() => _ExamQuestionsScreenState();
}

class _ExamQuestionsScreenState extends State<ExamQuestionsScreen> {
  @override
  Widget build(BuildContext context) {
    final examDataForSubject =
        ModalRoute.of(context)?.settings.arguments as ExamData;
    Duration examDuration =
        Duration(minutes: examDataForSubject.examData.duration!.toInt());

    return BlocProvider(
      create: (context) {
        ExamQuestionsViewModel questionsViewModel =
            getIt.get<ExamQuestionsViewModel>();
        questionsViewModel.exploreQuestions(
            examDataForSubject.userToken, examDataForSubject.examData.id ?? "");
        return questionsViewModel;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(examDataForSubject.examData.title ?? ""),
              Row(
                children: [
                  Image.asset("assets/images/clock3.png"),
                  const SizedBox(
                    width: 5,
                  ),
                  ShowTimerWidget(initialDuration: examDuration)
                ],
              )
            ],
          ),
        ),
        body: BlocBuilder<ExamQuestionsViewModel, ExamQuestionsScreenState>(
          builder: (context, state) {
            if (state is ExamQuestionsLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ExamQuestionsSuccessState) {
              var allQuestions = state.questions;
              if (allQuestions!.isEmpty) {
                return const Center(
                  child: Text(
                    "Empty Exam!",
                    style: TextStyle(
                        color: AppThemeData.errorColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                );
              } else {
                return ExamScreenBody(
                    examData: examDataForSubject,
                    questions: allQuestions,
                    examDuration: examDuration);
              }
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
