import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app_v5/presentation/forget_password/forget_password_view_model.dart';
import 'package:online_exam_app_v5/presentation/forget_password/verify_screen.dart';

import '../../di.dart';
import '../app_theme/app_theme_data.dart';
import '../utilities/size_utilities.dart';
import '../utilities/text_utilities.dart';
import '../utilities/utilitis.dart';
import '../utilities/validation.dart';
import '../widgets/custom_text_form_field.dart';
import '../widgets/error_dialog.dart';
import '../widgets/show_loading.dart';

class ForgetPasswordScreen extends StatelessWidget {
   ForgetPasswordScreen({super.key});
  static const String routeName = "ForgetPasswordScreen";
  ForgetPasswordViewModel viewModel = getIt.get<ForgetPasswordViewModel>();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
   bool isButtonEnabled=false;

   void validateInputs(){

     isButtonEnabled=_formKey.currentState?.validate()??false;

   }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Password"),
        ),
        body: BlocListener<ForgetPasswordViewModel, ForgetPasswordScreenState>(
          listenWhen: (previous, current) {
            if(current is ForgetLoadingState || current is ForgetErrorState || current is ForgetSuccessState)
            {
              return true;
            }
            return false ;
          },
          listener: (context, state) {

            if (state is ForgetLoadingState) {
              showLoadingDialog(context);
            } else if (state is ForgetErrorState) {
              var message = extractErrorMessage(state.exception);
              Navigator.of(context).pop(); // Close loading dialog
              showErrorDialog(context, message);
            } else if (state is ForgetSuccessState) {
              final email=emailController.text;
              Navigator.of(context).popUntil((route)=>route.isFirst); // Close dialogs before showing success
              Navigator.pushNamed(context, VerifyScreen.routeName,arguments: email);

            }
          },

          child: Form(
            key: _formKey,
            onChanged: validateInputs,
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Center(
                child: Column(

                  children: [
                     Text("Forget Password"),
                    SizedBox(height: MediaQuery.of(context).size.height*appSize.spaceHeightRatio),
                     Text("Please enter your email associated to \n your account", textAlign: TextAlign.center,),
                    SizedBox(height: MediaQuery.of(context).size.height*appSize.spaceHeightRatio),
                    CustomTextFormField(
                      controller: emailController,
                      label: TextUtilities.emailField,
                      hintText: TextUtilities.emailFieldAsk,
                      validator: validateEmail,

                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*appSize.spaceHeightRatio),
                    SizedBox(height: MediaQuery.of(context).size.height*appSize.spaceHeightRatio),
                    BlocBuilder<ForgetPasswordViewModel, ForgetPasswordScreenState>(
                      builder: (context, state) {

                        if (state is ForgetLoadingState) {
                          return Center(child: CircularProgressIndicator());
                        } else {
                          return SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                if (isButtonEnabled==true){
                                  forgetPassword();
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
              ),
            ),
          ),
        ),
      ),
    );
  }
   void forgetPassword() {
     String email = emailController.text;
     viewModel.doIntent(ForgetPasswordIntent(email));
   }
}
