import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app_v5/presentation/login/loginscreen.dart';
import 'package:online_exam_app_v5/presentation/utilities/validation.dart';

import '../../../di.dart';
import '../../app_theme/app_theme_data.dart';
import '../../utilities/size_utilities.dart';
import '../../utilities/utilitis.dart';
import '../../widgets/custom_text_form_field.dart';
import '../../widgets/error_dialog.dart';
import '../../widgets/show_loading.dart';
import 'change_password_view_model.dart';


class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({super.key});

  static const String routeName = "ChangePasswordScreen";
  // Field injection
  ChangePasswordViewModel changePasswordViewModel = getIt.get<ChangePasswordViewModel>();
  final _formKey = GlobalKey<FormState>();

  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();


  bool isButtonEnabled=false;

  void validateInputs(){

    isButtonEnabled=_formKey.currentState?.validate()??false;

  }


  @override
  Widget build(BuildContext context) {

    var userToken = ModalRoute.of(context)?.settings.arguments as String;
    return BlocProvider(
      create: (context) => changePasswordViewModel,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Reset Password"),
          ),
        body: BlocListener<ChangePasswordViewModel, ChangePasswordScreenState>(
          listenWhen: (previous, current) {
            if(current is ChangePasswordLoadingState || current is ChangePasswordErrorState || current is ChangePasswordSuccessState)
            {
              return true;
            }
            return false ;
          },
          listener: (context, state) {
            if (state is ChangePasswordLoadingState) {
              showLoadingDialog(context);
            } else if (state is ChangePasswordErrorState) {
              var message = extractErrorMessage(state.exception);
              Navigator.of(context).pop(); // Close loading dialog
              showErrorDialog(context, message);
            } else if (state is ChangePasswordSuccessState) {
              var userToken=state.userResponse?.token;
              Navigator.of(context).popUntil((route)=>route.isFirst); // Close dialogs before showing success
              Navigator.pushNamed(context,
                LoginScreen.routeName,
              );

            }
          },
          child: Container(
            padding: EdgeInsets.all(appSize.spacePadding),
            child: Form(
              key: _formKey,
              onChanged: validateInputs,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    CustomTextFormField(
                      controller: oldPasswordController,
                      label: "Current Password",
                      hintText:"Current Password",
                      validator:validatePassword,

                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*appSize.spaceHeightRatio),
                    CustomTextFormField(
                      controller: newPasswordController,
                      label: "New Password",
                      hintText: "New Password",
                      validator: validatePassword,

                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*appSize.spaceHeightRatio),
                    CustomTextFormField(
                      controller: rePasswordController,
                      label: "Confirm Password",
                      hintText: "Confirm Password",
                      validator:(value)=> validateConfirmPassword(newPasswordController.text, value),

                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*appSize.spaceHeightRatio),
                    SizedBox(height: MediaQuery.of(context).size.height*appSize.spaceHeightRatio),
                    BlocBuilder<ChangePasswordViewModel, ChangePasswordScreenState>(
                      builder: (context, state) {
                        if (state is ChangePasswordLoadingState) {
                          return Center(child: CircularProgressIndicator());
                        } else {
                          return SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                if (isButtonEnabled==true){
                                 changePassword(userToken);
                                }
                              },
                              style:ElevatedButton.styleFrom(
                                  minimumSize: Size(double.infinity,MediaQuery.of(context).size.height*appSize.bottomWidthRatio),
                                  backgroundColor:isButtonEnabled? (AppThemeData.primaryColor ): (AppThemeData.secondaryColor)
                              ),
                              child: Text("Update", style:  TextStyle(
                                fontWeight: FontWeight.bold,
                                color:AppThemeData.textSecondaryColor,
                              ),),
                            ),
                          );
                        }
                      },
                    ),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void changePassword(String token) {
    String currentPassword = oldPasswordController.text;
    String newPassword = newPasswordController.text;
    String rePassword = rePasswordController.text;



   changePasswordViewModel.doIntent(ChangePasswordIntent(oldPassword: currentPassword, newPassword: newPassword, rePassword: rePassword, token: token));
  }
}