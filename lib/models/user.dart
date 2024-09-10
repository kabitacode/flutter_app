class User {
  final String access_token;
  final String refresh_token;

  User({required this.access_token, required this.refresh_token});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        access_token: json['access_token'],
        refresh_token: json['refresh_token']);
  }
}
