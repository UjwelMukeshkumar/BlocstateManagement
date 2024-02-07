import 'package:flutter/material.dart';

class Quotewidget extends StatelessWidget {
  final String Quote;
  const Quotewidget({super.key, required this.Quote});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 20,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.blueGrey),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Center(
            child: Text(
              '$Quote',
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
