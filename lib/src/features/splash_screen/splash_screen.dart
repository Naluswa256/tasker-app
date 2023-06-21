import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:shared_preferences/shared_preferences.dart";




class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
     late bool _isFirstTime;
  late bool _isSignupComplete;
  late bool _isLoginComplete;

  @override
  void initState() {
    super.initState();
    _isFirstTime = true;
    _isSignupComplete = false;
    _isLoginComplete = false;
    checkIfUserIsLoggedIn();
  }

  Future<void> checkIfUserIsLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    final isFirstTime = prefs.getBool('first_time') ?? true;
    final isSignupComplete = prefs.getBool('signup_complete') ?? false;
    final isLoginComplete = prefs.getBool('login_complete') ?? false;

    setState(() {
      _isFirstTime = isFirstTime;
      _isSignupComplete = isSignupComplete;
      _isLoginComplete = isLoginComplete;
    });

    await Future.delayed(const Duration(seconds: 3));

    if (_isFirstTime) {
      await prefs.setBool('first_time', false);
      await navigateToIntroductionScreen();
    } else if (_isSignupComplete && _isLoginComplete) {
      await navigateToDashboard();
    } else if (!_isSignupComplete) {
      await navigateToSignup();
    } else {
      await navigateToLogin();
    }
  }

   navigateToIntroductionScreen() {
   GoRouter.of(context).go('/intro');
  }
 navigateToSignup() {
     GoRouter.of(context).go('/signup');
  }

  navigateToLogin(){
  GoRouter.of(context).go('/login');
  }

 navigateToDashboard(){
    GoRouter.of(context).go('/dashboard');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png', width: 200, height: 200),
            const SizedBox(height: 20),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
