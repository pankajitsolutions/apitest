import 'package:apitest/services/auth_service.dart';
import 'package:apitest/view/home_screen.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
//reg_id,p_name,email,mobile,alternet_no,refercode
  final TextEditingController regIdController = TextEditingController();
  final TextEditingController pNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController altMobileController = TextEditingController();
  final TextEditingController refController = TextEditingController();

  @override
  Widget build(BuildContext context) {


    ApiServices _authService = ApiServices();


    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(11),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextWidget(
                regIdController: regIdController,
                hintText: 'Reg No.',
              ),
              CustomTextWidget(
                regIdController: pNameController,
                hintText: 'p Name',
              ),
              CustomTextWidget(
                regIdController: emailController,
                hintText: 'Email .',
              ),
              CustomTextWidget(
                regIdController: mobileController,
                hintText: 'Mobile No.',
              ),
              CustomTextWidget(
                regIdController: altMobileController,
                hintText: 'Alt Mobile No.',
              ),
              CustomTextWidget(
                regIdController: refController,
                hintText: 'Referral No.',
              ),
              SizedBox(height: height(context) * 0.1),
              ElevatedButton(
                  onPressed: () {
                    // sign up method
                    if(regIdController.text.trim().isNotEmpty){
                      _authService.signUpUser({
                        "reg_id":regIdController.text.trim(),
                        "p_name":pNameController.text.trim(),
                        "email":emailController.text.trim(),
                        "mobile":mobileController.text.trim(),
                        "alternet_no":altMobileController.text.trim(),
                        "refercode":refController.text.trim()
                      }).then((value) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("User Created Successfully")));
                      });
                    }
                  },
                  child: Text("Sign Up")),
              SizedBox(height: height(context) * 0.1),
              ElevatedButton(
                  onPressed: () {
                   // go to home screen
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                  },
                  child: Text("Go to home")),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget({
    Key? key,
    required this.regIdController,
    required this.hintText,
  }) : super(key: key);

  final TextEditingController regIdController;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: regIdController,
      decoration: InputDecoration(hintText: hintText),
    );
  }
}
