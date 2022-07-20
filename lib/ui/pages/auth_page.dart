import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../widgets/custom_outlined_button.dart';
import '../../widgets/custom_text_button.dart';
import '../../widgets/custom_text_field.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: _buildLogo(),
            ),
            const SizedBox(
              height: 30.0,
            ),
            _buildUI(),
          ],
        ),
      ),
    );
  }

  _buildLogo() => Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          SvgPicture.asset(
            'assets/logo.svg',
            fit: BoxFit.fill,
            height: 100,
          ),
          const SizedBox(
            height: 10.0,
          ),
          RichText(
            text: TextSpan(
                text: 'Food',
                style: Theme.of(context).textTheme.caption?.copyWith(
                      color: Colors.black,
                      fontSize: 27.0,
                      fontWeight: FontWeight.bold,
                    ),
                children: [
                  TextSpan(
                      text: ' Space',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                      ))
                ]),
          )
        ],
      ));

  _buildUI() => Expanded(
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _controller,
          children: [_signIn(), _signUp()],
        ),
      );

  _signIn() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            ..._emailAndPassword(),
            const SizedBox(
              height: 20.0,
            ),
            CustomTextButton(
              text: 'Sign In',
              size: const Size(double.infinity, 40),
              onPressed: () {},
            ),
            const SizedBox(
              height: 20.0,
            ),
            CustomOutlinedButton(
              text: 'Sign in with Google',
              size: const Size(double.infinity, 50),
              onPressed: () {},
              icon: SvgPicture.asset('assets/google.svg'),
            ),
            const SizedBox(
              height: 30.0,
            ),
            RichText(
              text: TextSpan(
                text: 'Don\'t have an account?',
                style: Theme.of(context).textTheme.caption?.copyWith(
                      color: Colors.black,
                      fontSize: 15.0,
                      fontWeight: FontWeight.normal,
                    ),
                children: [
                  TextSpan(
                    text: ' Sign up',
                    style: Theme.of(context).textTheme.caption?.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        _controller.nextPage(
                            duration: const Duration(milliseconds: 1000),
                            curve: Curves.elasticOut);
                      },
                  )
                ],
              ),
            )
          ],
        ),
      );

  _signUp() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            CustomTextField(
              hint: 'Firstname Lastname',
              fontSize: 15.0,
              fontWeight: FontWeight.normal,
              onChanged: (val) {},
            ),
            const SizedBox(
              height: 20.0,
            ),
            CustomTextField(
              hint: 'Username',
              fontSize: 15.0,
              fontWeight: FontWeight.normal,
              onChanged: (val) {},
            ),
            const SizedBox(
              height: 20.0,
            ),
            ..._emailAndPassword(),
            const SizedBox(
              height: 20.0,
            ),
            CustomTextButton(
              text: 'Sign Up',
              size: const Size(double.infinity, 40),
              onPressed: () {},
            ),
            const SizedBox(
              height: 30.0,
            ),
            RichText(
              text: TextSpan(
                text: 'Already have an account?',
                style: Theme.of(context).textTheme.caption?.copyWith(
                      color: Colors.black,
                      fontSize: 15.0,
                      fontWeight: FontWeight.normal,
                    ),
                children: [
                  TextSpan(
                    text: ' Sign in',
                    style: Theme.of(context).textTheme.caption?.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        _controller.previousPage(
                            duration: const Duration(milliseconds: 1000),
                            curve: Curves.elasticOut);
                      },
                  )
                ],
              ),
            )
          ],
        ),
      );

  List<Widget> _emailAndPassword() => [
        CustomTextField(
          hint: 'Email',
          fontSize: 15.0,
          fontWeight: FontWeight.normal,
          onChanged: (val) {},
        ),
        const SizedBox(height: 20),
        CustomTextField(
          hint: 'Password',
          fontSize: 15.0,
          fontWeight: FontWeight.normal,
          onChanged: (val) {},
        ),
      ];
}
