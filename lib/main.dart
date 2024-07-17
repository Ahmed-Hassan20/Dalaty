import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduationproject/home_screen.dart';
import 'package:graduationproject/ui/auth/forget_password/forget_password_screen.dart';
import 'package:graduationproject/ui/auth/login/login_screen.dart';
import 'package:graduationproject/ui/auth/new_password/new_password_screen.dart';
import 'package:graduationproject/ui/auth/register/register_screen.dart';
import 'package:graduationproject/ui/auth/reset_password/reset_password_screen.dart';
import 'package:graduationproject/ui/home/details_screen.dart';
import 'package:graduationproject/ui/home/home_tab.dart';
import 'package:graduationproject/ui/inbox/CreateCaseScreen.dart';
import 'package:graduationproject/ui/inbox/details_inbox.dart';
import 'package:graduationproject/ui/inbox/inbox_tab.dart';
import 'package:graduationproject/ui/profile/profile_tab.dart';
import 'package:graduationproject/ui/search/details_seach.dart';
import 'package:graduationproject/ui/search/search_by_AI.dart';
import 'package:graduationproject/ui/splash/splash_screen.dart';
import 'package:provider/provider.dart';

import 'Provider/TokenProvider.dart';
import 'ui/utils/app_theme.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => TokenProvider()),
  ],
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: SplashScreen.routeName,
            routes: {
              SplashScreen.routeName: (context) => const SplashScreen(),
              HomeScreen.routeName: (context) => HomeScreen(),
              LoginScreen.routeName: (context) => LoginScreen(),
              RegisterScreen.routeName: (context) => RegisterScreen(),
              ForgetPasswordScreen.routeName: (context) =>
                  ForgetPasswordScreen(),
              ResetPasswordScreen.routeName: (context) => ResetPasswordScreen(),
              NewPassWordScreen.routeName: (context) => NewPassWordScreen(),
              SearchByAI.routeName: (context) => SearchByAI(),
              ProfileTab.routeName : (context) =>ProfileTab(),
              InboxTab.routeName : (context) =>InboxTab(),
              HomeTab.routeName : (context) =>HomeTab(),
              CreateCaseScreen.routeName : (context) =>CreateCaseScreen(),
              DetailsScreen.routeName : (context) => DetailsScreen(),
              DetailsInbox.routeName : (context) => DetailsInbox(),
              DetailsSearch.routeName : (context) => DetailsSearch(),
            },
            theme: MyTheme.appTheme,
          );
        });
  }
}