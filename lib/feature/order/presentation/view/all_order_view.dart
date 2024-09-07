import 'package:admin_panel_grocery_app/core/helpers/responsive.dart';
import 'package:admin_panel_grocery_app/feature/dashboard/presentation/view/widgets/drawer_widget.dart';
import 'package:admin_panel_grocery_app/feature/dashboard/presentation/view/widgets/header.dart';
import 'package:admin_panel_grocery_app/feature/order/presentation/view/widgets/order_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AllOrderView extends StatelessWidget {
  const AllOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: const SideMenu(),
      body: SafeArea(
          child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (Responsive.isDesktop(context))
            const Expanded(
              child: SideMenu(),
            ),
           Expanded(
            flex: 5,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Header(
                    title: 'All order', widget: Container(),
                  ),
                 const OrderBlocConsumer(),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
