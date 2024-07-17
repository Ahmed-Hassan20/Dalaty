import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduationproject/api/api_manager.dart';

import '../reset_password_screen.dart';
import 'reset_password_screen_states.dart';

class ResetPasswordScreenViewModel extends Cubit<ResetPasswordScreenStates> {
  ResetPasswordScreenViewModel() : super(ResetPasswordScreenInitialState());
  var codeController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();


  Future<void> checkOTP(BuildContext context) async {
    try {
      emit(ResetPasswordScreenLoadingState(loadingMessage: 'Loading...'));
      ResetPasswordScreenArgs args =
      ModalRoute.of(context)!.settings.arguments as ResetPasswordScreenArgs;
      var response = await ApiManager.checkOTP(
        args.emailController.text,
        codeController.text,
      );
      emailController = args.emailController;
      print(emailController.text);
      if (response.status != 'fail') {
        emit(ResetPasswordScreenSuccessState(response: response));
      } else {
        emit(ResetPasswordScreenErrorState(
            errorMessage: response.message ?? "Unknown error occurred"));
      }
    } catch (e) {
      emit(ResetPasswordScreenErrorState(errorMessage: e.toString()));
    }
  }

}
