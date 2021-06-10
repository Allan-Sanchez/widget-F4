import 'package:flutter/material.dart';
// import 'package:components/src/pages/home_temo.dart';
//paths
import 'package:components/src/router/router.dart';
import 'package:components/src/pages/alert_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      // home: HomePage()
      initialRoute: '/',
      routes: getApplicationRouter(),
      onGenerateRoute: (RouteSettings settings) {
        print('router name ${settings.name}');
        return MaterialPageRoute(
            builder: (BuildContext context) => AlertPage());
      },
    );
  }
}
