import 'package:flutter/material.dart';
import 'package:graduationproject/model/response/LoggedUserPosts.dart';
import 'package:graduationproject/ui/inbox/details_inbox.dart';
import 'package:graduationproject/ui/utils/app_theme.dart';

class UserPost extends StatelessWidget {
  LoggedUserPost post;
  String imagePath;
  UserPost({
    required this.post,
    required this.imagePath,
  });
  @override
  Widget build(BuildContext context) {
    final nameParts = (post.name ?? '').split(' ');
    final displayName = nameParts.length > 1
        ? '${nameParts[0]} ${nameParts[1]}'
        : post.name ?? '';
    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(DetailsInbox.routeName,
            arguments: post);
      },
      child: Card(
        margin:EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
        color: MyTheme.primaryColor,
        child: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.27, // Set the desired width
              height: MediaQuery.of(context).size.height * 0.2, // Set the desired height
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey[300], // Placeholder background color
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  'https://res.cloudinary.com/dvwzzqmpm/image/upload/v1714499957/missingPeople/${imagePath}.jpg',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(Icons.error);
                  },
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    displayName,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: MyTheme.whiteColor,
                        fontStyle: FontStyle.italic),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.025,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: MyTheme.blueColor),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                          child: Text(
                            '${post.age} y',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(color: MyTheme.whiteColor),
                          ),
                        ),
                      ),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: MyTheme.blueColor),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                            child: Text(
                              post.gender ?? '',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(color: MyTheme.whiteColor),
                            ),
                          )),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: MyTheme.blueColor),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                            child: Text(
                              ' ${post.city}' ?? '',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(color: MyTheme.whiteColor),
                            ),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Text(
                    'Tap to know more',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(color: MyTheme.whiteColor,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}