import 'package:admin_panel_grocery_app/core/theme/app_color.dart';
import 'package:admin_panel_grocery_app/feature/dashboard/presentation/view/widgets/add_product_btn.dart';
import 'package:admin_panel_grocery_app/feature/dashboard/presentation/view/widgets/container_widget.dart';
import 'package:admin_panel_grocery_app/feature/dashboard/presentation/view/widgets/drawer_widget.dart';
import 'package:admin_panel_grocery_app/feature/dashboard/presentation/view/widgets/header.dart';
import 'package:admin_panel_grocery_app/feature/order/presentation/view_model/order_cubit.dart';
import 'package:admin_panel_grocery_app/feature/order/presentation/view_model/order_tate.dart';
import 'package:admin_panel_grocery_app/feature/product/presentation/cubit/proudect_cubit.dart';
import 'package:admin_panel_grocery_app/feature/product/presentation/cubit/proudect_state.dart';
import 'package:admin_panel_grocery_app/feature/product/presentation/view/all_proudect_view.dart';
import 'package:admin_panel_grocery_app/feature/product/presentation/view/widgets/custom_data_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideMenu(),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Header(
              title: 'Dashboard',
              widget: Container(),
            ),
            const SizedBox(
              height: 5,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: AddProductBtn(),
            ),
            Row(
              children: [
                BlocBuilder<ProductCubit, ProductState>(
                    builder: (context, state) {
                  ProductCubit productCubit =
                      BlocProvider.of<ProductCubit>(context);
                  return ContainerWidget(
                    text: 'total products',
                    textLength: productCubit.productList.length.toString(),
                    iconData: Icons.format_list_numbered,
                  );
                }),
                BlocBuilder<OrderCubit, OrderState>(builder: (context, state) {
                  OrderCubit orderCubit = BlocProvider.of<OrderCubit>(context);
                  return ContainerWidget(
                    text: 'total orders',
                    textLength: orderCubit.orderList.length.toString(),
                    iconData: Icons.shopping_cart,
                  );
                }),
                BlocBuilder<OrderCubit, OrderState>(builder: (context, state) {
                  OrderCubit orderCubit = BlocProvider.of<OrderCubit>(context);
                  return ContainerWidget(
                    text: 'earning',
                    textLength: orderCubit.getTotalEarns().toStringAsFixed(1),
                   iconData: Icons.attach_money,
                  );
                })
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Text(
                  ' Latest Products',
                  style: TextStyle(fontSize: 25, color: AppColor.green),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AllProudectView()));
                  },
                child:const Row(
                  children: [
                    Text('View All  ',style: TextStyle(color:AppColor.white),),
                    Icon(Icons.store,color: AppColor.white,size: 20,),
                  ],
                ) ,
      
                ),
              ],
            ),
            BlocBuilder<ProductCubit, ProductState>(builder: (context, state) {
              ProductCubit productCubit =
                  BlocProvider.of<ProductCubit>(context);
              return DataTableCustom(
                  productModdelList: productCubit.productList.take(6).toList());
            })
          ],
        ),
      )),
    );
  }
}
