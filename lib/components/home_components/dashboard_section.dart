import 'package:flutter/material.dart';

class DashboardSection extends StatelessWidget {
  const DashboardSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          border: Border.fromBorderSide(
            BorderSide(color: Colors.black12, width: 0.3),
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Color(0xffebeffe),
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: const [
                  Icon(
                    Icons.person_add,
                    color: Color(0xff0000ff),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [Text('Total'), Text('0')],
            ),
          ],
        ),
      ),
    );
  }
}
