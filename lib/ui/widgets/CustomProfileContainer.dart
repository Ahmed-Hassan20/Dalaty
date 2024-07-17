import 'package:flutter/material.dart';
import 'package:graduationproject/ui/utils/app_theme.dart';

class CustomProfileContainer extends StatelessWidget {
  String outTitle;
  String inTitle;
   Function edit;
   bool isVisible=true;

  CustomProfileContainer({required this.outTitle, required this.inTitle,required this.edit,required this.isVisible});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            outTitle,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.07,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: MyTheme.primaryColor),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(inTitle,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: MyTheme.whiteColor)),
                  Spacer(),
                  Visibility(visible: isVisible,
                    child: IconButton(
                        onPressed: () {
                          edit();


                        },

                        icon: Icon(Icons.edit,
                            size: 20, color: MyTheme.whiteColor)),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
