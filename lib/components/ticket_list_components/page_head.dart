import 'package:flutter/material.dart';

import '../my_container.dart';

class PageHead extends StatelessWidget {
  const PageHead({
    super.key,
    required this.name,
  });
  final String name;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(flex: 2, child: MyContainer(widget: Text(name))),
        const Expanded(
          flex: 6,
          child: MyContainer(
            widget: SizedBox(
              height: 16,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'search ',
                  suffixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ),
        const Expanded(
          flex: 1,
          child: MyContainer(
            widget: Icon(
              Icons.refresh,
              size: 16,
              color: Colors.grey,
            ),
          ),
        ),
        const Expanded(
          flex: 1,
          child: MyContainer(
            widget: Icon(
              Icons.filter_list_alt,
              size: 16,
              color: Colors.grey,
            ),
          ),
        ),
        const Expanded(
          flex: 1,
          child: MyContainer(
            widget: Icon(
              Icons.settings,
              size: 16,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
