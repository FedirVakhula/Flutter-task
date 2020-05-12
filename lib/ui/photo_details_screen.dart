import 'package:devsteam/models/photo_model.dart';
import 'package:flutter/material.dart';

class PhotoDetailsScreen extends StatelessWidget {
  final Photo user;

  PhotoDetailsScreen(this.user);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () async {
          Navigator.of(context).pop();
        },
        child: Container(
          child: Image.network(user.urls.small),
        ),
      ),
    );
  }
}
