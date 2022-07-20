import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final Widget icon;
  final Size size;

  const CustomOutlinedButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      required this.icon,
      required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      height: size.height,
      child: OutlinedButton.icon(
        onPressed: onPressed,
        icon: SizedBox(
          width: 27,
          child: icon,
        ),
        label: Text(
          text,
          style: Theme.of(context).textTheme.caption?.copyWith(
              fontSize: 15.0, fontWeight: FontWeight.w200, color: Colors.black),
        ),
      ),
    );
  }
}
