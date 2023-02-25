import 'package:flutter/material.dart';

class FormSection extends StatelessWidget {
  FormSection({
    super.key,
    required this.width,
    required this.name,
    this.lines,
    this.isSecure,
    this.formIcon,
    required this.inputController,
  });
  final String name;
  final double width;
  int? lines = 1;
  bool? isSecure = true;
  Icon? formIcon;
  final TextEditingController inputController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(name),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: const BoxDecoration(
              color: Color(0xffE3E6E7),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            width: width,
            margin: const EdgeInsets.only(top: 10, bottom: 28),
            child: TextFormField(
                controller: inputController,
                decoration: formIcon == null
                    ? const InputDecoration(border: InputBorder.none)
                    : InputDecoration(icon: formIcon, border: InputBorder.none),
                obscureText: isSecure == null ? false : true,
                maxLines: lines,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter $name';
                  }
                  return null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction),
          ),
        ),
      ],
    );
  }
}
