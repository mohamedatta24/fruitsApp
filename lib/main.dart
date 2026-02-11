import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fruits_app/core/router/app_router_name.dart';
import 'package:fruits_app/core/router/on_generate_route.dart';
import 'package:fruits_app/core/services/custom_bloc_observer.dart';
import 'package:fruits_app/core/services/dependency_injection.dart';
import 'package:fruits_app/core/services/shared_preferences.dart';
import 'package:fruits_app/firebase_options.dart';
import 'package:fruits_app/generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await SharedPref.init();
  Bloc.observer = CustomBlocObserver();
  setupGetIt();

  runApp(const FruitsApp());
}

class FruitsApp extends StatelessWidget {
  const FruitsApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: Locale("ar"),
      theme: ThemeData(
        fontFamily: "Cairo",
        scaffoldBackgroundColor: const Color(0xffffffff),
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute: AppRouterName.splashView,
    );
  }
}
