import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/pages/provider/Counter.dart';

import 'package:flutter_shop/routers/router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(750, 1334),
      builder: (BuildContext context, Widget? child) {
        return MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (BuildContext context) {
                Counter();
              })
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              initialRoute: "/",
              onGenerateRoute: onGenerateRoute,
              theme: ThemeData(
                  primaryColor: Colors.white, primaryColorLight: Colors.white),
            ));
      },
      // child: MultiProvider(
      //     providers: [
      //       ChangeNotifierProvider(create: (BuildContext context) {
      //         Counter();
      //       })
      //     ],
      //     child: MaterialApp(
      //       debugShowCheckedModeBanner: false,
      //       initialRoute: "/",
      //       onGenerateRoute: onGenerateRoute,
      //       theme: ThemeData(primaryColor: Colors.white),
      //     )),
    );
  }
}
