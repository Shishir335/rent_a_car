import 'package:flutter/material.dart';
import 'package:rent_a_car/utils/colors.dart';

class FullButton extends StatelessWidget {
  final String name;
  final bool enabled;
  final void Function()? onTap;
  final double height;
  final double topPadding;
  final double bottomPadding;
  final double leftPadding;
  final double rightPadding;
  final Color? color;
  final Widget? rightChild;

  const FullButton({
    required this.name,
    this.onTap,
    this.enabled = true,
    this.height = 50,
    this.rightChild,
    this.topPadding = 10,
    this.bottomPadding = 10,
    this.leftPadding = 20,
    this.rightPadding = 20,
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        margin: EdgeInsets.fromLTRB(
          leftPadding,
          topPadding,
          rightPadding,
          bottomPadding,
        ),
        decoration: BoxDecoration(
          color: color ?? AppColors.primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Center(
                child: Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            if (rightChild != null) Positioned(right: 20, child: rightChild!),
          ],
        ),
      ),
    );
  }
}
