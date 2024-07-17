import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduationproject/home_screen.dart';
import 'package:graduationproject/ui/auth/new_password/Cubit/new_password_screen_states.dart';
import 'package:graduationproject/ui/auth/new_password/Cubit/new_password_screen_view_model.dart';

import '../../utils/app_theme.dart';
import '../../utils/dialog_utils.dart';
import '../../widgets/custom_text_form_filed.dart';

class NewPassWordScreen extends StatefulWidget {
  static const String routeName = 'new password page';

  @override
  State<NewPassWordScreen> createState() => _NewPassWordScreenState();
}

class _NewPassWordScreenState extends State<NewPassWordScreen> {
 NewPassWordViewModel viewModel = NewPassWordViewModel();
  @override
  Widget build(BuildContext context) {
    return BlocListener<NewPassWordViewModel,
        NewPasswordScreenStates>(
        bloc: viewModel,
        listener: (context, state) {
      if (state is NewPasswordScreenLoadingState) {
        DialogUtils.showLoading(context, state.loadingMessage!);
      } else if (state is NewPasswordScreenErrorState) {
        DialogUtils.hideLoading(context);
        DialogUtils.showMessage(context, state.errorMessage!,
            posActionName: 'Ok', title: 'Something went wrong !');
        print('${state.errorMessage}');
      } else if (state is NewPasswordScreenSuccessState) {
        DialogUtils.hideLoading(context);
        Navigator.of(context).pushNamed(HomeScreen.routeName);
        DialogUtils.showMessage(context, state.response.message!,
            posActionName: 'Ok', title: 'Success');
      }
    },
    child: Scaffold(
      backgroundColor: MyTheme.whiteColor,
      appBar: AppBar(
        title: Text(
          'New password',
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
            Text(
              'Please enter the new password for your account',
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            Image.asset(
              'assets/images/new.png',
              height: 250,
              width: double.infinity,
            ),
            Form(
                key: viewModel.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
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
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          viewModel.changePassword(context);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: MyTheme.primaryColor,
                            padding: EdgeInsets.all(15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            )),
                        child: Text(
                          "Confirm",
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: MyTheme.whiteColor,
                                  ),
                        ),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    ));
  }
}
/// Data class
class NewPasswordScreenArgs {
  TextEditingController codeController;
  TextEditingController emailController;
  NewPasswordScreenArgs({required this.codeController,required this.emailController});
}