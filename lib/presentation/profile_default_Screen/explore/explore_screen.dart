import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app_v5/presentation/app_theme/app_theme_data.dart';
import 'package:online_exam_app_v5/presentation/profile_default_Screen/explore/all_subject_widgets.dart';
import 'package:online_exam_app_v5/presentation/profile_default_Screen/explore/search_widget.dart';
import 'package:online_exam_app_v5/presentation/utilities/user_with_token.dart';
import '../../../di.dart';
import 'explore_viewmodel.dart';

class ExploreScreen extends StatelessWidget {
  ExploreScreen({super.key});


  static const String routeName = "ExploreScreen";
  TextEditingController searchController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    var userWithToken = ModalRoute.of(context)?.settings.arguments as UserWithToken;
    String? argsToken=userWithToken.token??"";

    return BlocProvider(

      create: (context) {
        ExploreViewModel exploreViewModel = getIt.get<ExploreViewModel>();
        exploreViewModel.exploreSubjects(argsToken);
        return exploreViewModel;
      },

        child: Scaffold(
          appBar: AppBar(
            title: Text("Survey"),
          ),
          body: SingleChildScrollView(
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
                      BlocBuilder<ExploreViewModel, ExploreScreenState>(
                        builder: (context, state) {
                          if (state is ExploreLoadingState) {
                            return Center(child: CircularProgressIndicator());
                          } else if(state is ExploreSuccessState) {
                            return AllSubjectWidgets(allSubjects: state.subjects,userToken: argsToken);
                          }
                          else {
                            return Container();
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