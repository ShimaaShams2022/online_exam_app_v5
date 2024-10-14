import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../di.dart';
import '../utilities/utilitis.dart';
import 'loginviewmodel.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  static const String routeName = "LoginScreen";
  // Field injection
  LoginViewModel viewModel = getIt.get<LoginViewModel>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        hintText: 'Enter your email',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: 'Enter your password',
                        border: OutlineInputBorder(),
                      ),
                      obscureText: true,
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Checkbox(value: false, onChanged: (newValue) {}),
                        Text('Remember me'),
                        Spacer(),
                        TextButton(
                          onPressed: () {
                            // Add forgot password functionality
                          },
                          child: Text('Forgot password?'),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
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
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account? "),
                        GestureDetector(
                          onTap: () {
                            // Add sign-up functionality
                          },
                          child: Text(
                            'Sign up',
                            style: TextStyle(
                                color: Colors.blue, fontWeight: FontWeight.bold),
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