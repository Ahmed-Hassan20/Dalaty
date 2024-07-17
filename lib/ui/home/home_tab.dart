import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduationproject/ui/home/search_by_name/SearchByName.dart';
import 'package:graduationproject/ui/utils/app_theme.dart';
import 'package:graduationproject/ui/widgets/HomeTabItem.dart';
import 'package:provider/provider.dart';

import '../../Provider/TokenProvider.dart';
import 'cubit/HomeStates.dart';
import 'cubit/HomeViewModel.dart';

class HomeTab extends StatefulWidget {
  static const String routeName = 'HomeTab';

  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  HomeViewModel viewModel = HomeViewModel();
  late Future<void> _initialization;

  @override
  void initState() {
    super.initState();
    _initialization = _initializeViewModel();
  }

  Future<void> _initializeViewModel() async {
    var token = Provider.of<TokenProvider>(context, listen: false).token;
    await viewModel.getToken(token);
    viewModel.getAllMissing();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Error: ${snapshot.error}',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(color: Colors.white),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _initialization = _initializeViewModel();
                    });
                  },
                  child: const Text('Try Again'),
                ),
              ],
            ),
          );
        } else {
          return BlocBuilder<HomeViewModel, HomeStates>(
            bloc: viewModel,
            builder: (context, state) {
              if (state is HomeLoadingState) {
                return Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                  ),
                );
              } else if (state is HomeErrorState) {
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
                          viewModel.getAllMissing();
                        },
                        child: const Text('Try Again'),
                      ),
                    ],
                  ),
                );
              } else if (state is HomeSuccessState) {
                return Scaffold(
                  appBar: PreferredSize(
                    preferredSize: const Size.fromHeight(32.0),
                    child: AppBar(
                      centerTitle: false,
                      title: Text(
                        'Dalaty',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      automaticallyImplyLeading: false,
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                    ),
                  ),
                  backgroundColor: MyTheme.whiteColor,
                  body: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () => showSearch(
                                context: context,
                                delegate: SearchByName(),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: MyTheme.primaryColor,
                                side: const BorderSide(color: Colors.white),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              child: const Row(
                                children: [
                                  Icon(
                                    Icons.search,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    'Search',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Image.asset('assets/images/noto_man-detective.png'),
                        ],
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return Person(
                              missingPersons: state.allMissingList[index],
                              imagePath: state.allMissingList[index].images![0],
                            );
                          },
                          itemCount: state.allMissingList.length,
                        ),
                      ),
                    ],
                  ),
                );
              }
              return Container();
            },
          );
        }
      },
    );
  }
}