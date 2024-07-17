import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduationproject/home_screen.dart';
import 'package:graduationproject/ui/auth/forget_password/forget_password_screen.dart';
import 'package:graduationproject/ui/auth/login/cubit/login_screen_states.dart';
import 'package:graduationproject/ui/auth/login/cubit/login_screen_view_model.dart';
import 'package:graduationproject/ui/auth/register/register_screen.dart';
import 'package:provider/provider.dart';

import '../../../Provider/TokenProvider.dart';
import '../../utils/app_theme.dart';
import '../../utils/dialog_utils.dart';
import '../../widgets/custom_text_form_filed.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'Login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginScreenViewModel viewModel = LoginScreenViewModel();
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginScreenViewModel, LoginScreenStates>(
        bloc: viewModel,
        listener: (context, state) {
      if (state is LoginScreenLoadingState) {
        DialogUtils.showLoading(context, state.loadingMessage!);
      } else if (state is LoginScreenErrorState) {
        DialogUtils.hideLoading(context);
        DialogUtils.showMessage(context, state.errorMessage!,
            posActionName: 'Ok', title: 'Something went wrong !');
        print('${state.errorMessage}');
      } else if (state is LoginScreenSuccessState) {
        Provider.of<TokenProvider>(context, listen: false).setToken(state.response.token);
        DialogUtils.hideLoading(context);
        Navigator.of(context).pushNamed(HomeScreen.routeName);
      }
    },
    child:  Scaffold(
      backgroundColor: MyTheme.whiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height*0.04,
            ),
            Image.asset(
              'assets/images/worried.png',
              height: MediaQuery.of(context).size.height*0.4,
              width: double.infinity,
            ),
            Text(
              'Please enter your Email',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Form(
                key: viewModel.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        'Email',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
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
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        'Password',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    CustomTextFormFiled(
                      hintText: "Enter your Password",
                      controller: viewModel.passWordController,
                      isVisible: viewModel.isPassword,
                      icon: IconButton(
                        onPressed: () {
                          viewModel.isPassword = !viewModel.isPassword;
                          setState(() {});
                        },
                        icon: Icon(
                          viewModel.isPassword ? Icons.visibility_off : Icons.visibility,
                          color: MyTheme.whiteColor,
                        ),
                      ),
                      myValidator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return "Please enter your Password";
                        }
                        bool isValidPassword = RegExp(
                                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                            .hasMatch(text);
                        if (!isValidPassword) {
                          return "Wrong Password !";
                        }
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(ForgetPasswordScreen.routeName);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Text(
                              'Forget Password',
                              style: Theme.of(context).textTheme.titleMedium,
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          viewModel.login();
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: MyTheme.primaryColor,
                            padding: EdgeInsets.all(15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            )),
                        child: Text(
                          "Log in",
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: MyTheme.whiteColor,
                                  ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don’t have an account?',
                          style: Theme.of(context).textTheme.titleMedium,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width*0.01
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(RegisterScreen.routeName);
                          },
                          child: Text(
                            'Sign Up',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(decoration: TextDecoration.underline),
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
    ));
  }
}
