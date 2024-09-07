import 'package:admin_panel_grocery_app/core/widgets/custom_loading.dart';
import 'package:admin_panel_grocery_app/feature/order/presentation/view/widgets/data_table_order_widegets.dart';
import 'package:admin_panel_grocery_app/feature/order/presentation/view_model/order_cubit.dart';
import 'package:admin_panel_grocery_app/feature/order/presentation/view_model/order_tate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderBlocConsumer extends StatelessWidget {
  const OrderBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderCubit, OrderState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is LoadingGetOrderState) {
            return const CustomLoading();
          } else if (state is SuccessGetOrderState) {
            return const DataTableOrderWidegets();
          } else {
            return const Text('error accoure');
          }
        });
  }
}
