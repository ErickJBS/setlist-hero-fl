class User {
  final String id;
  final String displayName;
  final String username;
  final String email;
  final String authProvider;

  User({this.id, this.username, this.displayName, this.email, this.authProvider});

  User.fromMap(Map<String, dynamic> data) :
    id = data['id'],
    displayName = data['displayName'],
    username = data['username'],
    email = data['email'],
    authProvider = data['authProvider'];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'displayName': displayName,
      'username': username,
      'email': email,
      'authProvider': authProvider
    };
  }

  static String get modelName {
    return 'user';
  }
}
