class AuthParams {
  final String name;
  final String email;
  final String phone;
  final String password;

  AuthParams({
    this.name = "",
    this.email = "",
    this.phone = "",
    this.password = "",
  });

  AuthParams copyWith({
    String? name,
    String? email,
    String? phone,
    String? password,
  }) {
    return AuthParams(
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toJsonRegister() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'password': password,
    };
  }

  Map<String, dynamic> toJsonLogin() {
    return {
      'email': email,
      'password': password,
    };
  }

  factory AuthParams.fromJson(Map<String, dynamic> json) {
    return AuthParams(
      name: json['name'] as String? ?? "",
      email: json['email'] as String? ?? "",
      phone: json['phone'] as String? ?? "",
      password: json['password'] as String? ?? "",
    );
  }

  @override
  String toString() =>
      "AuthParams(name: $name,email: $email,phone: $phone,password: $password)";

  @override
  int get hashCode => Object.hash(name, email, phone, password);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthParams &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          email == other.email &&
          phone == other.phone &&
          password == other.password;
}
