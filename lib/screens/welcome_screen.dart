import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:myapp/screens/create_wallet_screen.dart';
import 'package:myapp/screens/home_screen.dart';
import 'package:myapp/screens/qr_scan_screen.dart';
import 'package:myapp/widgets/custom_button.dart';
import 'package:myapp/widgets/textform_widget.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(elevation: 0),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const QRCodeScreen(),
              ),
            );
          },
          elevation: 0,
          child: const Icon(Icons.qr_code_scanner_outlined),
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            width: width,
            height: height,
            child: Column(
              children: [
                UpperContainer(width: width, height: height),
                const LowerContainerWithForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/* the lower container that houses the validation fields
 it is a stateful widget i think
*/
class LowerContainerWithForm extends StatefulWidget {
  const LowerContainerWithForm({
    super.key,
  });

  @override
  State<LowerContainerWithForm> createState() => _LowerContainerWithFormState();
}

class _LowerContainerWithFormState extends State<LowerContainerWithForm> {
  bool _passwordObscureText = true;
  final TextEditingController _passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  bool _isBoolean = false;

  void signInUser(String password) {
    if (formKey.currentState!.validate() && password == "6chimalane") {
      // set the spinning wheel rolling
      setState(() {
        _isBoolean = true;
      });

      // after a delay of 10 seconds and set the wheel to false and then navigate
      Future.delayed(
        const Duration(seconds: 10),
        () {
          setState(() {
            _isBoolean = false;
          });

          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
          );
        },
      );
    } else {
      setState(() {
        _isBoolean = true;
      });
      Future.delayed(const Duration(seconds: 10), () {
        setState(() {
          _isBoolean = false;
        });
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ModalProgressHUD(
        inAsyncCall: _isBoolean,
        opacity: 0.6,
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                MyTextFormFieldWidget(
                  controller: _passwordController,
                  label: "Password",
                  hintText: "Enter Password",
                  obscureText: _passwordObscureText,
                  onIconTap: () {
                    setState(() {
                      _passwordObscureText = !_passwordObscureText;
                    });
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return ("enter a valid password");
                    } else if (value != "6chimalane") {
                      return("Password incorrect");
                    }
                  },
                ),
                SizedBox(
                  height: 10.h,
                ),
                MyCustomButton(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.deepOrange,
                  title: "Login",
                  onPressed: () {
                    signInUser(_passwordController.text);
                  },
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                  child: const Text("OR"),
                ),
                MyCustomButton(
                  foregroundColor: Colors.deepOrange,
                  backgroundColor: Colors.transparent,
                  title: "Create Account",
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return const CreateWalletScreen();
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// the upper container of the page that has the
//  Orange color background......
class UpperContainer extends StatefulWidget {
  const UpperContainer({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  State<UpperContainer> createState() => _UpperContainerState();
}

class _UpperContainerState extends State<UpperContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height / 2.5,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      color: Colors.deepOrange,
      alignment: Alignment.bottomLeft,
      child: Text(
        "Welcome Back \nSamuel",
        style:
            TextStyle(color: Colors.white, fontSize: 30.sp, letterSpacing: 1.2),
      ),
    );
  }
}
