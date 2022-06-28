import 'package:flutter/material.dart';
import 'package:signin_signup/core/core_shelf.dart';

class Base extends StatelessWidget {
  const Base({

    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: child,
      ),
    );
  }
}
