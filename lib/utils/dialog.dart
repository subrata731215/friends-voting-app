import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Future<void> voteDoneDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.brown,
        icon: Lottie.asset('images/lottie/done.json',
            height: 100, width: 100),
        title: const Text(
          'Your Vote has been counted, Please leave the Voting Area',
          style: TextStyle(color: Colors.white),
        ),
      ));
}

