class User {
  final String username;
  User({this.username});

  factory User.fromJson(Map<String, dynamic> json) =>
      User(username: json['username']);
}
