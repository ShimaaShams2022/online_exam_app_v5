import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../di.dart';
import '../app_theme/app_theme_data.dart';
import '../utilities/size_utilities.dart';
import '../utilities/text_utilities.dart';
import '../utilities/utilitis.dart';
import '../utilities/validation.dart';
import '../widgets/custom_text_form_field.dart';
import 'loginviewmodel.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  static const String routeName = "LoginScreen";
  // Field injection
  LoginViewModel viewModel = getIt.get<LoginViewModel>();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
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
          title: Text('Login'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: BlocListener<LoginViewModel, LoginScreenState>(
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
           padding: EdgeInsets.all(16.0),
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  onChanged: validateInputs,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                  
                    children: [
                      CustomTextFormField(
                        controller: emailController,
                        label: TextUtilities.emailField,
                        hintText: TextUtilities.emailFieldAsk,
                        validator: validateEmail,
                      ),
                  
                      SizedBox(height: MediaQuery.of(context).size.height*appSize.spaceHeightRatio),
                      CustomTextFormField(
                        controller: passwordController,
                        label: TextUtilities.passwordField,
                        hintText: TextUtilities.passwordFieldAsk,
                        validator: validatePassword,
                        obscureText: true,
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*appSize.spaceHeightRatio),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Checkbox(value: false, onChanged: (value) {}),
                          Text(TextUtilities.rememberField),
                          Spacer(),
                          TextButton(
                            onPressed: () {},
                            child: Text(TextUtilities.forgetField,
                              style: TextStyle(
                                  color: AppThemeData.textPrimaryColor,
                                  decoration: TextDecoration.underline
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*appSize.spaceHeightRatio),
                      BlocBuilder<LoginViewModel, LoginScreenState>(
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
                                    login();
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(vertical: 15), backgroundColor: Colors.blue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ), // Button color
                                ),
                                child: Text('Login', style: TextStyle(fontSize: 16)),
                              ),
                            );
                          }
                        },
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*appSize.spaceHeightRatio),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                  
                        children: [
                          Text(TextUtilities.askIfHaveAccount,
                            style: TextStyle(
                                color:AppThemeData.textPrimaryColor
                            ),),
                          Text(
                            TextUtilities.signUpField,
                            style: TextStyle(
                                color:AppThemeData.primaryColor,
                                decoration: TextDecoration.underline
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

  void login() {
    String email = emailController.text;
    String password = passwordController.text;
    viewModel.doIntent(LoginIntent(email, password));
  }
}