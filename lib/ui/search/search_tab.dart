import 'package:flutter/material.dart';
import 'package:graduationproject/ui/search/search_by_AI.dart';
import 'package:graduationproject/ui/utils/app_theme.dart';
import 'package:graduationproject/ui/widgets/custom_elevated_button.dart';

class SearchTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.whiteColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height*0.09,
          ),
          Image.asset(
            'assets/images/search_person.png',
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          CustomElevatedButton(title: 'Search by AI', imagePath: 'assets/images/AI.png',routeName: SearchByAI.routeName),
        ],
      ),
    );
  }
}