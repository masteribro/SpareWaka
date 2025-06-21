import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spare_waka/splash_screen.dart';
import 'applications/auth/authentication_cubit.dart';
import 'firebase_options.dart';
import 'ioc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  var ioc = IoC();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: getIt<AuthenticationCubit>(),
        ),
      ],
      child: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            FocusManager.instance.primaryFocus!.unfocus();
          }
        },
        child: ScreenUtilInit(
          designSize: const Size(390, 844),
          minTextAdapt: true,
          builder: (_, __) => MaterialApp(
            themeMode: ThemeMode.light,
            darkTheme: ThemeData.light(),
            debugShowCheckedModeBanner: false,
            // theme: theme,
            // color: AppColors.primary,
            home: const SplashScreen(),
            // navigatorObservers: <NavigatorObserver>[
            //   AnalyticsService().getAnalyticsObserver()
            // ],
            // scaffoldMessengerKey:
            // ScaffoldMessengerService.scaffoldMessengerKey,
          ),
        ),
      ),
    );
  }
}


