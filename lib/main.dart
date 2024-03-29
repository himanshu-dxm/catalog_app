import 'package:catalog_app/pages/cart_page.dart';
import 'package:catalog_app/store/store.dart';
import 'package:catalog_app/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';
import 'utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(VxState(
      store: MyStore(),
      child: MyApp())
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: HomePage(),
      themeMode: ThemeMode.system,
      theme:Mytheme.lightTheme(context),
      initialRoute: MyRoutes.homeRoute,// to specify the initial page explicitly
      routes: {
        "/" : (context) => LoginPage(),
        MyRoutes.homeRoute : (context) => HomePage(),
        MyRoutes.loginRoute : (context) => LoginPage(),
        MyRoutes.cartRoute : (context) => CartPage(),
      },
    );
  }
}
