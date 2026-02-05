import 'dart:async';
import 'package:flutter/material.dart';

dynamic onValue(val) {}

class CustomNavigator {
  static push({
    required BuildContext context,
    required Widget screen,
    FutureOr<dynamic> Function(dynamic) onCallback = onValue,
    Duration duration = const Duration(milliseconds: 500),
  }) {
    Navigator.push(
      context,
      _createRoute(screen, duration),
    ).then(onCallback);
  }

  static pushReplacement({
    required BuildContext context,
    required Widget screen,
    FutureOr<dynamic> Function(dynamic) onCallback = onValue,
    Duration duration = const Duration(milliseconds: 500),
  }) {
    Navigator.pushReplacement(
      context,
      _createRoute(screen, duration),
    ).then(onCallback);
  }

  static pushAndRemoveUntil({
    required BuildContext context,
    required Widget screen,
    Duration duration = const Duration(milliseconds: 500),
  }) {
    Navigator.pushAndRemoveUntil(
      context,
      _createRoute(screen, duration),
          (route) => false,
    );
  }

  static pop({required BuildContext context}) {
    Navigator.of(context).pop();
  }

  static PageRouteBuilder _createRoute(Widget screen, Duration duration) {
    return PageRouteBuilder(
      transitionDuration: duration,
      pageBuilder: (context, animation, secondaryAnimation) => screen,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0); // Slide from right
        const end = Offset.zero;
        final tween = Tween(begin: begin, end: end).chain(
          CurveTween(curve: Curves.easeInOut),
        );
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  // Default empty callback
  static dynamic onValue(dynamic value) => value;
}

enum NavigationType { forgotPassword, signup, signIn }

