import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  Color? color;
  CustomButton({Key? key, required this.text, required this.onTap,this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          // boxShadow: [
          //   BoxShadow(
          //     color: Color.fromRGBO(19, 9, 49, 0.12),
          //     spreadRadius: 4,
          //     blurRadius: 16,
          //     offset: Offset(0, 0),
          //   ),
          //   BoxShadow(
          //     color: Color.fromRGBO(19, 9, 49, 0.04),
          //     spreadRadius: 4,
          //     blurRadius: 16,
          //     offset: Offset(0, 0),
          //   ),
          // ]

      ),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          minimumSize: const Size(double.infinity,56),
          // shape: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.circular(16.0), // <-- Radius
          // ),
        ),
        child: Text(text,style: const TextStyle(color: Colors.black),),
      ),
    );
  }
}
