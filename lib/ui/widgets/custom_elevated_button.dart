import 'package:flutter/material.dart';

import '../utils/app_theme.dart';

class CustomElevatedButton extends StatelessWidget {
  String title ;
  String imagePath;
  String routeName;
  CustomElevatedButton({required this.title,required this.imagePath,required this.routeName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(

        onPressed: () {
          Navigator.of(context).pushNamed(routeName);
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: MyTheme.primaryColor,
            padding: EdgeInsets.all(15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style:
              Theme.of(context).textTheme.titleMedium!.copyWith(
                color: MyTheme.whiteColor,
              ),
            ),
            Image.asset(imagePath,color: MyTheme.whiteColor,),
          ],
        ),
      ),
    );
  }
}
