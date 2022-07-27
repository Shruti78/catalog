import 'package:catalog/pages/home_page.dart';
import 'package:catalog/pages/login_page.dart';
import 'package:catalog/utils/routes.dart';
import 'package:catalog/widgets/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => Homepage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
      },
    );
  }
}
