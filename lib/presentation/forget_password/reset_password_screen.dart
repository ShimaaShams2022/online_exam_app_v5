import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app_v5/presentation/forget_password/reset_password_view_model.dart';
import 'package:online_exam_app_v5/presentation/login/loginscreen.dart';

import '../../di.dart';
import '../app_theme/app_theme_data.dart';
import '../utilities/size_utilities.dart';
import '../utilities/text_utilities.dart';
import '../utilities/utilitis.dart';
import '../utilities/validation.dart';
import '../widgets/custom_text_form_field.dart';
import '../widgets/error_dialog.dart';
import '../widgets/show_loading.dart';

class ResetPasswordScreen extends StatelessWidget {
   ResetPasswordScreen({super.key});
  static const String routeName = "ResetPasswordScreen";
   final _formKey = GlobalKey<FormState>();
   ResetPasswordViewModel viewModel = getIt.get<ResetPasswordViewModel>();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  bool isButtonEnabled=false;

  void validateInputs(){

    isButtonEnabled=_formKey.currentState?.validate()??false;

  }

  @override
  Widget build(BuildContext context) {
    final String editEmail=ModalRoute.of(context)?.settings.arguments as String;
    return BlocProvider(
      create: (context) => viewModel,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Password"),
        ),
        body: BlocListener<ResetPasswordViewModel, ResetPasswordScreenState>(
          listenWhen: (previous, current) {
            if(current is ResetLoadingState || current is ResetErrorState || current is ResetSuccessState)
            {
              return true;
            }
            return false ;
          },
          listener: (context, state) {

            if (state is ResetLoadingState) {
              showLoadingDialog(context);
            } else if (state is ResetErrorState) {
              var message = extractErrorMessage(state.exception);
              Navigator.of(context).pop(); // Close loading dialog
              showErrorDialog(context, message);
            } else if (state is ResetSuccessState) {
              Navigator.of(context).popUntil((route)=>route.isFirst); // Close dialogs before showing success
              Navigator.pushNamed(context, LoginScreen.routeName);

            }
          },
          child: Container(
            padding: EdgeInsets.all(appSize.spacePadding),
            child: Form(
              key: _formKey,
              onChanged: validateInputs,
              child:SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height*appSize.spaceHeightRatio),
                    Text("Reset Password"),
                    SizedBox(
                        height: MediaQuery.of(context).size.height *
                            appSize.spaceHeightRatio),
                    Text(
                      "Password must not be empty and must contain \n6 characters with upper case letter and one\n number at least ",
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*appSize.spaceHeightRatio),
                    SizedBox(height: MediaQuery.of(context).size.height*appSize.spaceHeightRatio),
                    Column(
                      children: [
                        CustomTextFormField(
                          controller: passwordController,
                          label: TextUtilities.passwordField,
                          hintText: TextUtilities.passwordFieldAsk,
                          validator: validatePassword,
                          obscureText: true,
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*appSize.spaceHeightRatio),
                        CustomTextFormField(
                          controller: confirmPasswordController,
                          label: TextUtilities.confirmPassword,
                          hintText: TextUtilities.confirmPasswordAsk,
                          validator: (value)=> validateConfirmPassword(passwordController.text, value),
                          obscureText: true,

                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*appSize.spaceHeightRatio),
                        SizedBox(height: MediaQuery.of(context).size.height*appSize.spaceHeightRatio),
                        BlocBuilder<ResetPasswordViewModel,ResetPasswordScreenState>(
                          builder: (context, state) {

                            if (state is ResetLoadingState) {
                              return Center(child: CircularProgressIndicator());
                            } else {
                              return SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (isButtonEnabled==true){
                                      resetPassword(editEmail);
                                    }
                                  },
                                  style:ElevatedButton.styleFrom(
                                      minimumSize: Size(double.infinity,MediaQuery.of(context).size.height*appSize.bottomWidthRatio),
                                      backgroundColor:isButtonEnabled? (AppThemeData.primaryColor ): (AppThemeData.secondaryColor)
                                  ),
                                  child: Text(TextUtilities.continueButton,
                                    style:  TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color:AppThemeData.textSecondaryColor,
                                    ),

                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      ],
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

   void resetPassword(String email) {
    String password=passwordController.text;

     viewModel.doIntent(ResetPasswordIntent(email,password));
   }
}
