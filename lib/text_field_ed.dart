import 'package:flutter/material.dart';

class TextFieldEd extends StatefulWidget {
  final String lableText;
  final TextEditingController controller;
  const TextFieldEd(
      {super.key, required this.lableText, required this.controller});

  @override
  State<TextFieldEd> createState() => _TextFieldEdState();
}

class _TextFieldEdState extends State<TextFieldEd> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        setState(() {
          widget.controller.text = value;
        });
      },
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        label: Text(widget.lableText),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        counterText: '',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Color.fromRGBO(80, 80, 80, 1)),
        ),
      ),
    );
  }
}
