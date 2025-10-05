import 'package:flutter/material.dart';
import 'package:fruits_app/features/auth/presentation/views/signin_view.dart';
import 'package:fruits_app/features/auth/presentation/views/signup_view.dart';
import 'package:fruits_app/features/best_selling/presentation/views/best_selling_view.dart';
import 'package:fruits_app/features/home/presentation/views/home_view.dart';
import 'package:fruits_app/features/on_boarding/presentation/view/onbording_view.dart';
import 'package:fruits_app/features/splash/presentation/view/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings setting) {
  switch (setting.name) {
    case SplashView.route:
      return MaterialPageRoute(builder: (context) => SplashView());
      case OnbordingView.route:
      return MaterialPageRoute(builder: (context) => OnbordingView());
      case  SignInView.route :
      return  MaterialPageRoute(builder: (context) => SignInView());
      case  SignupView.route :
      return  MaterialPageRoute(builder: (context) => SignupView());
      case HomeView.route :
      return MaterialPageRoute(builder: (context) => HomeView());
      case BestSellingView.route :
      return MaterialPageRoute(builder: (context) => BestSellingView());
    default : 
    return MaterialPageRoute(builder: (context) => Scaffold());
  }
}
