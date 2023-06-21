import "package:flutter/material.dart";
// import 'package:phone_form_field/phone_form_field.dart';
import "../../../common_wdigets/button.dart";
import "../../../styles.dart";
import 'package:pin_code_fields/pin_code_fields.dart';
import 'dart:async';
class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController phoneController= TextEditingController();
  final TextEditingController textEditingController= TextEditingController();
  int _secondsRemaining = 30;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    const oneSec =  Duration(seconds: 1);
    _timer =  Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_secondsRemaining < 1) {
            timer.cancel();
          } else {
            _secondsRemaining = _secondsRemaining - 1;
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
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
          child: SizedBox(width: 121, height: 112, child: Image.asset('assets/images/otp_illustration.png')),
        ),
        const SizedBox(height: 24),
        const Text(
          'Enter OTP',
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
            'Enter the OTP we just sent to your phone\n \t\t\t\tthen start reset your new password',
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
                    padding: const EdgeInsets.symmetric(
 horizontal: 24),
                    child: PinCodeTextField(
                      appContext: context,
                      length: 4,
                      obscureText: true,
                      obscuringCharacter: '*',
                      cursorColor: Colors.black,
                      textStyle: const TextStyle(fontSize: 20, height: 1.6),
                      backgroundColor: AppStyles.whiteColor,                   
                      controller: textEditingController,
                      mainAxisAlignment:MainAxisAlignment.center,
                      keyboardType: TextInputType.number,
                      boxShadows:  [
                        BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  spreadRadius: 0,
                  blurRadius: 8,
                  offset: const Offset(0, 1), // changes position of shadow
                ),
                      ],
                      onCompleted: (v) {

                      },
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(16),
                        fieldHeight: 70,
                        fieldWidth: 70,
                        activeColor:AppStyles.whiteColor,
                        fieldOuterPadding:const EdgeInsets.only(right:16),
                        inactiveColor: AppStyles.whiteColor,
                        selectedFillColor:AppStyles.whiteColor,

                      // onTap: () {
                      //   print("Pressed");
                      // },

                    ), onChanged: (String value) {  },),
              ),
              const SizedBox(
          height: 16,
        ),
         Center(
        child: Visibility(
          visible: _secondsRemaining > 0,
          child: Wrap(
            children: [
              const Text(
                ' Resend OTP',
                style:TextStyle(
                  color: AppStyles.neutralDark,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              const SizedBox(width:7),
              Text(
                'in 00:${_secondsRemaining}s',
                style:const TextStyle(
                  color: AppStyles.paleDark,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
        const SizedBox(height:24),
  Button(
    onPressed: null,
          child: 
            Center(
              child: Row(
                mainAxisSize:MainAxisSize.min, 
                mainAxisAlignment:MainAxisAlignment.center,
                children: const [
              Text(
                    'Next',
                    style: TextStyle(
                      color: AppStyles.whiteColor,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
            
                  SizedBox(width:8),
                  Icon(Icons.forward, color:AppStyles.whiteColor, size:24)
                ],
              ),
            ),

        )
      ]),
    );
  }
}
