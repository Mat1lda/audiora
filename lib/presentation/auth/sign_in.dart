import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:melody_flow/common/widgets/app_bar.dart';
import 'package:melody_flow/common/widgets/basic_app_button.dart';
import 'package:melody_flow/data/models/auth/sign_in_user_request.dart';
import 'package:melody_flow/domain/usecase/auth/signin.dart';
import 'package:melody_flow/presentation/auth/sign_up.dart';
import 'package:melody_flow/presentation/home/home_page.dart';
import 'package:melody_flow/service_locator.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  final TextEditingController userName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: signUpText(context),
        appBar: BasicAppbar(
          title: Image.asset(
            "assets/images/logo_with_text.png",
            height: 180,
            width: 180,
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.01,
            horizontal: MediaQuery.of(context).size.width * 0.05,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              signInText(),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Sign in to access your music world!",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              fullNameField(context),
              const SizedBox(
                height: 20,
              ),
              passwordField(context),
              const SizedBox(
                height: 50,
              ),
              BasicAppButton(
                  onPressed: () async {
                    Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(builder: (BuildContext context) =>  HomePage()), (route) => false
                                );

                    // var result = await sl<SigninUseCase>().call(
                    //     params: SignInUserRequest(
                    //   fullName: userName.text.toString(),
                    //   email: email.text.toString(),
                    //   password: password.text.toString(),
                    // ));
                    // result.fold((l) {
                    //   var snackbar = SnackBar(
                    //     content: Text(l),
                    //     behavior: SnackBarBehavior.floating,
                    //   );
                    //   ScaffoldMessenger.of(context).showSnackBar(snackbar);
                    // }, (r) {
                    //   Navigator.pushAndRemoveUntil(
                    //       context,
                    //       MaterialPageRoute(
                    //           builder: (BuildContext context) => HomePage()),
                    //       (route) => false);
                    // });
                  },
                  title: "Sign In"),
            ],
          ),
        ),
      ),
    );
  }

  Widget signInText() {
    return const Text(
      "Sign In",
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
      textAlign: TextAlign.center,
    );
  }

  Widget fullNameField(BuildContext context) {
    return TextField(
      controller: userName,
      decoration: const InputDecoration(hintText: "User name")
          .applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget emailField(BuildContext context) {
    return TextField(
      controller: email,
      decoration: const InputDecoration(hintText: "Email")
          .applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget passwordField(BuildContext context) {
    return TextField(
      controller: password,
      decoration: const InputDecoration(hintText: "Password")
          .applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget signUpText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Already have an account? ',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
          ),
          TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => SignUpPage()));
              },
              child: const Text('Sign Up'))
        ],
      ),
    );
  }
}
