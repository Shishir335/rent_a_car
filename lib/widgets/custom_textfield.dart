import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? title;
  final String? hint;
  final Color? titleColor;
  final Color? fillColor;
  final bool obscureText;
  final bool hasBorder;
  final int maxLines;
  final Widget? suffixIcon;

  const CustomTextField({
    super.key,
    required this.controller,
    this.title,
    this.hint,
    this.titleColor,
    this.fillColor = Colors.white,
    this.validator,
    this.hasBorder = false,
    this.obscureText = false,
    this.maxLines = 1,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Text(
            title!,
            style: TextStyle(color: titleColor ?? Colors.white, fontSize: 13),
          ),
        SizedBox(height: 5),
        TextFormField(
          controller: controller,
          validator: validator,
          scrollPadding: EdgeInsets.zero,
          obscureText: obscureText,
          maxLines: maxLines,
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            hintText: hint,
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 12),
            fillColor: fillColor,
            filled: true,
            border: hasBorder ? blackBorder : border,
            focusedBorder: hasBorder ? blackBorder : border,
            enabledBorder: hasBorder ? blackBorder : border,
            disabledBorder: hasBorder ? blackBorder : border,
          ),
        ),
      ],
    );
  }
}

InputBorder? border = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
  borderSide: BorderSide.none,
);

InputBorder? blackBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
  borderSide: BorderSide(color: Colors.black54),
);
