import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app_v5/presentation/register/register_view_model.dart';

import '../../di.dart';
import '../app_theme/app_theme_data.dart';

import '../login/loginscreen.dart';
import '../utilities/size_utilities.dart';
import '../utilities/text_utilities.dart';
import '../utilities/utilitis.dart';
import '../utilities/validation.dart';
import '../widgets/custom_text_form_field.dart';


class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  static const String routeName = "RegisterScreen";
  // Field injection
  RegisterViewModel viewModel = getIt.get<RegisterViewModel>();
  final _formKey = GlobalKey<FormState>();

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

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
          title: Text(TextUtilities.signUpButton),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: BlocListener<RegisterViewModel, RegisterScreenState>(
          listenWhen: (previous, current) {
            if (previous is LoadingState) {
              Navigator.pop(context);
            }
            return current is LoadingState || current is ErrorState;
          },
          listener: (context, state) {
            if (state is LoadingState) {
              showDialog(context: context, builder: (context) {
                return AlertDialog(
                  content: Row(children: [
                    CircularProgressIndicator(),
                    SizedBox(width: 10),
                    Text("Loading...")
                  ]),
                );
              });
            } else if (state is ErrorState) {
              var message = extractErrorMessage(state.exception);
              Navigator.of(context).pop(); // Close loading dialog
              showDialog(context: context, builder: (context) {
                return AlertDialog(
                  content: Row(children: [
                    Expanded(child: Text(message)),
                  ]),
                );
              });
            } else if (state is SuccessState) {
              Navigator.of(context).pop(); // Close dialogs before showing success
              showDialog(context: context, builder: (context) {
                return AlertDialog(
                  content: Row(children: [
                    Text("Logged in Successfully"),
                  ]),
                );
              });
            }
          },
          child: Container(
           padding: EdgeInsets.all(appSize.spacePadding),
            child: Center(
              child: Form(
                key: _formKey,
                onChanged: validateInputs,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                  
                    children: [
                      CustomTextFormField(
                        controller: userNameController,
                        label: TextUtilities.userNameField,
                        hintText: TextUtilities.askUserNameField,
                        validator: validateFullName,
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*appSize.spaceHeightRatio),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextFormField(
                              controller: firstNameController,
                              label: TextUtilities.firstNameField,
                              hintText: TextUtilities.askFirstNameField,
                              validator: validateName,
                            ),
                          ),
                          SizedBox(width: MediaQuery.of(context).size.width*appSize.spaceWidthRatio),
                          Expanded(
                            child: CustomTextFormField(
                              controller: lastNameController,
                              label: TextUtilities.lastNameField,
                              hintText: TextUtilities.askLastNameField,
                              validator: validateName,

                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*appSize.spaceHeightRatio),
                      CustomTextFormField(
                        controller: emailController,
                        label: TextUtilities.emailField,
                        hintText: TextUtilities.emailFieldAsk,
                        validator: validateEmail,
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*appSize.spaceHeightRatio),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextFormField(
                              controller: passwordController,
                              label: TextUtilities.passwordField,
                              hintText: TextUtilities.passwordFieldAsk,
                              validator: validatePassword,
                              obscureText: true,
                            ),
                          ),
                          SizedBox(width: MediaQuery.of(context).size.width*appSize.spaceWidthRatio),
                          Expanded(
                            child: CustomTextFormField(
                              controller: confirmPasswordController,
                              label: TextUtilities.confirmPassword,
                              hintText: TextUtilities.confirmPasswordAsk,
                              validator: (value)=> validateConfirmPassword(passwordController.text, value),
                              obscureText: true,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*appSize.spaceHeightRatio),
                      CustomTextFormField(
                        controller: phoneNumberController,
                        label: TextUtilities.phoneNumberField,
                        hintText: TextUtilities.askPhoneNumberField,
                        validator: validateEgyptianPhoneNumber,
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*appSize.spaceHeightRatio),
                      SizedBox(height: MediaQuery.of(context).size.height*appSize.spaceHeightRatio),
                      BlocBuilder<RegisterViewModel, RegisterScreenState>(
                        builder: (context, state) {
                          if (state is LoadingState) {
                            return Center(child: CircularProgressIndicator());
                          } else {
                            return SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (emailController.text.isEmpty ||
                                      passwordController.text.isEmpty) {
                                    // Show a snack bar or dialog for empty fields
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text("Please fill all fields")));
                                  } else {
                                    signUp();
                                  }
                                },
                                style:ElevatedButton.styleFrom(
                                    minimumSize: Size(double.infinity,MediaQuery.of(context).size.height*appSize.bottomWidthRatio),
                                    backgroundColor:isButtonEnabled? (AppThemeData.primaryColor ): (AppThemeData.secondaryColor)
                                ),
                                child: Text(TextUtilities.signUpButton, style:  TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color:AppThemeData.textSecondaryColor,
                                ),),
                              ),
                            );
                          }
                        },
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*appSize.spaceHeightRatio),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                  
                        children: [
                          const Text(TextUtilities.askIfHaveAccount,
                            style: TextStyle(
                                color:AppThemeData.textPrimaryColor
                            ),),
                          InkWell(
                            onTap: (){
                              Navigator.pushNamed(context,LoginScreen.routeName);
                            },
                            child: const Text(
                              TextUtilities.loginButton,
                              style: TextStyle(
                                  color:AppThemeData.primaryColor,
                                  decoration: TextDecoration.underline
                              ),
                            ),
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
      ),
    );
  }

  void signUp() {
    String userName = userNameController.text;
    String firstName = firstNameController.text;
    String lastName = lastNameController.text;
    String email = emailController.text;
    String phone = phoneNumberController.text;
    String rePassword = confirmPasswordController.text;
    String password = passwordController.text;


    viewModel.doIntent(RegisterIntent(userName, firstName, lastName, email, phone, password, rePassword));
  }
}