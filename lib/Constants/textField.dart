import "package:flutter/material.dart";

class TextFieldContainer extends StatelessWidget {

  final String text;
  final TextEditingController controller;
  const TextFieldContainer({Key? key,
    required this.text,
    required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlignVertical:  TextAlignVertical.center,
      controller: controller,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.blue, width: 3)
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.transparent, width: 0)
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        filled: true,
        fillColor:  const Color(0xffF5F6FA),
          hintText: text,
          hintStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14
        )
      )
    );
  }
}
