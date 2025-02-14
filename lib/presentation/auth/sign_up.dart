import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:melody_flow/common/widgets/app_bar.dart';
import 'package:melody_flow/common/widgets/basic_app_button.dart';
import 'package:melody_flow/data/models/auth/create_user_req.dart';
import 'package:melody_flow/domain/usecase/auth/signup.dart';
import 'package:melody_flow/presentation/auth/sign_in.dart';
import 'package:melody_flow/service_locator.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final TextEditingController fullName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: signInText(context),
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
              registerText(),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Sign up to enjoy endless music!",
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
              emailField(context),
              const SizedBox(
                height: 20,
              ),
              passwordField(context),
              const SizedBox(
                height: 50,
              ),
              BasicAppButton(
                  onPressed: () async {
                    var result = await sl<SignupUseCase>().call(
                        params: CreateUserReq(
                      fullName: fullName.text.toString(),
                      email: email.text.toString(),
                      password: password.text.toString(),
                    ));
                    result.fold((l) {
                      var snackbar = SnackBar(
                        content: Text(l),
                        behavior: SnackBarBehavior.floating,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackbar);
                    }, (r) {
                      var snackbar = SnackBar(
                        content: Text(r),
                        behavior: SnackBarBehavior.floating,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackbar);
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (BuildContext context) => SignInPage()), (route) => false
                      );
                    });
                  },
                  title: "Creat Account"),
              const SizedBox(
                height: 60,
              ),
              //sigInText(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget registerText() {
    return const Text(
      "Register",
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
      textAlign: TextAlign.center,
    );
  }

  Widget fullNameField(BuildContext context) {
    return TextField(
      controller: fullName,
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

  Widget signInText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Do you have an account? ',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
          ),
          TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => SignInPage()));
              },
              child: const Text('Sign In'))
        ],
      ),
    );
  }
}
