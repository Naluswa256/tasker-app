import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../common_wdigets/button.dart';
import '../../../styles.dart';

class MyIntroScreen extends StatelessWidget {
 
  


 const  MyIntroScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
    PageViewModel(
      title: "",
      bodyWidget: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 70),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Image.asset('assets/images/onboarding_screen_one.png',
                width: double.infinity, height: 348),
          ),
          const SizedBox(height: 60),
          const Text(
            'Lorem Ipsum is simply\n dummy text?',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: AppStyles.neutralDark,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w700,
                fontSize: 24),
          ),
          const SizedBox(height: 14),
          const Text(
            'Welcome!!! Do you want to clear task\n super fast with Mane?',
            style: TextStyle(
                color: AppStyles.neutralDark,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w500,
                fontSize: 14),
          ),
        ],
      ),
      decoration: const PageDecoration(pageColor: AppStyles.whiteColor),
      //image: const Center(child: Icon(Icons.android)),
    ),
    PageViewModel(
      title: "",
      bodyWidget: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 70),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Image.asset('assets/images/onboarding_screen_two.png',
                width: double.infinity, height: 348),
          ),
          const SizedBox(height: 60),
          const Text(
            'Lorem Ipsum is simply\n dummy text?',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: AppStyles.neutralDark,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w700,
                fontSize: 24),
          ),
          const SizedBox(height: 14),
          const Text(
            'Easily arrange work order for you to\n manage.Many functions to choose',
            style: TextStyle(
                color: AppStyles.neutralDark,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w500,
                fontSize: 14),
          ),
        ],
      ),
      decoration: const PageDecoration(pageColor: AppStyles.whiteColor),
      //image: const Center(child: Icon(Icons.android)),
    ),
    PageViewModel(
      title: "",
      bodyWidget: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 70),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Image.asset('assets/images/onboarding_screen_three.png',
                width: double.infinity, height: 348),
          ),
          const SizedBox(height: 30),
          const Text(
            'Lorem Ipsum is simply\n dummy text?',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: AppStyles.neutralDark,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w700,
                fontSize: 24),
          ),
          const SizedBox(height: 14),
          const Text(
            'it has been easier to complete tasks\n\t\t\t\t\t\t\t\t\t\t\t\tGet started with us ',
            style: TextStyle(
                color: AppStyles.neutralDark,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w500,
                fontSize: 14),
          ),
          const SizedBox(height: 20),
          Button(
            onPressed: ()async {
                navigateToSignUp() {
    GoRouter.of(context).go('/signup'); 
  }

                SharedPreferences prefs = await SharedPreferences.getInstance();
                  await prefs.setBool('first_time', false);
                  navigateToSignUp();

            },
            child: const Text(
              'Get Started',
              style: TextStyle(
                  color: AppStyles.whiteColor,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500,
                  fontSize: 16),
            ),
          ),
          const SizedBox(height: 12),
          Wrap(children: [
            const Text(
              'Already have an account?',
              style: TextStyle(
                  color: AppStyles.paleDark,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500,
                  fontSize: 16),
            ),
            const SizedBox(width: 8),
            GestureDetector(
              onTap: () {},
              child: const Text(
                'Sign In',
                style: TextStyle(
                    color: AppStyles.ascent,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w700,
                    fontSize: 16),
              ),
            ),
          ])
        ],
      ),
      decoration: const PageDecoration(pageColor: AppStyles.whiteColor),
      //image: const Center(child: Icon(Icons.android)),
    ),
  ],
      showSkipButton: true,
      showDoneButton: false,
      showNextButton: false,
      skip: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppStyles.primary,
            ),
            child: IconButton(
              icon: AppStyles.chevronRight,
              onPressed: () {
                // On Skip button pressed
              },
            ),
          ),
          const SizedBox(width: 13),
          const Text(
            'Skip',
            style: TextStyle(
                color: AppStyles.paleDark,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w700),
          ),
        ],
      ),
      onSkip: () {
        // On Skip button pressed
      },
      dotsDecorator: DotsDecorator(
        size: const Size.square(10.0),
        activeSize: const Size(24, 8),
        activeColor: AppStyles.primary,
        color: Colors.black26,
        spacing: const EdgeInsets.symmetric(horizontal: 3.0),
        activeShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(0))),
      ),
    );
  }
}
