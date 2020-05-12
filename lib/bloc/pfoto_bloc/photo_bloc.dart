import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:devsteam/models/photo_model.dart';
import 'package:devsteam/repositories/photo_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'photo_event.dart';
part 'photo_state.dart';

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  dynamic photos;
  int counter = 0;
  PhotoRepository photoRepository = PhotoRepository();

  @override
  PhotoState get initialState => PhotoInitialState();

  @override
  Stream<PhotoState> mapEventToState(
    PhotoEvent event,
  ) async* {
    if (event is PhotoFetchingEvent) {
      yield await _handleTeamState(state);
    }
  }

  Future<PhotoState> _handleTeamState(PhotoState state) async {
    try {
      photos = await photoRepository.fetchUsers();
      List<Photo> photoList = [];
      if (photos.data != null) {
        photos.data.forEach((v) {
          photoList.add(Photo.fromJson(v));
        });
      }

      return PhotoLoadState(photoList: photoList);
    } catch (e) {
      if (counter < 3) {
        counter++;
        Future.delayed(const Duration(seconds: 3), () {
          return _handleTeamState(state);
        });
      }
      return PhotoInitialState();
    }
  }
}
