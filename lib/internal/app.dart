import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lorby_neobis/presentation/bloc/email_confirm_bloc/email_confirm_bloc.dart';
import 'package:lorby_neobis/presentation/bloc/login_bloc/login_bloc.dart';
import 'package:lorby_neobis/presentation/bloc/register_bloc/register_bloc.dart';
import 'package:lorby_neobis/presentation/router/app_router.dart';
import 'package:lorby_neobis/presentation/provider/btn_activity.dart';
import 'package:lorby_neobis/presentation/provider/pass_visibility.dart';
import 'package:lorby_neobis/domain/repository/register_repository.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
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
          BlocProvider(
            create: (context) => LoginBloc(
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
  }
}
