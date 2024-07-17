import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduationproject/api/api_manager.dart';
import 'package:graduationproject/ui/auth/new_password/new_password_screen.dart';

import 'new_password_screen_states.dart';

class NewPassWordViewModel extends Cubit<NewPasswordScreenStates> {
  NewPassWordViewModel() : super(NewPasswordScreenInitialState());
  var passWordController = TextEditingController();

  var confirmationPasswordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool isPassword = true;

  bool isRePassword = true;

  Future<void> changePassword(BuildContext context) async {
    try {
      emit(NewPasswordScreenLoadingState(loadingMessage: 'Loading...'));
      NewPasswordScreenArgs args =
          ModalRoute.of(context)!.settings.arguments as NewPasswordScreenArgs;
      var response = await ApiManager.changePassword(
          args.emailController.text,
          args.codeController.text,
          passWordController.text,
          confirmationPasswordController.text);
      print(args.emailController.text);
      if (response.status != 'fail') {
        emit(NewPasswordScreenSuccessState(response: response));
        print(response.message);
      } else {
        emit(NewPasswordScreenErrorState(
            errorMessage: response.message ?? "Unknown error occurred"));
        print(response.message);
      }
    } catch (e) {
      emit(NewPasswordScreenErrorState(errorMessage: e.toString()));
      print(e.toString());
    }
  }
}
