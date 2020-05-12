import 'package:devsteam/models/links_model.dart';
import 'package:devsteam/models/user_model.dart';
import 'package:equatable/equatable.dart';

class Photo extends Equatable {
  final User user;
  final Links urls;

  const Photo({this.user, this.urls});

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        urls: json['urls'] != null ? new Links.fromJson(json['urls']) : null,
        user: json['user'] != null ? new User.fromJson(json['user']) : null,
      );

  Map<String, dynamic> toJson() => {'username': this.user, 'urls': this.urls};

  @override
  List<Object> get props => [user, urls];
}
