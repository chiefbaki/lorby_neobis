import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lorby_neobis/presentation/router/app_router.dart';
import 'package:lorby_neobis/provider/btn_activity.dart';
import 'package:lorby_neobis/provider/pass_visibility.dart';
import 'package:provider/provider.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_)=> PassVisibilityProvider()),
              ChangeNotifierProvider(create: (_)=> ButtonActivity()),
            ],
            child: MaterialApp.router(
              theme: ThemeData(
                fontFamily: "Mplus 1P",
                scaffoldBackgroundColor: Colors.white
              ),
              debugShowCheckedModeBanner: false,
              routerConfig: AppRouter().config(),
            ),
          );
        });
  }
}
