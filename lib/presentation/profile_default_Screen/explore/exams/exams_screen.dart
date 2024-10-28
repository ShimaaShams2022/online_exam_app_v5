import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app_v5/presentation/utilities/subject_data.dart';

import '../../../../di.dart';
import 'all_Exams_widgets.dart';
import 'exams_viewmodel.dart';

class ExamsScreen extends StatelessWidget {
   ExamsScreen({super.key});

  static const String routeName = "ExamsScreen";

  @override
  Widget build(BuildContext context) {
    final subjectData = ModalRoute.of(context)?.settings.arguments as SubjectData;
    return BlocProvider(
      create: (context) {
        ExamsViewModel examsViewModel = getIt.get<ExamsViewModel>();
        examsViewModel.exploreExams(subjectData.userToken, subjectData.subjectId);
        return examsViewModel;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(subjectData.subjectName),
        ),
        body:  BlocBuilder<ExamsViewModel, ExamsScreenState>(
          builder: (context, state) {
            if (state is ExamsLoadingState) {
              return Center(child: CircularProgressIndicator());
            } else if(state is ExamsSuccessState) {
              return AllExamsWidget(allExams: state.exams,userToken: subjectData.userToken, subjectName: subjectData.subjectName,);
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
