import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduationproject/ui/auth/login/login_screen.dart';
import 'package:graduationproject/ui/auth/register/cubit/register_screen_states.dart';
import 'package:graduationproject/ui/auth/register/cubit/register_screen_view_model.dart';
import 'package:graduationproject/ui/utils/app_theme.dart';
import 'package:graduationproject/ui/utils/dialog_utils.dart';

import '../../widgets/custom_text_form_filed.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = 'register';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  RegisterScreenViewModel viewModel = RegisterScreenViewModel();
  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterScreenViewModel, RegisterScreenStates>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is RegisterScreenLoadingState) {
          DialogUtils.showLoading(context, state.loadingMessage!);
        } else if (state is RegisterScreenErrorState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(context, state.errorMessage!,
              posActionName: 'Ok', title: 'Something went wrong !');
          print('${state.errorMessage}');
        } else if (state is RegisterScreenSuccessState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(context, state.response.message!,
              posActionName: 'Ok', title: 'Welcome');
        }
      },
      child: Scaffold(
        backgroundColor: MyTheme.whiteColor,
        appBar: AppBar(
          title: Text(
            'Create Account',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                  key: viewModel.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.001,
                      ),
                      CustomTextFormFiled(
                        hintText: "Full Name",
                        controller: viewModel.fullNameController,
                        myValidator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return "Please enter your full name";
                          }
                          return null;
                        },
                      ),
                      CustomTextFormFiled(
                        hintText: "Phone Number",
                        controller: viewModel.phoneController,
                        myValidator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return "Please enter your phone number";
                          }
                          if (text.length > 11) {
                            return "Please enter correct phone number";
                          }
                          return null;
                        },
                      ),
                      CustomTextFormFiled(
                        hintText: "Enter your Email address",
                        controller: viewModel.emailController,
                        myValidator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return "Please enter your Email Address";
                          }
                          bool emailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(text);
                          if (!emailValid) {
                            return "Please enter valid email";
                          }
                          return null;
                        },
                      ),
                      CustomTextFormFiled(
                        hintText: "Enter your password",
                        controller: viewModel.passWordController,
                        isVisible: viewModel.isPassword,
                        icon: IconButton(
                          onPressed: () {
                            viewModel.isPassword = !viewModel.isPassword;
                            setState(() {});
                          },
                          icon: Icon(
                            viewModel.isPassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: MyTheme.whiteColor,
                          ),
                        ),
                        myValidator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return "Please enter your password";
                          }
                          bool isValidPassword = RegExp(
                                  r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                              .hasMatch(text);
                          if (!isValidPassword) {
                            return "Your password should contain \n"
                                "At least one uppercase letter (A-Z) \n"
                                "At least one lowercase letter (a-z) \n"
                                "At least one digit (0-9) \n"
                                "At least one special character from the set {!@#&~} \n"
                                "Minimum length of 8 characters";
                          }
                          return null;
                        },
                      ),
                      CustomTextFormFiled(
                        hintText: "Re-Enter your password",
                        controller: viewModel.confirmationPasswordController,
                        isVisible: viewModel.isRePassword,
                        icon: IconButton(
                          onPressed: () {
                            viewModel.isRePassword = !viewModel.isRePassword;
                            setState(() {});
                          },
                          icon: Icon(
                            viewModel.isRePassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: MyTheme.whiteColor,
                          ),
                        ),
                        myValidator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return "Please enter your Password";
                          }
                          if (text != viewModel.passWordController.text) {
                            return "Your password doesn't match";
                          }
                          return null;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Container(
                          padding: EdgeInsets.only(left: 8, right: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: MyTheme.primaryColor,
                          ),
                          child: DropdownButton(
                            icon: Icon(Icons.arrow_drop_down),
                            isExpanded: true,
                            hint: Text(
                              'Select your Governorat',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    color: MyTheme.whiteColor,
                                  ),
                            ),
                            borderRadius: BorderRadius.circular(20),
                            iconSize: 42,
                            iconEnabledColor: MyTheme.whiteColor,
                            underline: SizedBox(),
                            dropdownColor: MyTheme.primaryColor,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(color: MyTheme.whiteColor),
                            items: viewModel.governorateList
                                .map((e) => DropdownMenuItem(
                                      child: Text('$e'),
                                      value: e,
                                    ))
                                .toList(),
                            onChanged: (val) {
                              viewModel.selectedGovernorate = val;
                              setState(() {});
                            },
                            value: viewModel.selectedGovernorate,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            viewModel.register();
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: MyTheme.primaryColor,
                              padding: EdgeInsets.all(14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                          child: Text(
                            "Sing Up",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: MyTheme.whiteColor,
                                ),
                          ),
                        ),
                      ),
                      Text(
                        'By clicking  Sign Up , you agree  the terms and conditions',
                        style: Theme.of(context).textTheme.titleSmall,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have account?',
                            style: Theme.of(context).textTheme.titleMedium,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.01,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed(LoginScreen.routeName);
                            },
                            child: Text(
                              'Sign In',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      decoration: TextDecoration.underline),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
