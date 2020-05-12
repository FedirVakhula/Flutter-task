import 'package:devsteam/models/photo_model.dart';
import 'package:flutter/material.dart';

class PhotoWidget extends StatefulWidget {
  final Photo photo;

  PhotoWidget({this.photo}) : super(key: Key(photo.user.username));

  @override
  createState() => PhotoWidgetState(this.photo);
}

class PhotoWidgetState extends State<PhotoWidget> {
  Photo photo;

  PhotoWidgetState(this.photo);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: photo,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 23.0,
              spreadRadius: 1.0,
              offset: Offset(
                15.0,
                15.0,
              ),
            )
          ],
        ),
        margin: EdgeInsets.symmetric(vertical: 7, horizontal: 17),
        child: InkWell(
          onTap: () async {
            Navigator.of(context).pushNamed('photo', arguments: photo);
          },
          child: Container(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              color: Colors.lightBlue[50],
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(17),
                    width: 80,
                    height: 80,
                    child: Image.network('${photo.urls.small}'),
                  ),
                  Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Name: ${photo.user.username}',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
