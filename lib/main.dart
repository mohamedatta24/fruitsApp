import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fruits_app/core/router/app_router_name.dart';
import 'package:fruits_app/core/router/on_generate_route.dart';
import 'package:fruits_app/core/services/shared_preferences.dart';
import 'package:fruits_app/generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.init();
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
