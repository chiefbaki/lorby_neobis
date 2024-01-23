import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lorby_neobis/presentation/bloc/email_confirm_bloc/email_confirm_bloc.dart';
import 'package:lorby_neobis/presentation/bloc/register_bloc/register_bloc.dart';
import 'package:lorby_neobis/presentation/router/app_router.dart';
import 'package:lorby_neobis/provider/btn_activity.dart';
import 'package:lorby_neobis/provider/pass_visibility.dart';
import 'package:lorby_neobis/repository/register_repository.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) {
          return RepositoryProvider(
            create: (context) => RegisterRepository(),
            child: MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => RegisterBloc(
                      repository:
                          RepositoryProvider.of<RegisterRepository>(context)),
                ),
                BlocProvider(
                  create: (context) => EmailConfirmBloc(
                      repository:
                          RepositoryProvider.of<RegisterRepository>(context)),
                ),
              ],
              child: MultiProvider(
                providers: [
                  ChangeNotifierProvider(
                      create: (context) => PassVisibilityProvider()),
                  ChangeNotifierProvider(create: (context) => ButtonActivity()),
                ],
                child: MaterialApp.router(
                  theme: ThemeData(
                      fontFamily: "Mplus 1P",
                      scaffoldBackgroundColor: Colors.white),
                  debugShowCheckedModeBanner: false,
                  routerConfig: AppRouter().config(),
                ),
              ),
            ),
          );
        });
  }
}
