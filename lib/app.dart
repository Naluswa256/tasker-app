import "package:flutter/material.dart";
import "package:kuunganatask/src/routing/routing.dart";

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouting.router,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          dividerColor: Colors.transparent
        ),
      );
  }
}
