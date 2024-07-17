import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduationproject/ui/auth/new_password/new_password_screen.dart';
import 'package:graduationproject/ui/auth/reset_password/Cubit/reset_password_screen_states.dart';
import 'package:graduationproject/ui/auth/reset_password/Cubit/reset_password_screen_view_model.dart';
import 'package:graduationproject/ui/widgets/custom_text_form_filed.dart';

import '../../utils/app_theme.dart';
import '../../utils/dialog_utils.dart';

class ResetPasswordScreen extends StatefulWidget {
  static const String routeName = 'ResetPassword';

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  ResetPasswordScreenViewModel viewModel = ResetPasswordScreenViewModel();
  @override
  Widget build(BuildContext context) {
    return BlocListener<ResetPasswordScreenViewModel,
        ResetPasswordScreenStates>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is ResetPasswordScreenLoadingState) {
          DialogUtils.showLoading(context, state.loadingMessage!);
        } else if (state is ResetPasswordScreenErrorState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(context, state.errorMessage!,
              posActionName: 'Ok', title: 'Something went wrong !');
        } else if (state is ResetPasswordScreenSuccessState) {
          DialogUtils.hideLoading(context);
          Navigator.of(context).pushNamed(NewPassWordScreen.routeName,
              arguments: NewPasswordScreenArgs(
                  codeController: viewModel.codeController,
                  emailController: viewModel.emailController));
        }
      },
      child: Scaffold(
        backgroundColor: MyTheme.whiteColor,
        appBar: AppBar(
          title: Text(
            'Verification',
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                'assets/images/reset.png',
                height: 250,
                width: double.infinity,
              ),
              Text(
                'Enter the code that has been sent to your email',
                style: Theme.of(context).textTheme.titleSmall,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Form(
                  key: viewModel.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      CustomTextFormFiled(
                        hintText: "Enter your code here",
                        controller: viewModel.codeController,
                        keyBordType: TextInputType.phone,
                        myValidator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return "Please enter your code";
                          }
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            print(viewModel.codeController.text);
                            viewModel.checkOTP(context);
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: MyTheme.primaryColor,
                              padding: EdgeInsets.all(15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              )),
                          child: Text(
                            "Verify",
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
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

/// Data class
class ResetPasswordScreenArgs {
  TextEditingController emailController;
  ResetPasswordScreenArgs({required this.emailController});
}
