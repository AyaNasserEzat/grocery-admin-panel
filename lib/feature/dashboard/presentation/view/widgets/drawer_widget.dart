import 'package:admin_panel_grocery_app/feature/dashboard/presentation/view/home_view.dart';
import 'package:admin_panel_grocery_app/feature/dashboard/presentation/view/widgets/ListTileDrawer.dart';
import 'package:admin_panel_grocery_app/feature/order/presentation/view/all_order_view.dart';
import 'package:admin_panel_grocery_app/feature/product/presentation/cubit/proudect_cubit.dart';
import 'package:admin_panel_grocery_app/feature/product/presentation/view/all_proudect_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xff00784a),
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset(
              "assets/images/logoo.jpeg",
              width: 200,
              height: 200,
            ),
          ),
          DrawerListTile(
            title: "Main",
            press: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const MainScreen(),
                ),
              );
               BlocProvider.of<ProductCubit>(context).getProduct();
            },
            icon: Icons.home_filled,
          ),
          DrawerListTile(
            title: "View all products",
            press: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AllProudectView()));
            },
            icon: Icons.store,
          ),
          DrawerListTile(
            title: "View all orders",
            press: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AllOrderView()));
            },
            icon: Icons.badge_sharp,
          ),
        ],
      ),
    );
  }
}
