import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app_v5/presentation/app_theme/app_theme_data.dart';
import 'package:online_exam_app_v5/presentation/profile_default_Screen/explore/all_subject_widgets.dart';
import 'package:online_exam_app_v5/presentation/profile_default_Screen/explore/browse_subject_widget.dart';
import 'package:online_exam_app_v5/presentation/profile_default_Screen/explore/search_widget.dart';

import '../../../di.dart';
import '../../../domain/models/subject.dart';
import '../../../domain/models/user.dart';
import '../../utilities/size_utilities.dart';
import '../../utilities/utilitis.dart';
import '../../widgets/error_dialog.dart';
import '../../widgets/show_loading.dart';
import 'explore_viewmodel.dart';

class ExploreScreen extends StatelessWidget {
  ExploreScreen({super.key});

  static const String routeName = "ExploreScreen";
  TextEditingController searchController = TextEditingController();

  List<String> imagesList = [
    "icon_exam.png",
    "icon_exam.png",
    "icon_exam.png",
    "icon_exam.png",
    "icon_exam.png",
    "icon_exam.png",
    "icon_exam.png",
    "icon_exam.png",
    "icon_exam.png",
    "icon_exam.png",
    "icon_exam.png",
    "icon_exam.png",
    "icon_exam.png",
    "icon_exam.png",
    "icon_exam.png",
    "icon_exam.png",
    "icon_exam.png",
    "icon_exam.png",
    "icon_exam.png",
    "icon_exam.png",
    "icon_exam.png",
    "icon_exam.png",
    "icon_exam.png",
    "icon_exam.png",
    "icon_exam.png",
  ];
  List<String> languageName = [
    "English 1",
    "English 2",
    "English 3",
    "English 4",
    "English 5",
    "English 6",
    "English 7",
    "English 8",
    "English 9",
    "English 10",
    "English 11",
    "English 12",
    "English 13",
    "English 14",
    "English 15",
    "English 16",
    "English 17",
    "English 18",
    "English 19",
    "English 20",
    "English 21",
    "English 22",
    "English 23",
    "English 24",
    "English 25",
  ];
  List<Subject> subjects=[];

  ExploreViewModel exploreViewModel = getIt.get<ExploreViewModel>();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => exploreViewModel,
      child: BlocListener<ExploreViewModel,ExploreScreenState>(
        listenWhen: (previous, current) {
          if(current is ExploreLoadingState || current is ExploreErrorState || current is ExploreSuccessState)
          {
            return true;
          }
          return false ;
        },
        listener: (context, state) {

          if (state is ExploreLoadingState) {
            showLoadingDialog(context);
          } else if (state is ExploreErrorState) {
            var message = extractErrorMessage(state.exception);
            Navigator.of(context).pop(); // Close loading dialog
            showErrorDialog(context, message);
          } else if (state is ExploreSuccessState) {
            print("subjectttttttttttttttttt");
            print(state.subjects?.first.name);
             subjects=state.subjects!;
            Navigator.of(context).popUntil((route)=>route.isFirst); // Close dialogs before showing success
          }
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SearchWidget(
                    controller: searchController,
                    onSearch: (query) {
                      print("search result for $query");
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Browse By Subject",
                      style: AppThemeData.lightTheme.textTheme.headlineSmall,
                    ),
                    SizedBox(height: 15),
                    BlocBuilder<ExploreViewModel,ExploreScreenState>(
                      builder: (context, state) {

                        if (state is ExploreLoadingState) {
                          return Center(child: CircularProgressIndicator());
                        } else {

                          return  ElevatedButton(
                            onPressed: () {
                              print(exploreViewModel.state);
                              exploreViewModel.doIntent;
                              print("this is ${exploreViewModel.state}");
                            },
                            style:ElevatedButton.styleFrom(
                                minimumSize: Size(double.infinity,MediaQuery.of(context).size.height*appSize.bottomWidthRatio),
                                backgroundColor:AppThemeData.primaryColor
                            ),
                            child: const Text("press",
                              style:  TextStyle(
                                fontWeight: FontWeight.bold,
                                color:AppThemeData.textSecondaryColor,
                              ),

                            ),
                          );
                            //AllSubjectWidgets(allSubjects: subjects);
                        }
                      },
                    ),

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
