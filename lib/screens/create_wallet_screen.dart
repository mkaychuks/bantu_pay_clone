import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/screens/otp_screen.dart';
import 'package:myapp/widgets/custom_button.dart';
import 'package:myapp/widgets/textform_widget.dart';

class CreateWalletScreen extends StatelessWidget {
  const CreateWalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(elevation: 0),
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
  bool _confirmPasswordObscureText = true;
  bool? _checkBoxState = false;
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  void dispose() {
    super.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
                    return "enter a valid password";
                  }
                },
              ),
              MyTextFormFieldWidget(
                controller: _confirmPasswordController,
                label: "Confirm Password",
                hintText: "Re-enter Password",
                obscureText: _confirmPasswordObscureText,
                onIconTap: () {
                  setState(() {
                    _confirmPasswordObscureText = !_confirmPasswordObscureText;
                  });
                },
                validator: (value) {
                  if (value!.isNotEmpty && value != _passwordController.text) {
                    return ("passwords do not match");
                  }
                },
              ),
              CheckboxListTile(
                value: _checkBoxState,
                onChanged: (value) {
                  setState(() {
                    _checkBoxState = value;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
                title: RichText(
                  text: TextSpan(
                    text: "I have read and agreed to",
                    style: TextStyle(color: Colors.black, fontSize: 12.sp),
                    children: [
                      TextSpan(
                        text: " BantuPay's Terms and Conditions",
                        style: TextStyle(
                            fontSize: 12.sp, color: Colors.deepOrangeAccent),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              MyCustomButton(
                foregroundColor: Colors.white,
                backgroundColor: Colors.deepOrange,
                title: "Submit",
                onPressed: () {
                  if (_checkBoxState!) {
                    if (formKey.currentState!.validate()) {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const OTPScreen(),
                        ),
                      );
                    }
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

// the upper container of the page that has the
//  Orange color background......
class UpperContainer extends StatelessWidget {
  const UpperContainer({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height / 3,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      color: Colors.deepOrange,
      alignment: Alignment.bottomLeft,
      child: Text(
        "Create Wallet",
        style:
            TextStyle(color: Colors.white, fontSize: 30.sp, letterSpacing: 1.2),
      ),
    );
  }
}
