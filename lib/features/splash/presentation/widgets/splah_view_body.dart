import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_app/constants.dart';
import 'package:fruits_app/core/services/firebase_auth_services.dart';
import 'package:fruits_app/core/services/shared_preferences_single_tone.dart';
import 'package:fruits_app/features/auth/presentation/views/signin_view.dart';
import 'package:fruits_app/features/home/presentation/views/main_view.dart';
import 'package:fruits_app/features/on_boarding/presentation/view/onbording_view.dart';
import 'package:fruits_app/core/utils/app_image.dart';

class SplahViewBody extends StatefulWidget {
  const SplahViewBody({super.key});

  @override
  State<SplahViewBody> createState() => _SplahViewBodyState();
}

class _SplahViewBodyState extends State<SplahViewBody> {
  @override
  void initState() {
    excuteNavigation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SvgPicture.asset(Assets.plant),
          ],
        ),
        SvgPicture.asset(Assets.logo),
        SvgPicture.asset(Assets.buttonsplash)
      ],
    );
  }

  void excuteNavigation() {
    bool isOnBordingViewScreen =
        SharedPreferencesService.getBool(kIsOnBordingViewScreen);
    Future.delayed(
      Duration(seconds: 3),
      () async {
        if (isOnBordingViewScreen) {
          if (FirebaseAuthServices().isLoggedIn()) {
            Navigator.pushReplacementNamed(context, MainView.route);
          } else {
            Navigator.pushReplacementNamed(context, SignInView.route);
          }
        } else {
          Navigator.pushReplacementNamed(context, OnbordingView.route);
        }
      },
    );
  }
}
