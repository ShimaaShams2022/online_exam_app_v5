import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app_v5/presentation/profile/profile_screen.dart';
import 'package:online_exam_app_v5/presentation/register/register_screen.dart';
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
            return current is LoadingState || current is ErrorState || current is SuccessState ;
          },
          listener: (context, state) {

            if (state is LoadingState) {
              showDialog(context: context,
                  barrierDismissible: false,
                  builder: (context) {
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
              Navigator.of(context).popUntil((route)=>route.isFirst); // Close dialogs before showing success
              Navigator.pushNamed(context, ProfileScreen.routeName);

            }
          },
          child: Container(
           padding: EdgeInsets.all(16.0),
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
                              style:ElevatedButton.styleFrom(
                                  minimumSize: Size(double.infinity,MediaQuery.of(context).size.height*appSize.bottomWidthRatio),
                                  backgroundColor:isButtonEnabled? (AppThemeData.primaryColor ): (AppThemeData.secondaryColor)
                              ),
                              child: Text(TextUtilities.loginButton,
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
                            Navigator.pushNamed(context,RegisterScreen.routeName);
                          },
                          child: const Text(
                            TextUtilities.signUpButton,
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
    );
  }

  void login() {
    String email = emailController.text;
    String password = passwordController.text;
    viewModel.doIntent(LoginIntent(email, password));
  }
}