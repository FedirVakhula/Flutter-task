part of 'photo_bloc.dart';

@immutable
abstract class PhotoState extends Equatable {
  final List<Photo> photoList;
  final bool photoError;
  PhotoState({this.photoList = const [], this.photoError = false});
  @override
  List<Object> get props => [photoList];
}

class PhotoInitialState extends PhotoState {
  final List<Photo> photoList;
  PhotoInitialState({this.photoList = const []}) : super(photoList: photoList);
}

class PhotoLoadState extends PhotoState {
  PhotoLoadState({List<Photo> photoList}) : super(photoList: photoList);
}
