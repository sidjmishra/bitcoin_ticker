class Secret {
  final String? API_KEY;
  Secret({this.API_KEY = ""});
  factory Secret.fromJson(Map<String, dynamic> jsonMap) {
    return new Secret(API_KEY: jsonMap["API_KEY"]);
  }
}
