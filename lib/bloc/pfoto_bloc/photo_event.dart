part of 'photo_bloc.dart';

@immutable
abstract class PhotoEvent extends Equatable {}

class PhotoFetchingEvent extends PhotoEvent {
  @override
  List<Object> get props => [];
}
