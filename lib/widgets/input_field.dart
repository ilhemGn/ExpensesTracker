import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    required this.hintText,
    required this.labelText,
    this.keyboardType,
    this.prefixText,
    required this.validator,
    required this.onSave,
  });

  final String hintText;
  final String labelText;
  final TextInputType? keyboardType;
  final String? prefixText;
  final String? Function(String?)? validator;
  final Function(String?)? onSave;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType ?? TextInputType.text,
      decoration: InputDecoration(
        prefixText: prefixText ?? '',
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide.none,
        ),
        filled: true,
        hintText: hintText,
        hintStyle: const TextStyle(
            color: Color.fromARGB(255, 221, 220, 220),
            fontSize: 16,
            fontWeight: FontWeight.w400),
        label: Text(
          labelText,
          style: const TextStyle(
              color: Colors.black54, fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
      validator: validator,
      onSaved: onSave,
    );
  }
}
