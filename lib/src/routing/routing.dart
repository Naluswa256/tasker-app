import 'package:go_router/go_router.dart';
import "package:kuunganatask/src/features/authentication/presentation/signup_screen.dart";
import "package:kuunganatask/src/features/authentication/presentation/login_screen.dart";
import "package:kuunganatask/src/features/onboarding/presentation/onboarding_screen.dart";
import "package:kuunganatask/src/features/dashboard/presentation/dashboard.dart";
import "package:kuunganatask/src/features/projects/presentation/project_create.dart";
import "package:kuunganatask/src/features/splash_screen/splash_screen.dart";

import "../features/creating_workspace/presentation/create_workspace.dart";
import "../features/projects/presentation/project_details.dart";
// GoRouter configuration



class AppRouting{

   static final  router = GoRouter(
  routes: [
    GoRoute(
      path: '/signup',
      builder: (context, state) => const SignUpForm(),
    ),

    GoRoute(
      path: '/',
      builder: (context, state) => const  Dashboard(),
    ),


    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginForm(),
    ),


    GoRoute(
      path: '/intro',
      builder: (context, state) => const  MyIntroScreen(),
    ),

    GoRoute(
      path: '/dashboard',
      builder: (context, state) => const Dashboard(),
    ),
  ],
);


}