import 'package:flutter/material.dart';

class CustomBUtton extends StatefulWidget {
  final VoidCallback OnClicked;
  double? height;
  double? width;
  Color color;
  Widget text;
  CustomBUtton(
      {super.key,
      required this.color,
      required this.text,
      this.width,
      this.height,
      required this.OnClicked});

  @override
  State<CustomBUtton> createState() => _CustomBUttonState();
}

class _CustomBUttonState extends State<CustomBUtton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.OnClicked,
      child: Container(
        child: widget.text,
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
            color: widget.color, borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
