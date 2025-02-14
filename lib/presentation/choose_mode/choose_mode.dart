import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:melody_flow/common/widgets/basic_app_button.dart';
import 'package:melody_flow/presentation/auth/sign_up_or_sign_in.dart';
import 'package:melody_flow/presentation/choose_mode/bloc/theme_cubit.dart';

class ChooseModePage extends StatefulWidget {
  const ChooseModePage({super.key});

  @override
  State<ChooseModePage> createState() => _ChooseModePageState();
}

class _ChooseModePageState extends State<ChooseModePage> {
  Color _containerColor = Color(0xff30393C);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 40,
              horizontal: 40,
            ),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/start_pg2.png'))),
          ),
          Container(
            color: Colors.black.withOpacity(0.15),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.topCenter,
                  child: Image(
                      image: AssetImage('assets/images/logo_with_text.png')),
                ),
                const Spacer(),
                const Text(
                  'Choose mode',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          _changeColor();
                          context.read<ThemeCubit>().updateTheme(
                              ThemeMode.light);
                        },
                        child: Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                              color: _containerColor.withOpacity(0.5),
                              shape: BoxShape.circle),
                          child: const Icon(
                            color: Colors.white,
                            Icons.light_mode_outlined,
                            size: 50,),

                        ),
                      ),
                      const SizedBox(width: 35,),
                      GestureDetector(
                        onTap:(){
                          context.read<ThemeCubit>().updateTheme(
                              ThemeMode.dark);
                        },
                        child: Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                              color: Color(0xff30393C).withOpacity(0.5),
                              shape: BoxShape.circle),
                          child: const Icon(
                            color: Colors.white,
                            Icons.dark_mode_outlined,
                            size: 50,),

                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20,),
                BasicAppButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => SignUpOrSignInPage(),
                        ));
                  },
                  title: 'Get Started',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
  void _changeColor() {
    setState(() {
      // Toggle between two colors for simplicity
      _containerColor = _containerColor == Color(0xff30393C) ? Colors.green : Color(0xff30393C);
    });
  }
}
