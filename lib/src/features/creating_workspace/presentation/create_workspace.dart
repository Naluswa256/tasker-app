import "package:flutter/material.dart";
import "package:kuunganatask/src/styles.dart";
import 'package:email_validator/email_validator.dart';
import "../../../common_wdigets/button.dart";
class CreateWorkSpace extends StatefulWidget {
  const CreateWorkSpace({super.key});

  @override
  State<CreateWorkSpace> createState() => _CreateWorkSpaceState();
}

class _CreateWorkSpaceState extends State<CreateWorkSpace> {
 final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _workSpaceNameController = TextEditingController();
  final TextEditingController _numberOfMembersController = TextEditingController();
 final  TextEditingController _companyEmailController = TextEditingController();
  
  @override
  void dispose() {

    _workSpaceNameController.dispose();
    _numberOfMembersController.dispose();
    _companyEmailController.dispose();
    super.dispose();
  }

  String? validateWorkspaceName(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a workspace name';
  }
  if (value.length < 10 || value.length > 25) {
    return 'Workspace name should be between 10 and 25 characters';
  }
  if (!RegExp(r'^[a-zA-Z0-9 ]+$').hasMatch(value)) {
    return 'Workspace name should only contain letters, numbers, and spaces';
  }
  if (!RegExp(r'^[A-Z][a-zA-Z0-9 ]+$').hasMatch(value)) {
    return 'Workspace name should start with a capital letter and use title case';
  }
  return null; // Return null if the input is valid
}

String? validateNumber(String? value) {
  if ( value==null || value.isEmpty) {
    return 'Please Enter number ';
  }
  if (value.length < 5) {
    return 'Number of members should be at least be 5 ';
  }
  return null; // Return null if the input is valid
}

 String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    // if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
    //   return 'Please enter a valid email address';
    // }

   if(!EmailValidator.validate(value)){
     return 'Please enter a valid email address';
   }

    return null;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height:20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:24,),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                      Row(
                 
                  children: [
                    
                      AppStyles.backward,
                      const SizedBox(width:58),
                      const Text(
                        'Create a WorkSpace',
                        style: TextStyle(
                            color: AppStyles.neutralDark,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w700,
                            fontSize: 18),
                      ),
                      
                      
                  ],
                ),     
              
              
                const SizedBox(height:24),
                      const Text(
                        'Name',
                        style: TextStyle(
                            color: AppStyles.neutralDark,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w700,
                            fontSize: 16),
                      ),
                      const SizedBox(height:16),
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.08),
                              spreadRadius: 0,
                              blurRadius: 8,
                              offset: const Offset(
                                  0, 1), // changes position of shadow
                            ),
                          ],
                        ),
                        child: TextFormField(
                          controller: _workSpaceNameController,
                          validator: validateWorkspaceName,
                          cursorColor: AppStyles.primary,
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
                            hintText: 'Enter a Workspace Name',
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
                                  focusedBorder:  OutlineInputBorder(
                                  borderSide: const BorderSide(color: AppStyles.primary),
                                  borderRadius: BorderRadius.circular(16)),
                          ),
                        ),
                      ),
                        
                      const SizedBox(height:24),
                      const Text(
                        'Number of Members',
                        style: TextStyle(
                            color: AppStyles.neutralDark,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w700,
                            fontSize: 16),
                      ),
                      const SizedBox(height:16),
                       Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.08),
                              spreadRadius: 0,
                              blurRadius: 8,
                              offset: const Offset(
                                  0, 1), // changes position of shadow
                            ),
                          ],
                        ),
                        child: TextFormField(
                          controller: _numberOfMembersController,
                          keyboardType: TextInputType.number,
                          validator: validateNumber,
                          cursorColor: AppStyles.primary,
                          decoration: InputDecoration(
                            prefixIcon: Padding(
                              padding: const EdgeInsets.only(left: 24, right: 16),
                              child: AppStyles.users,
                            ),
                            prefixIconConstraints: const BoxConstraints(
                              minWidth: 24,
                              minHeight: 24,
                            ),
                            //contentPadding: EdgeInsets.symmetric(vertical: 15.h, horizontal:15.w),
                            hintText: 'Number of members',
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
                                  focusedBorder:  OutlineInputBorder(
                                  borderSide: const BorderSide(color: AppStyles.primary),
                                  borderRadius: BorderRadius.circular(16)),
                          ),
                        ),
                      ),
              
                      
                      const SizedBox(height:24),
                      const Text(
                        'Email',
                        style: TextStyle(
                            color: AppStyles.neutralDark,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w700,
                            fontSize: 16),
                      ),
                      const SizedBox(height:16),
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.08),
                              spreadRadius: 0,
                              blurRadius: 8,
                              offset: const Offset(
                                  0, 1), // changes position of shadow
                            ),
                          ],
                        ),
                        child: TextFormField(
                          controller: _companyEmailController,
                          validator: validateEmail,
                          cursorColor: AppStyles.primary,
                          decoration: InputDecoration(
                            prefixIcon: Padding(
                              padding: const EdgeInsets.only(left: 24, right: 16),
                              child: AppStyles.email,
                            ),
                            prefixIconConstraints: const BoxConstraints(
                              minWidth: 24,
                              minHeight: 24,
                            ),
                            //contentPadding: EdgeInsets.symmetric(vertical: 15.h, horizontal:15.w),
                            hintText: 'Company Email',
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
                                  focusedBorder:  OutlineInputBorder(
                                  borderSide: const BorderSide(color: AppStyles.primary),
                                  borderRadius: BorderRadius.circular(16)),
                          ),
                        ),
                      ),
              
                  ]
                ),
              ),
            
          
                   const SizedBox(height:32),
                   Button(
            onPressed: (){},
            child:  const Text(
                    'Create',
                    style: TextStyle(
                        color: AppStyles.whiteColor,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
          ),
                  
              
            ],
          ),
        ),
      ),
    );
  }
}