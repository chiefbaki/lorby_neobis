import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lorby_neobis/resources/resources.dart';


@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(
        children: [
          Text("Lorby"),
          Text("Твой личный репетитор"),
          Image.asset(Images.illustration)
        ],
      )),
    );
  }
}