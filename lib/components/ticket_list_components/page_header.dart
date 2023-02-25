import 'package:flutter/material.dart';

class PageHeader extends StatelessWidget {
  const PageHeader({
    required this.path,
    required this.isActive,
    required this.icon,
    super.key,
    required this.page,
  });
  final String path;
  final bool isActive;
  final IconData icon;
  final Widget page;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        Text('\t$path'),
        const Spacer(),
        if (isActive)
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Color(0xffebeffe),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Row(
              children: const [
                Icon(
                  Icons.history,
                  color: Color(0xff0000ff),
                ),
                SizedBox(width: 10),
                Text(
                  'Export History',
                  style: TextStyle(color: Color(0xff0000ff)),
                ),
              ],
            ),
          ),
        const SizedBox(width: 10),
        if (isActive)
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Color(0xffebeffe),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Row(
              children: const [
                Icon(
                  Icons.upload_file,
                  color: Color(0xff0000ff),
                ),
                SizedBox(width: 10),
                Text(
                  'Export',
                  style: TextStyle(color: Color(0xff0000ff)),
                ),
              ],
            ),
          ),
        const SizedBox(width: 10),
        InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => page));
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Color(0xff0000ff),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Row(
              children: const [
                Icon(
                  Icons.add,
                  color: Color(0xffebeffe),
                ),
                SizedBox(width: 10),
                Text(
                  'Add New',
                  style: TextStyle(color: Color(0xffebeffe)),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
