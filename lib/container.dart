import 'package:flutter/material.dart';

class BMIContainer extends StatefulWidget {
  final Widget? child;
  final Color color;
  final VoidCallback? onTap;

  const BMIContainer({Key? key, this.child, required this.color, this.onTap})
      : super(key: key);

  @override
  State<BMIContainer> createState() => _BMIContainerState();
}

class _BMIContainerState extends State<BMIContainer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
          margin: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: widget.color,
          ),
          child: widget.child),
    );
  }
}
