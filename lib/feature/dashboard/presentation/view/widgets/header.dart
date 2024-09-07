import 'package:admin_panel_grocery_app/core/helpers/responsive.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.title,
    required this.widget,
  });
  final String title;

  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (Responsive.isMobile(context))
          IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(Icons.menu),
          ),
        if (Responsive.isDesktop(context))
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 25,
                color: Color(0xff00784a),
              ),
            ),
          ),
        if (Responsive.isDesktop(context))
          Spacer(
            flex: Responsive.isDesktop(context) ? 2 : 1,
          ),
        Container(
          child: widget,
        )
      ],
    );
  }
}
