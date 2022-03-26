import 'package:flutter/material.dart';
import 'package:hamro_patro_clone/presentation/resources/colors.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.primaryColor,
      child: Center(
        child: Image.asset(
          "assets/images/hamropatro.png",
          height: 72,
          width: 72,
        ),
      ),
    );
  }
}
