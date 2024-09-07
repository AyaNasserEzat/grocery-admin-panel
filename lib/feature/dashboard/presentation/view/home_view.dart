import 'package:admin_panel_grocery_app/core/helpers/responsive.dart';
import 'package:admin_panel_grocery_app/feature/dashboard/presentation/view/dashboard_view.dart';
import 'package:admin_panel_grocery_app/feature/dashboard/presentation/view/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
             const Expanded(
        
              flex: 5,
              child: DashboardView(),
            ),
          ],
        ),
      ),
    );
  }
}