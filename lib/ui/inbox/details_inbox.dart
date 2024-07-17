import 'package:flutter/material.dart';

import '../../model/response/LoggedUserPosts.dart';
import '../utils/app_theme.dart';

class DetailsInbox extends StatelessWidget {
  static const String routeName = 'DetailsInbox';

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as LoggedUserPost;

    return Scaffold(
      backgroundColor: MyTheme.whiteColor,
      appBar: AppBar(
        title: Text(
          'Details',
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
        padding: EdgeInsets.only(left: 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  'https://res.cloudinary.com/dvwzzqmpm/image/upload/v1714499957/missingPeople/${args.images?[0]}.jpg',
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width * 0.8,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(
                      Icons.error,
                      size: 100,
                      color: Colors.red,
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
            Text(
              args.name!,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: 28
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildInfoChip(context, '${args.age} y', Icons.cake),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.01,),
                  _buildInfoChip(context, args.gender ?? '', Icons.person),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.01,),
                  _buildInfoChip(context, args.city ?? '', Icons.location_city),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
            _buildSectionTitle(context, 'Description'),
            _buildInfoCard(context, args.description ?? ''),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
            _buildSectionTitle(context, 'Location of loss'),
            _buildInfoCard(context, args.locationOfLoss ?? 'not detected'),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
            _buildSectionTitle(context, 'Contact'),
            _buildInfoCard(context, args.mobileNumber ?? "No mobile number available"),
            SizedBox(height: MediaQuery.of(context).size.height*0.02),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoChip(BuildContext context, String label, IconData icon) {
    return Chip(
      avatar: Icon(icon, color: MyTheme.whiteColor),
      label: Text(
        label,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(color: MyTheme.whiteColor),
      ),
      backgroundColor: MyTheme.primaryColor,
      padding: EdgeInsets.all(7.0),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleMedium!.copyWith(
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildInfoCard(BuildContext context, String info) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: MyTheme.primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Text(
          info,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(color: MyTheme.whiteColor),
        ),
      ),
    );
  }
}
