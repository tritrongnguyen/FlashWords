enum Type {
  emailAndPassword,
  facebook,
  google,
  apple,
}

class UserModel {
  final String id;
  final String userName;
  final String email;
  final Type type;

  const UserModel({
    required this.id,
    required this.email,
    required this.userName,
    required this.type,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['userName'] = userName;
    data['email'] = email;
    data['type'] = type;

    return data;
  }

  // User.fromJson(Map<String,dynamic> json){

  // }
}
