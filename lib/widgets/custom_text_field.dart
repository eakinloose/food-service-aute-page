import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final double fontSize;
  final FontWeight fontWeight;
  final Function(String val) onChanged;

  const CustomTextField(
      {Key? key,
      required this.hint,
      required this.fontSize,
      required this.fontWeight,
      required this.onChanged})
      : super(key: key);

  final _border = const OutlineInputBorder(
    borderRadius: BorderRadius.zero,
    borderSide: BorderSide(
      color: Colors.black,
      width: 1.5,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.secondary,
            blurRadius: 0,
            offset: const Offset(3, 3),
          ),
        ],
      ),
      child: TextField(
        onChanged: onChanged,
        cursorColor: Colors.black,
        style: Theme.of(context).textTheme.overline?.copyWith(
              color: Colors.black,
              fontWeight: fontWeight,
              fontSize: fontSize,
            ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(10.0),
          hintText: hint,
          hintStyle: TextStyle(
            color: Colors.black,
            fontSize: fontSize,
          ),
          enabledBorder: _border,
          border: _border,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.secondary,
              width: 2.0,
            ),
          ),
        ),
      ),
    );
  }
}
