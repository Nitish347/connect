import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  bool isPass;
  final hintText;
  final TextInputType textInputType;
  TextFieldInput(
      {required this.textInputType,
      required this.textEditingController,
      this.hintText,
      this.isPass = false});

  @override
  Widget build(BuildContext context) {
    final inputBorder =
        OutlineInputBorder(borderSide: Divider.createBorderSide(context));
    return TextField(
      style: TextStyle(color: Colors.black),
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey.shade500),
        border: inputBorder,
        focusedBorder: inputBorder,
        enabledBorder: inputBorder,
        fillColor: Colors.grey.shade200,
        filled: true,
        contentPadding: EdgeInsets.all(8),
      ),
      keyboardType: textInputType,
      obscureText: isPass,
    );
  }
}
