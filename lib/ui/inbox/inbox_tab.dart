import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../Provider/TokenProvider.dart';
import '../utils/app_theme.dart';
import '../widgets/InboxItem.dart';
import '../widgets/custom_elevated_button.dart';
import 'CreateCaseScreen.dart';
import 'loged_user_post_cubit/LoggedUserPostsStates.dart';
import 'loged_user_post_cubit/LoggedUserPostsViewModel.dart';

class InboxTab extends StatefulWidget {
  static const String routeName = 'inbox';

  @override
  State<InboxTab> createState() => _InboxTabState();
}

class _InboxTabState extends State<InboxTab> {
  @override
  Widget build(BuildContext context) {
    var token = Provider.of<TokenProvider>(context).token;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your cases',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: MyTheme.whiteColor,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            color: MyTheme.blueColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Create Case',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: MyTheme.whiteColor)),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.01,
                ),
                Text(
                    'If you have lost a loved one, create a case to help spread the word and seek assistance in locating them.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(color: MyTheme.whiteColor)),
                CustomElevatedButton(
                    title: 'Create case',
                    imagePath: 'assets/images/man_icon.png',
                    routeName: CreateCaseScreen.routeName)
              ],
            ),
          ),
          BlocProvider(
            create: (context) =>
            LoggedUserPostsViewModel(token)..getLoggedUserPosts(),
            child: BlocBuilder<LoggedUserPostsViewModel, LoggedUserPostsStates>(
                builder: (context, state) {
                  if (state is LoggedUserPostsLoadingState) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Theme.of(context).primaryColor,
                      ),
                    );
                  } else if (state is LoggedUserPostsErrorState) {
                    print('Error!!!!!!!!!!!!!!!!!');
                    print(state.errorMessage);
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
                                context
                                    .read<LoggedUserPostsViewModel>()
                                    .getLoggedUserPosts();
                              },
                              child: Text('Try Again'))
                        ],
                      ),
                    );
                  } else if (state is LoggedUserPostsSuccessState) {
                    return Expanded(
                      child: Container(
                        color: MyTheme.whiteColor,
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return UserPost(post: state.LoggedUserPosts![index], imagePath:  state.LoggedUserPosts![index].images![0])   ;                     },
                          itemCount: state.LoggedUserPosts?.length,
                        ),
                      ),
                    );
                  }
                  return Container();
                }),
          )
        ],
      ),
    );
  }
}
