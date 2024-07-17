import 'package:flutter/material.dart';

class SearchAIText extends StatelessWidget {
  String title;
  String imagePath;
  SearchAIText({required this.title,required this.imagePath});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Image.asset(imagePath),
          SizedBox(
            width: MediaQuery.of(context).size.width*0.02,
          ),
          Text(title,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ],
      ),
    );
  }
}
