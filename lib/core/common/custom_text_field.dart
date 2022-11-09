import 'package:flutter/material.dart';
import 'package:the_basics/core/constants/global_variables.dart';

// ignore: must_be_immutable
class CustomTextField extends StatefulWidget {
   TextEditingController controller;
   CustomTextField({Key? key,required this.controller}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: false,
      controller: widget.controller,
      decoration: const InputDecoration(  
        alignLabelWithHint: false,
        focusedBorder: OutlineInputBorder(
            borderSide:    BorderSide(color: GlobalVariables.redColor, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(16.0))
        ),
        enabledBorder: OutlineInputBorder(
            borderSide:    BorderSide(color: GlobalVariables.greyFocusTextField, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(16.0))
        ),
        filled: true,
        fillColor: GlobalVariables.whiteColor,
        border: OutlineInputBorder(
          borderSide:  BorderSide(color: GlobalVariables.whiteColor, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
        ),
      ),
    );
  }
}