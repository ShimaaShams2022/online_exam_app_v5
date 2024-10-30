import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app_v5/data/api/model/request/profile_request.dart';
import 'package:online_exam_app_v5/presentation/profile_default_Screen/user_profile/user_profile_view_model.dart';

import '../../../di.dart';
import '../../../domain/models/user.dart';
import '../../app_theme/app_theme_data.dart';

import '../../utilities/size_utilities.dart';
import '../../utilities/text_utilities.dart';
import '../../utilities/user_with_token.dart';
import '../../utilities/utilitis.dart';
import '../../utilities/validation.dart';
import '../../widgets/custom_text_form_field.dart';
import '../../widgets/error_dialog.dart';
import '../../widgets/fixed_password_field.dart';
import '../../widgets/show_loading.dart';
import '../profile_default_screen.dart';

class UserProfileScreen extends StatelessWidget {
  UserProfileScreen({super.key});
  static const String routeName = "UserProfileScreen";

  // Field injection
  UserProfileViewModel userProfileViewModel = getIt.get<UserProfileViewModel>();
  final _formKey = GlobalKey<FormState>();

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();


  bool isButtonEnabled = false;

  void validateInputs() {
    isButtonEnabled = _formKey.currentState?.validate() ?? false;
  }

  @override
  Widget build(BuildContext context) {
    var userWithToken = ModalRoute.of(context)?.settings.arguments as UserWithToken;
    String? token=userWithToken.token??"";
    User? user=userWithToken.user;

   userNameController.text = user?.username??"";
    firstNameController.text = user?.firstName??"";
   lastNameController.text = user?.lastName??"";
    emailController.text= user?.email??"";
    phoneNumberController.text= user?.phone??"";

    print("$user");
    print("$token");

    return BlocProvider(
      create: (context) => userProfileViewModel,
      child: Scaffold(
        appBar: AppBar(
          title: Text(TextUtilities.profile),
        ),
        body: BlocListener<UserProfileViewModel, UserProfileScreenState>(
          listenWhen: (previous, current) {
            if (current is UserProfileLoadingState ||
                current is UserProfileErrorState ||
                current is UserProfileSuccessState) {
              return true;
            }
            return false;
          },
          listener: (context, state) {
            if (state is UserProfileLoadingState) {
              showLoadingDialog(context);
            } else if (state is UserProfileErrorState) {
              var message = extractErrorMessage(state.exception);
              Navigator.of(context).pop(); // Close loading dialog
              showErrorDialog(context, message);
            } else if (state is UserProfileSuccessState) {
              Navigator.of(context).pop();
            }
          },
          child: Container(
            padding: EdgeInsets.all(appSize.spacePadding),
            child: Form(
              key: _formKey,
              onChanged: validateInputs,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          width: 150,
                            height: 150,
                            child: Image.asset("assets/images/Photo.png",fit: BoxFit.cover,)),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppThemeData.cameraBox,
                          ),
                          width: 34,
                          height: 34,
                            child: Icon(Icons.camera_alt_outlined,color: Colors.white,))
                      ],
                    ),
                    SizedBox(height: 20,),
                    CustomTextFormField(
                      controller: userNameController,
                      label: TextUtilities.userNameField,
                      hintText: user?.username ??TextUtilities.askUserNameField,
                      validator: validateFullName,
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height *
                            appSize.spaceHeightRatio),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextFormField(
                            controller: firstNameController,
                            label: TextUtilities.firstNameField,
                            hintText: user?.firstName ??TextUtilities.askFirstNameField,
                            validator: validateName,
                          ),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width *
                                appSize.spaceWidthRatio),
                        Expanded(
                          child: CustomTextFormField(
                            controller: lastNameController,
                            label: TextUtilities.lastNameField,
                            hintText: user?.lastName ??TextUtilities.askLastNameField,
                            validator: validateName,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height *
                            appSize.spaceHeightRatio),
                    CustomTextFormField(
                      controller: emailController,
                      label: TextUtilities.emailField,
                      hintText: user?.email ??TextUtilities.emailFieldAsk,
                      validator: validateEmail,
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height *
                            appSize.spaceHeightRatio),
                    Row(
                      children: [
                        Expanded(
                          child: FixedPasswordField(label:TextUtilities.passwordField,token:token ,)
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width *
                                appSize.spaceWidthRatio),
                      ],
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height *
                            appSize.spaceHeightRatio),
                    CustomTextFormField(
                      controller: phoneNumberController,
                      label: TextUtilities.phoneNumberField,
                      hintText: user?.phone ?? TextUtilities.askPhoneNumberField,
                      validator: validatePhone,
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height *
                            appSize.spaceHeightRatio),
                    SizedBox(
                        height: MediaQuery.of(context).size.height *
                            appSize.spaceHeightRatio),
                    BlocBuilder<UserProfileViewModel, UserProfileScreenState>(
                      builder: (context, state) {
                        if (state is UserProfileLoadingState) {
                          return Center(child: CircularProgressIndicator());
                        } else {
                          return SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                if (isButtonEnabled == true) {
                                  editProfile(token);
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
                                "Update",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppThemeData.textSecondaryColor,
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

  void editProfile(String token) {
    String userName = userNameController.text;
    String firstName = firstNameController.text;
    String lastName = lastNameController.text;
    String email = emailController.text;
    String phone = phoneNumberController.text;

    ProfileRequest editedProfile = ProfileRequest(
      username: userName,
      firstName: firstName,
      lastName: lastName,
      email: email,
      phone: phone,
    );

    userProfileViewModel
        .doIntent(UserProfileIntent(userProfile: editedProfile, token: token));
  }
}
