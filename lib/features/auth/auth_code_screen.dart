import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:the_basics/home/home_screen.dart';

import '../../core/common/custom_button.dart';

class AuthCodeScreen extends StatefulWidget {
  final String verID;
  const AuthCodeScreen({super.key, required this.verID});

  @override
  State<AuthCodeScreen> createState() => _AuthCodeScreen(verID);
}

class _AuthCodeScreen extends State<AuthCodeScreen> {
  final String verID;
  // String otpPin = "dddd";

  _AuthCodeScreen(this.verID);
  Future<void> verifyOTP() async{
    await FirebaseAuth.instance.signInWithCredential(
      PhoneAuthProvider.credential(
          verificationId: verID,
          smsCode: phoneController.text
      )
    ).whenComplete(() {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomeScreen(),)
      );
    });
  }
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/svg/pho3.png"),
            const SizedBox(height: 14,),
            const Text("Phone Number Verification",style: TextStyle(fontSize: 32),),
            const Text("Verification code has been sent to 0524061177",style: TextStyle(fontSize: 14),),
            const SizedBox(height: 30,),
            const SizedBox(
              width: 310,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '',
                  isDense: true,                      // Added this
                  contentPadding: EdgeInsets.all(8),  // Added this
                ),
              ),
            ),
            const SizedBox(height: 10,),
            SizedBox(
                width: 310,
                child: CustomButton(text: "Login", onTap: (){
                  verifyOTP();
                },color: Colors.green,)
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                const Text("Didn't receive ?"),
                GestureDetector(
                    onTap: (){},
                    child: const Text("Send again",style: TextStyle(color: Colors.blue),)
                ),
              ],
            ),

            // Sizedbox(
            //   child: CustomTextField(controller: phoneController
            // )),
          ],
        )
    );
  }
}