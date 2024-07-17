import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduationproject/Provider/TokenProvider.dart';
import 'package:graduationproject/ui/auth/login/login_screen.dart';
import 'package:provider/provider.dart';

import '../auth/forget_password/forget_password_screen.dart';
import '../utils/app_theme.dart';
import '../widgets/CustomProfileContainer.dart';
import 'Cubit/ProfileStates.dart';
import 'Cubit/ProfileViewModel.dart';

class ProfileTab extends StatefulWidget {
  static const String routeName = 'ProfileTab';

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    var token = Provider.of<TokenProvider>(context).token;
    ProfileViewModel viewModel = ProfileViewModel(token);

    return Scaffold(
      backgroundColor: MyTheme.whiteColor,
      body: BlocProvider(
        create: (context) => ProfileViewModel(token)..getLoggedUserInfo(),
        child: BlocBuilder<ProfileViewModel, ProfileStates>(
          builder: (context, state) {
            if (state is ProfileLoadingState) {
              return Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ),
              );
            } else if (state is ProfileErrorState) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      state.errorMessage!,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(color: Colors.white),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        viewModel.getLoggedUserInfo();
                      },
                      child: Text('Try Again'),
                    ),
                  ],
                ),
              );
            } else if (state is ProfileSuccessState) {
              return Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.08,
                      ),
                      Text(
                        'Welcome, ${state.userInfo.fullName!.split(' ').first}',
                        style: Theme.of(context).textTheme.titleLarge,
                        textAlign: TextAlign.left,
                      ),
                      CustomProfileContainer(
                        outTitle: 'Your Full Name',
                        inTitle: state.userInfo.fullName!,
                        isVisible: false,
                        edit: () {},
                      ),
                      CustomProfileContainer(
                        outTitle: 'Your E-mail',
                        inTitle: state.userInfo.email!,
                        isVisible: false,
                        edit: () {},
                      ),
                      CustomProfileContainer(
                        outTitle: 'Your Password',
                        inTitle: '*****************',
                        isVisible: true,
                        edit: () {
                          Navigator.of(context)
                              .pushNamed(ForgetPasswordScreen.routeName);
                        },
                      ),
                      CustomProfileContainer(
                        outTitle: 'Your Mobile Number',
                        inTitle: state.userInfo.mobileNumber!,
                        isVisible: false,
                        edit: () {},
                      ),
                      CustomProfileContainer(
                        outTitle: 'Your Governorate',
                        inTitle: state.userInfo.governorate!,
                        isVisible: false,
                        edit: () {},
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacementNamed(LoginScreen.routeName);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: MyTheme.blueColor,
                          padding: EdgeInsets.all(15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Text(
                          "Log out",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                            color: MyTheme.whiteColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
