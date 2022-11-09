import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:the_basics/core/common/custom_button.dart';
import 'package:the_basics/core/common/custom_text_field.dart';
import 'package:the_basics/core/constants/global_variables.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SvgPicture.asset("assets/images/svg/pho.svg"),
          const SizedBox(height: 5,),
          const Text("Enter phone number",style: TextStyle(fontSize: 32),),
          const Text("Phone Number",style: TextStyle(fontSize: 14),),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("I agree to the "),
              GestureDetector(
                onTap: (){},
                child: const Text("Terms of Use",style: TextStyle(color: Colors.blue),)
                ),
              const Text(" and "),
              GestureDetector(
                onTap: (){},
                child: const Text("Privacy Policy",style: TextStyle(color: Colors.blue),)
                ),
            ],
          ),
          const SizedBox(height: 10,),
          SizedBox(
            width: 310,
            child: CustomButton(text: "Connect", onTap: (){},color: Colors.green,)
          ),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              const Text("Does your institute register?"),
              GestureDetector(
                onTap: (){},
                child: const Text("Contact us",style: TextStyle(color: Colors.blue),)
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