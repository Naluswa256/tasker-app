import "package:flutter/material.dart";
// import 'package:phone_form_field/phone_form_field.dart';
import "../../../common_wdigets/button.dart";
import "../../../styles.dart";

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _isHidden = true;
   bool _confirmPasswordHidden = true;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
          child: SizedBox(width: 121, height: 112, child:Image.asset('assets/images/reset_password_illustration.png')),
        ),
        const SizedBox(height: 24),
        const Text(
          'Reset new password?',
          style: TextStyle(
              color: AppStyles.neutralDark,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w700,
              fontSize: 24),
        ),
    const SizedBox(height:31),
     const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:24),
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            spreadRadius: 0,
                            blurRadius: 8,
                            offset:
                                const Offset(0, 1), // changes position of shadow
                          ),
                        ],
                      ),
                      child: TextField(
                          controller: _passwordController,
                          obscureText: _isHidden,
                          obscuringCharacter:'*',
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            suffixIcon: InkWell(
                              onTap: _togglePasswordView,
                              child: _isHidden
                                  ? Padding(
                                      padding: const EdgeInsets.only(right: 16),
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 16),
                                        child: AppStyles.invisibleSvg,
                                      ),
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.only(right: 16),
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 16),
                                        child: AppStyles.visibilityShowSvg,
                                      ),
                                    ),
                            ),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.only(left: 24, right: 16),
                              child: AppStyles.lock,
                            ),
                            prefixIconConstraints: const BoxConstraints(
                              minWidth: 24,
                              minHeight: 24,
                            ),
                            suffixIconConstraints: const BoxConstraints(
                              minWidth: 24,
                              minHeight: 24,
                            ),
                  
                            hintText: ' new password',
                            hintStyle: const TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 15,
                              color: AppStyles.paleDark,
                            ),
                            filled: true,
                            fillColor: AppStyles.whiteColor,
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(16)),
                          )),
                    ),
                  ),
                  const SizedBox(height:24),
                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal:24),
                     child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            spreadRadius: 0,
                            blurRadius: 8,
                            offset:
                                const Offset(0, 1), // changes position of shadow
                          ),
                        ],
                      ),
                      child: TextField(
                          controller: _confirmPasswordController,
                          obscureText: _confirmPasswordHidden,
                          obscuringCharacter: '*',
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            suffixIcon: InkWell(
                              onTap: _toggleConfirmPasswordView,
                              child: _confirmPasswordHidden
                                  ? Padding(
                                      padding: const EdgeInsets.only(right: 16),
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 16),
                                        child: AppStyles.invisibleSvg,
                                      ),
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.only(right: 16),
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 16),
                                        child: AppStyles.visibilityShowSvg,
                                      ),
                                    ),
                            ),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.only(left: 24, right: 16),
                              child: AppStyles.lock,
                            ),
                            prefixIconConstraints: const BoxConstraints(
                              minWidth: 24,
                              minHeight: 24,
                            ),
                            suffixIconConstraints: const BoxConstraints(
                              minWidth: 24,
                              minHeight: 24,
                            ),
                            hintText: 'confirm new password',
                            hintStyle: const TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 15,
                              color: AppStyles.paleDark,
                            ),
                            filled: true,
                            fillColor: AppStyles.whiteColor,
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(16)),
                          )),
                                     ),
                   ),
const SizedBox(height: 24,),
      const   Button(
        onPressed: null,
          child: 
            Text(
              'Save changes',
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

   void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  void _toggleConfirmPasswordView() {
    setState(() {
      _confirmPasswordHidden = !_confirmPasswordHidden;
    });
  }
}
