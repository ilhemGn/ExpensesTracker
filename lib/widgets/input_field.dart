import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.labelText,
    this.keyboardType,
    this.prefixText,
  });

  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final TextInputType? keyboardType;
  final String? prefixText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType ?? TextInputType.text,
      decoration: InputDecoration(
        prefixText: prefixText ?? '',
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: const Color.fromARGB(255, 239, 239, 239),
        hintText: hintText,
        hintStyle: const TextStyle(
            color: Color.fromARGB(255, 191, 191, 191),
            fontSize: 16,
            fontWeight: FontWeight.w400),
        label: Text(
          labelText,
          style: const TextStyle(
              color: Colors.black54, fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
