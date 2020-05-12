class Links {
  final String small;
  Links({this.small});
  factory Links.fromJson(Map<String, dynamic> json) =>
      Links(small: json['small']);
}
