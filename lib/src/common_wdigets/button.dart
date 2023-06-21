import "package:flutter/material.dart";
import "package:kuunganatask/src/styles.dart";

class Button extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  const Button({super.key, required this.child, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: AppStyles.primary,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16))),
                minimumSize: const Size(double.infinity, 48)),
            onPressed: onPressed,
            child: child));
  }
}
