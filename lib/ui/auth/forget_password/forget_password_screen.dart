import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduationproject/ui/auth/forget_password/cubit/forget_password_screen_states.dart';
import 'package:graduationproject/ui/auth/forget_password/cubit/forget_password_screen_view_model.dart';
import 'package:graduationproject/ui/auth/reset_password/reset_password_screen.dart';

import '../../utils/app_theme.dart';
import '../../utils/dialog_utils.dart';
import '../../widgets/custom_text_form_filed.dart';

class ForgetPasswordScreen extends StatefulWidget {
  static const String routeName = 'forget page';

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  ForgetPasswordScreenViewModel viewModel = ForgetPasswordScreenViewModel();
  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgetPasswordScreenViewModel,
            ForgetPasswordScreenStates>(
        bloc: viewModel,
        listener: (context, state) {
          if (state is ForgetPasswordScreenLoadingState) {
            DialogUtils.showLoading(context, state.loadingMessage!);
          } else if (state is ForgetPasswordScreenErrorState) {
            DialogUtils.hideLoading(context);
            DialogUtils.showMessage(context, state.errorMessage!,
                posActionName: 'Ok', title: 'Something went wrong !');
            print('${state.errorMessage}');
          } else if (state is ForgetPasswordScreenSuccessState) {
            DialogUtils.hideLoading(context);
            Navigator.of(context).pushNamed(ResetPasswordScreen.routeName,
                arguments: ResetPasswordScreenArgs(
                    emailController: viewModel.emailController));
            DialogUtils.showMessage(context, state.response.message!,
                posActionName: 'Ok', title: 'Success');

          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Forget password',
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
                Image.asset(
                  'assets/images/forget.png',
                  height: 250,
                  width: double.infinity,
                ),
                Text(
                  'Send the email and a verification code will be sent to your email',
                  style: Theme.of(context).textTheme.titleSmall,
                  textAlign: TextAlign.center,
                ),
                Form(
                  key : viewModel.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      CustomTextFormFiled(
                        hintText: "Enter your Email address",
                        controller: viewModel.emailController,
                        myValidator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return "Please enter your Email Address";
                          }
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            viewModel.sendOTP();
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: MyTheme.primaryColor,
                              padding: EdgeInsets.all(15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              )),
                          child: Text(
                            "Check email",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: MyTheme.whiteColor,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
