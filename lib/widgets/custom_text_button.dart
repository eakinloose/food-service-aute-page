import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final Size size;

  const CustomTextButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        primary: Colors.black,
      ),
      child: Container(
        width: size.width,
        height: size.height,
        alignment: Alignment.center,
        child: Text(
          text,
          style: Theme.of(context).textTheme.button?.copyWith(
                fontSize: 15.0,
                color: Colors.white,
              ),
        ),
      ),
    );
  }
}
