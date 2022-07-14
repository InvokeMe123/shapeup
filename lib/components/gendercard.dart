import 'package:flutter/material.dart';

class GenderCard extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const GenderCard(
      {required this.cardChild, required this.cardBorder}); //remove required
  final Widget cardChild;
  final double cardBorder;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(
            width: cardBorder, color: const Color.fromARGB(255, 15, 155, 155)),
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 15, right: 15, top: 25, bottom: 25),
        child: cardChild,
      ),
    );
  }
}
