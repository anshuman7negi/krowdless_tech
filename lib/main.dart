import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import 'Api services/cubit/Appcubit.dart';
import 'Api services/repo/Apprepository.dart';
import 'Utils/preference manager.dart';
import 'Views/Auth/dashboard.dart';
import 'Views/Auth/splash.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferenceManager.init();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        final repository = AppRepository();
        return MultiBlocProvider(
        providers: [
            BlocProvider(create: (_) => AppCubit(repository)),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            navigatorKey: navigatorKey,
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.white,
              ),
            ),
            home: const Splashscreen(),
           //home: const BottomBar(),
          ),
        );
      },
    );
  }
}
