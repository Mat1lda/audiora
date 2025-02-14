import 'package:flutter/material.dart';
import 'package:melody_flow/common/helpers/is_dark_mode.dart';
import 'package:melody_flow/common/widgets/app_bar.dart';
import 'package:melody_flow/common/widgets/basic_app_button.dart';
import 'package:melody_flow/presentation/auth/sign_in.dart';
import 'package:melody_flow/presentation/auth/sign_up.dart';

class SignUpOrSignInPage extends StatelessWidget {
  const SignUpOrSignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: [
          const BasicAppbar(),
          Align(
            alignment: Alignment.topRight,
            child: Image.asset('assets/images/decor.png'),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Image.asset('assets/images/decor.png'),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset('assets/images/billie.png'),
          ),
          Align(
              alignment: Alignment.center,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/logo_with_text.png'),
                    Text(
                      'Enjoying music with us',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Audiorra is a proprietary Vietnamese audio streaming and media services provider',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: context.isDarkMode
                              ? Colors.grey
                              : Colors.blueGrey,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                              flex: 1,
                              child: BasicAppButton(
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage(),));
                                  }, title: 'Register')),
                          SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            flex: 1,
                            child: TextButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => SignInPage(),));
                                },
                                child: Text(
                                  'Sign in',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: context.isDarkMode
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: 18),
                                )),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
