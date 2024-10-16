import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app_v5/presentation/forget_password/reset_password_screen.dart';
import 'package:online_exam_app_v5/presentation/forget_password/verify_view_model.dart';

import '../../di.dart';
import '../app_theme/app_theme_data.dart';
import '../utilities/size_utilities.dart';

import '../utilities/text_utilities.dart';
import '../utilities/utilitis.dart';
import '../widgets/error_dialog.dart';
import '../widgets/otb_widget.dart';
import '../widgets/show_loading.dart';
import 'forget_password_view_model.dart';

class VerifyScreen extends StatelessWidget {
  VerifyScreen({super.key});
  static const String routeName = "VerifyScreen";

  VerifyViewModel verifyViewModel = getIt.get<VerifyViewModel>();
  ForgetPasswordViewModel forgetViewModel =
      getIt.get<ForgetPasswordViewModel>();

  final _formKey = GlobalKey<FormState>();
  final TextEditingController verifyPartController1 = TextEditingController();
  final TextEditingController verifyPartController2 = TextEditingController();
  final TextEditingController verifyPartController3 = TextEditingController();
  final TextEditingController verifyPartController4 = TextEditingController();
  final TextEditingController verifyPartController5 = TextEditingController();
  final TextEditingController verifyPartController6 = TextEditingController();

  bool isButtonEnabled = false;
  void validateInputs() {
    isButtonEnabled = _formKey.currentState?.validate() ?? false;
  }

  @override
  Widget build(BuildContext context) {
    final String editEmail =
        ModalRoute.of(context)?.settings.arguments as String;
    return MultiBlocProvider(
      providers: [
        BlocProvider<VerifyViewModel>(
          create: (context) => verifyViewModel,
        ),
        BlocProvider<ForgetPasswordViewModel>(
          create: (context) => forgetViewModel,
        )
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text("Password"),
        ),
        body: BlocListener<VerifyViewModel, VerifyScreenState>(
          listenWhen: (previous, current) {
            if (current is VerifyLoadingState ||
                current is VerifyErrorState ||
                current is VerifySuccessState) {
              return true;
            }
            return false;
          },
          listener: (context, state) {
            if (state is VerifyLoadingState) {
              showLoadingDialog(context);
            } else if (state is VerifyErrorState) {
              var message = extractErrorMessage(state.exception);
              Navigator.of(context).pop(); // Close loading dialog
              showErrorDialog(context, message);
            } else if (state is VerifySuccessState) {
              Navigator.of(context).popUntil((route) =>
                  route.isFirst); // Close dialogs before showing success
              Navigator.pushNamed(context, ResetPasswordScreen.routeName,
                  arguments: editEmail);
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
                    SizedBox(
                        height: MediaQuery.of(context).size.height *
                            appSize.spaceHeightRatio),
                    Text(
                      "Please enter your email associated to \n your account",
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height *
                            appSize.spaceWidthRatio),
                    SizedBox(
                        height: MediaQuery.of(context).size.height *
                            appSize.spaceWidthRatio),
                    Row(
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width *
                                appSize.spaceWidthRatio),
                        Expanded(
                            child: OtbWidget(
                          controller: verifyPartController1,
                        )),
                        SizedBox(
                            width: MediaQuery.of(context).size.width *
                                appSize.spaceWidthRatio),
                        Expanded(
                            child: OtbWidget(
                          controller: verifyPartController2,
                        )),
                        SizedBox(
                            width: MediaQuery.of(context).size.width *
                                appSize.spaceWidthRatio),
                        Expanded(
                            child: OtbWidget(
                          controller: verifyPartController3,
                        )),
                        SizedBox(
                            width: MediaQuery.of(context).size.width *
                                appSize.spaceWidthRatio),
                        Expanded(
                            child: OtbWidget(
                          controller: verifyPartController4,
                        )),
                        SizedBox(
                            width: MediaQuery.of(context).size.width *
                                appSize.spaceWidthRatio),
                        Expanded(
                            child: OtbWidget(
                          controller: verifyPartController5,
                        )),
                        SizedBox(
                            width: MediaQuery.of(context).size.width *
                                appSize.spaceWidthRatio),
                        Expanded(
                            child: OtbWidget(
                          controller: verifyPartController6,
                        )),
                        SizedBox(
                            width: MediaQuery.of(context).size.width *
                                appSize.spaceWidthRatio),
                      ],
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height *
                            appSize.spaceWidthRatio),
                    SizedBox(
                        height: MediaQuery.of(context).size.height *
                            appSize.spaceWidthRatio),
                    BlocBuilder<VerifyViewModel, VerifyScreenState>(
                      builder: (context, state) {
                        if (state is VerifyLoadingState) {
                          return Center(child: CircularProgressIndicator());
                        } else {
                          return Column(
                            children: [
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (isButtonEnabled == true) {
                                      verifyPassword();
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                      minimumSize: Size(
                                          double.infinity,
                                          MediaQuery.of(context).size.height *
                                              appSize.bottomWidthRatio),
                                      backgroundColor: isButtonEnabled
                                          ? (AppThemeData.primaryColor)
                                          : (AppThemeData.secondaryColor)),
                                  child: Text(
                                    TextUtilities.continueButton,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: AppThemeData.textSecondaryColor,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      appSize.spaceWidthRatio),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      appSize.spaceWidthRatio),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("Didn't resive Code? "),
                                  InkWell(
                                      onTap: () {
                                        resendPassword(editEmail);
                                      },
                                      child: Text(
                                        "Resend",
                                        style: TextStyle(
                                          color: AppThemeData.primaryColor,
                                          decoration: TextDecoration.underline,
                                          decorationColor:
                                              AppThemeData.primaryColor,
                                          decorationThickness: 2,
                                        ),
                                      )),
                                ],
                              )
                            ],
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

  void verifyPassword() {
    String n1 = verifyPartController1.text.toString();
    String n2 = verifyPartController2.text.toString();
    String n3 = verifyPartController3.text.toString();
    String n4 = verifyPartController4.text.toString();
    String n5 = verifyPartController5.text.toString();
    String n6 = verifyPartController6.text.toString();
    String otp = n1 + n2 + n3 + n4 + n5 + n6;

    verifyViewModel.doIntent(VerifyIntent(otp));
  }

  void resendPassword(String email) {
    forgetViewModel.doIntent(ForgetPasswordIntent(email));
  }
}
