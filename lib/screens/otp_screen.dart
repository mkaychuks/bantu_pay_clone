import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:myapp/screens/welcome_screen.dart';
import 'package:myapp/widgets/custom_button.dart';

import '../widgets/otp_form_field.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  GlobalKey<FormState> formkey = GlobalKey(); // the form key
  bool _isSaving = false; // controls the third_party modal

// a function that controls the pop up and close of the modal
  void _isOTPCorrect() {
    setState(() {
      _isSaving = true;
    });

    Future.delayed(
      const Duration(seconds: 10),
      () {
        setState(() {
          _isSaving = false;
        });
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => const WelcomeScreen(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
          ),
          body: ModalProgressHUD(
            opacity: 0.7,
            inAsyncCall: _isSaving,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: SingleChildScrollView(
                child: Form(
                  key: formkey,
                  child: Column(
                    children: [
                      Text(
                        "Verify your email",
                        style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2),
                      ),
                      SizedBox(height: 30.h),

                      //  verification message
                      Text(
                        "Verification code has been sent to sach***@gmail.com",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          letterSpacing: 1,
                          fontSize: 20.sp,
                        ),
                      ),

                      SizedBox(height: 24.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          OTPInputFields(controller: null),
                          OTPInputFields(controller: null),
                          OTPInputFields(controller: null),
                          OTPInputFields(controller: null),
                        ],
                      ),

                      SizedBox(height: 30.h),

                      RichText(
                        text: TextSpan(
                          text: "Didn't get the verification code? ",
                          style: TextStyle(
                              fontSize: 16.sp,
                              color: Colors.grey,
                              letterSpacing: 1),
                          children: [
                            TextSpan(
                              text: "Try again",
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.deepOrange,
                                letterSpacing: 1,
                              ),
                              recognizer: TapGestureRecognizer()..onTap = () {},
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 24.h),
                      MyCustomButton(
                        onPressed: () {
                          _isOTPCorrect();
                        },
                        title: "Submit",
                        backgroundColor: Colors.deepOrange,
                        foregroundColor: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
