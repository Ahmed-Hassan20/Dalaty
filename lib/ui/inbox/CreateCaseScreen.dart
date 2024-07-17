import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduationproject/home_screen.dart';
import 'package:graduationproject/ui/inbox/CreateCaseCubit/CreateCaseStates.dart';
import 'package:graduationproject/ui/inbox/CreateCaseCubit/CreateCaseViewModel.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../Provider/TokenProvider.dart';
import '../utils/app_theme.dart';
import '../utils/dialog_utils.dart';
import '../widgets/custom_text_form_filed.dart';

class CreateCaseScreen extends StatefulWidget {
  static const String routeName = 'create';
  File? pickedImage;
  @override
  State<CreateCaseScreen> createState() => _CreateCaseScreenState();
}

class _CreateCaseScreenState extends State<CreateCaseScreen> {
  File? pickedImage;
  CreateCaseViewModel viewModel = CreateCaseViewModel();

  Future getImage()async{
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(image == null) return;

    final imageTemp = File(image.path);
    setState(() {
      this.pickedImage = imageTemp;
      print('image added successfully');
      viewModel.pickImageFromGallery();
      Navigator.of(context).pop();
    });
  }

  Future getImageCamera()async{
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if(image == null) return;

    final imageTemp = File(image.path);
    setState(() {
      this.pickedImage = imageTemp;
      print('image added successfully');
      viewModel.pickImageFromCamera();
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    var token = Provider.of<TokenProvider>(context).token;
    viewModel.getToken(token);
    return BlocListener<CreateCaseViewModel, CreateCaseStates>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is CreateCaseLoadingState) {
          print('Loading!!!!!!!!!!');

          DialogUtils.showLoading(context, 'loading');
        } else if (state is CreateCaseErrorState) {
          print('CreateCaseErrorState');
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(context, state.errorMessage!,
              posActionName: 'Ok', title: 'Something went wrong !');
          print('${state.errorMessage}');
        } else if (state is CreateCaseSuccessState) {
          DialogUtils.hideLoading(context);
          Navigator.of(context).pushNamed(HomeScreen.routeName);
          DialogUtils.showMessage(context, 'Case created successfully',
              posActionName: 'Ok', title: 'Done!');
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Create Case',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,

        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Form(
                        key: viewModel.formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.03,
                            ),
                            CustomTextFormFiled(
                              hintText: "Full Name",
                              controller: viewModel.fullNameController,
                              myValidator: (text) {
                                if (text == null || text.trim().isEmpty) {
                                  return "Please enter your full name";
                                }
                                return null;
                              },
                            ),
                            CustomTextFormFiled(
                              hintText: "Age",
                              controller: viewModel.ageController,
                              myValidator: (text) {
                                if (text == null || text.trim().isEmpty) {
                                  return "Please enter age";
                                }
                                return null;
                              },
                            ),
                            CustomTextFormFiled(
                              hintText: "Phone Number",
                              controller: viewModel.mobileNumberController,
                              myValidator: (text) {
                                if (text == null || text.trim().isEmpty) {
                                  return "Please enter your phone number";
                                }
                                if (text.length > 11) {
                                  return "Please enter correct phone number";
                                }
                                return null;
                              },
                            ),
                            CustomTextFormFiled(
                              hintText: "Description",
                              controller: viewModel.descriptionController,
                              myValidator: (text) {
                                if (text == null || text.trim().isEmpty) {
                                  return "Please enter Description";
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.09,
                              child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      viewModel.showCalendar(context);
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(8),
                                          color: MyTheme.primaryColor),
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 13,left: 10),
                                        child: Text(
                                          '${viewModel.selectedDate?.day}/${viewModel.selectedDate?.month}/${viewModel.selectedDate?.year}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium!
                                              .copyWith(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Container(
                                padding: EdgeInsets.only(left: 8, right: 8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: MyTheme.primaryColor,
                                ),
                                child: DropdownButton(
                                  icon: Icon(Icons.arrow_drop_down),
                                  isExpanded: true,
                                  hint: Text(
                                    'Select your City',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                      color: MyTheme.whiteColor,
                                    ),
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                  iconSize: 42,
                                  iconEnabledColor: MyTheme.whiteColor,
                                  underline: SizedBox(),
                                  dropdownColor: MyTheme.primaryColor,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(color: MyTheme.whiteColor),
                                  items: viewModel.cityList
                                      .map((e) => DropdownMenuItem(
                                    child: Text('$e'),
                                    value: e,
                                  ))
                                      .toList(),
                                  onChanged: (val) {
                                    viewModel.selectedCity = val;
                                    setState(() {});
                                  },
                                  value: viewModel.selectedCity,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Container(
                                padding: EdgeInsets.only(left: 8, right: 8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: MyTheme.primaryColor,
                                ),
                                child: DropdownButton(
                                  icon: Icon(Icons.arrow_drop_down),
                                  isExpanded: true,
                                  hint: Text(
                                    'Select Location of Loss',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                      color: MyTheme.whiteColor,
                                    ),
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                  iconSize: 42,
                                  iconEnabledColor: MyTheme.whiteColor,
                                  underline: SizedBox(),
                                  dropdownColor: MyTheme.primaryColor,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(color: MyTheme.whiteColor),
                                  items: viewModel.cityList
                                      .map((e) => DropdownMenuItem(
                                    child: Text('$e'),
                                    value: e,
                                  ))
                                      .toList(),
                                  onChanged: (val) {
                                    viewModel.selectedlocationOfLoss = val;
                                    setState(() {});
                                  },
                                  value: viewModel.selectedlocationOfLoss,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Container(
                                padding: EdgeInsets.only(left: 8, right: 8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: MyTheme.primaryColor,
                                ),
                                child: DropdownButton(
                                  icon: Icon(Icons.arrow_drop_down),
                                  isExpanded: true,
                                  hint: Text(
                                    'Select your Gender',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                      color: MyTheme.whiteColor,
                                    ),
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                  iconSize: 42,
                                  iconEnabledColor: MyTheme.whiteColor,
                                  underline: SizedBox(),
                                  dropdownColor: MyTheme.primaryColor,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(color: MyTheme.whiteColor),
                                  items: viewModel.genderList
                                      .map((e) => DropdownMenuItem(
                                    child: Text('$e'),
                                    value: e,
                                  ))
                                      .toList(),
                                  onChanged: (val) {
                                    viewModel.selectedGender = val;
                                    setState(() {});
                                  },
                                  value: viewModel.selectedGender,
                                ),
                              ),
                            ),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: ElevatedButton(
                                  onPressed: () {
                                    dialog(context);
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: MyTheme.primaryColor,
                                      padding: EdgeInsets.all(12),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      )),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Take a photo',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(
                                          color: MyTheme.whiteColor,
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                        MediaQuery.of(context).size.width *
                                            0.01,
                                      ),
                                      Image.asset('assets/images/camera.png'),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  viewModel.CreateCase();
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: MyTheme.primaryColor,
                                    padding: EdgeInsets.all(12),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    )),
                                child: Text(
                                  "Create",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                    color: MyTheme.whiteColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  dialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: MyTheme.primaryColor,
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () async {
                    viewModel.getImageCamera();
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.camera_alt_outlined,
                    size: 40,
                    color: MyTheme.whiteColor,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.001,
                ),
                Text(
                  'Camera',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: MyTheme.whiteColor,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () async {
                    viewModel.getImage();
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.image_outlined,
                    size: 40,
                    color: MyTheme.whiteColor,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.001,
                ),
                Text(
                  'Gallery',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: MyTheme.whiteColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}