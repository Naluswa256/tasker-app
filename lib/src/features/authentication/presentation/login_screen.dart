import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import "../../../common_wdigets/button.dart";
import "../../../styles.dart";
import "package:kuunganatask/src/features/authentication/data/firebaseAuth_controller.dart";


class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({super.key});

  @override
    ConsumerState<ConsumerStatefulWidget>  createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isHidden = true;
  final _formKey = GlobalKey<FormState>();
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      ref
          .read(firebaseAuthControllerProvider.notifier)
          .siginUserWithEmailandPassword(
              context, _emailController.text.trim(), _passwordController.text);
    }
  }
   String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    return null;
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();

  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(firebaseAuthControllerProvider);

    return Scaffold(
      backgroundColor: AppStyles.whiteColor,
      body: Form(
        key:_formKey,
        child: Column(
          children: [
            const SizedBox(height: 30),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: AppStyles.backward),
            ),
            const SizedBox(height: 34),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Sign In',
                  style: TextStyle(
                      color: AppStyles.neutralDark,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w700,
                      fontSize: 24),
                ),
                const SizedBox(width: 8),
                Image.asset('assets/images/signup_vector.png',
                    width: 34, height: 33),
              ],
            ),
            const SizedBox(height: 39),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    Container(
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
                      child: TextFormField(
                        controller: _emailController,
                        validator:_validateEmail,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(left: 24, right: 16),
                            child: AppStyles.user,
                          ),
                          prefixIconConstraints: const BoxConstraints(
                            minWidth: 24,
                            minHeight: 24,
                          ),
                          //contentPadding: EdgeInsets.symmetric(vertical: 15.h, horizontal:15.w),
                          hintText: 'Email',
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
                          errorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.red),
                                  borderRadius: BorderRadius.circular(16)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Container(
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
                      child: TextFormField(
                          controller: _passwordController,
                          obscureText: _isHidden,
                          validator:_validatePassword,
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
      
                            hintText: 'password',
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
                            errorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.red),
                                  borderRadius: BorderRadius.circular(16)),
                          )),
                    ),
                    const SizedBox(height: 16),
                    
                  ],
                )),
            const SizedBox(height: 32),
             Button(
              onPressed: isLoading? null :_submit,
              child:isLoading? const CircularProgressIndicator(): const Text(
                'Sign In',
                style: TextStyle(
                    color: AppStyles.whiteColor,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
              ),
            ),
            const SizedBox(height: 24),
            Row(children: [
              Expanded(
                child: Container(
                    margin: const EdgeInsets.only(left: 24, right: 16),
                    child:  Divider(
                      color: Colors.black.withOpacity(0.5),
                      height: 0,
                    )),
              ),
              const Text(
                'Or sign in with',
                style: TextStyle(
                    color: AppStyles.paleDark,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
              ),
              Expanded(
                child: Container(
                    margin: const EdgeInsets.only(left: 16, right: 24),
                    child:  Divider(
                      color: Colors.black.withOpacity(0.5),
                      height: 0,
                    )),
              ),
            ]),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment:MainAxisAlignment.center,
              children:  [
              Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: AppStyles.neutralLight,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: AppStyles.facebook
        ),
      ),
      
      const SizedBox(width:16),
      Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: AppStyles.neutralLight,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: AppStyles.instragram
        ),
      ),
      const SizedBox(width:16),
      Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: AppStyles.neutralLight,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: AppStyles.google
        ),
      ),
      
            ]),
            const SizedBox(height: 161),
            Wrap(children: [
              const Text(
                'Dont have an account?',
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
                  'Sign Up',
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
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}


