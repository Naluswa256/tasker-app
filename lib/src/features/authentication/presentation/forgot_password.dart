import "package:flutter/material.dart";
// import 'package:phone_form_field/phone_form_field.dart';
import "../../../common_wdigets/button.dart";
import "../../../styles.dart";

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController phoneController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.whiteColor,
      body: Column(children: [
        const SizedBox(
          height: 30,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
              padding: const EdgeInsets.only(left: 24),
              child: AppStyles.backward),
        ),
        const SizedBox(
          height: 24,
        ),
        Center(
          child: SizedBox(width: 121, height: 112, child: Image.asset('assets/images/forgot_password_vector.png')),
        ),
        const SizedBox(height: 24),
        const Text(
          'Forgot Password?',
          style: TextStyle(
              color: AppStyles.neutralDark,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w700,
              fontSize: 24),
        ),
        const SizedBox(height: 15),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 39),
          child: Text(
            'Enter your phone number then we will send\n \t\t\t\tyou OTP sms to reset new password',
            style: TextStyle(
              color: AppStyles.paleDark,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal:24),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  spreadRadius: 0,
                  blurRadius: 8,
                  offset: const Offset(0, 1), // changes position of shadow
                ),
              ],
            ),
            child: TextField(
              controller: phoneController,
              keyboardType:TextInputType.number,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                prefixIcon: const Padding(
                  padding:  EdgeInsets.only(left: 24, right: 16),
                  child:Icon(Icons.phone , color:AppStyles.neutralDark),
                ),
                prefixIconConstraints: const BoxConstraints(
                  minWidth: 24,
                  minHeight: 24,
                ),
                //contentPadding: EdgeInsets.symmetric(vertical: 15.h, horizontal:15.w),
                hintText: 'phone number ',
                hintStyle: const TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 15,
                  color: AppStyles.paleDark,
                ),
                filled: true,
                fillColor: AppStyles.whiteColor,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(16),
                ),
                focusedBorder:  OutlineInputBorder(
                  borderSide:const BorderSide(
                    color:AppStyles.primary
                  ),
                  borderRadius: BorderRadius.circular(16),
                )
              ),
            ),
          ),
        ),
        const SizedBox(height:16),

      const   Button(
        onPressed: null,
          child: 
            Text(
              'Send OTP',
              style: TextStyle(
                color: AppStyles.whiteColor,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),

        )
      ]),
    );
  }
}
