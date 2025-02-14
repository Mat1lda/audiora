class SignInUserRequest{
  final String fullName;
  final String email;
  final String password;

  SignInUserRequest({
    required this.fullName,
    required this.email,
    required this.password
  });
}