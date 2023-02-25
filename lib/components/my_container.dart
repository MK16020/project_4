import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  const MyContainer({super.key, required this.widget});
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        border: Border.fromBorderSide(
          BorderSide(color: Colors.black12, width: 0.5),
        ),
      ),
      child: widget,
    );
  }
}
