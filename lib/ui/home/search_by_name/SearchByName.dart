import 'package:flutter/material.dart';
import 'package:graduationproject/api/api_manager.dart';
import 'package:graduationproject/model/response/Missing.dart';
import 'package:graduationproject/ui/widgets/HomeTabItem.dart';

import '../../utils/app_theme.dart';

class SearchByName extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.search, size: 35, color: Color(0xff113946)),
        onPressed: () => showResults(context),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.close,
        size: 35,
        color: Color(0xff113946),
      ),
      onPressed: () => Navigator.of(context).pop(),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isNotEmpty) {
      return Scaffold(
        backgroundColor: MyTheme.whiteColor,
        body: FutureBuilder<Missing>(
          future: ApiManager.SearchByName(query),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Color(0xff113946),
                ),
              );
            } else if (snapshot.hasError) {
              return Column(
                children: [
                  const Text('Something went wrong'),
                  Container(
                    color: MyTheme.primaryColor,
                    child: Center(
                      child: ElevatedButton(
                          onPressed: () {
                            ApiManager.SearchByName(query);
                          },
                          child: const Text('try again')),
                    ),
                  ),
                ],
              );
            }
            if (snapshot.data?.success == false) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(snapshot.data!.message ?? ''),
                  Container(
                    color: MyTheme.primaryColor,
                    child: Center(
                      child: ElevatedButton(
                        onPressed: () {
                          ApiManager.SearchByName(query);
                        },
                        child: const Text('try again'),
                      ),
                    ),
                  ),
                ],
              );
            }
            var searchList = snapshot.data!.data!.missingPersons??[];
            return ListView.builder(
              itemBuilder: (context, index) {
                return Person(missingPersons: searchList[index], imagePath:  searchList[index].images?[0]);
              },
              itemCount: searchList.length,
            );
          },
        ),
      );
    } else {
      return Container();
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.whiteColor,
    );
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      hintColor:MyTheme.primaryColor ,
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontSize: 22,
        ),),
      inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(borderSide: BorderSide.none)),
      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: MyTheme.whiteColor,
      ),
    );
  }

}
