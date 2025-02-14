import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:melody_flow/core/configs/theme/app_theme.dart';
import 'package:melody_flow/firebase_options.dart';
import 'package:melody_flow/presentation/choose_mode/bloc/theme_cubit.dart';
import 'package:melody_flow/presentation/splash/pages/splash.dart';
import 'package:melody_flow/service_locator.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();//khoi tao rang buoc trc khi su dung cac dich vu
  HydratedBloc.storage = await HydratedStorage.build( // chay web thi la HydratedStorage.webStorageDirectory.
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );

  await initializeDependencies();
  runApp(MyApp());
}
//hydratedBloc dung de luu trang thai bloc ngay ca khi ung dung tat
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit())
      ],
      child: BlocBuilder<ThemeCubit,ThemeMode>(
        builder: (context,mode) => MaterialApp(
            //showPerformanceOverlay: true,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: mode,
            debugShowCheckedModeBanner: false,
            home: const SplashPage()
        ),
      ),
    );
  }
}





