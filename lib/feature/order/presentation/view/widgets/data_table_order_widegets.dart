import 'package:admin_panel_grocery_app/core/theme/app_color.dart';
import 'package:admin_panel_grocery_app/feature/order/presentation/view_model/order_cubit.dart';
import 'package:admin_panel_grocery_app/feature/product/data/models/product_model.dart';
import 'package:admin_panel_grocery_app/feature/product/presentation/cubit/proudect_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataTableOrderWidegets extends StatelessWidget {
  const DataTableOrderWidegets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: DataTable(
            columnSpacing: 20,
            headingRowColor: const WidgetStatePropertyAll(AppColor.green),
            headingTextStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: (MediaQuery.of(context).size.width < 650) ? 6 : 18,
            ),
            columns: const [
              DataColumn(
                label: Text('image'),
              ),
              DataColumn(
                label: Text('by'),
              ),
              DataColumn(
                label: Text('product name'),
              ),
              DataColumn(
                label: Text('quantity'),
              ),
              DataColumn(
                label: Text('paid'),
              ),
              DataColumn(
                label: Text('date'),
              ),
            ],
            rows: BlocProvider.of<OrderCubit>(context)
                .orderList
                .map((order)
                // =>
                        {
                         var orderDate = order.orderDate.toDate();
                        String orderDateToShow =
                            '${orderDate.day}/${orderDate.month}/${orderDate.year}';
                        final ProductModdel getProduct =
                            BlocProvider.of<ProductCubit>(context)
                                .findProdById(order.productId);
                          return
                        DataRow(
                          cells: [
                            DataCell(
                              Image.network(
                                order.imageUrl,
                                width: 50,
                                height: 50,
                              ),
                            ),
                            DataCell(
                              Text(order.userName),
                            ),
                              DataCell(
                                Text(getProduct.title),
                              ),
                              DataCell(
                                Text(order.quantity.toString()),
                              ),
                              DataCell(
                                Text((order.quantity * order.price).toStringAsFixed(2)),
                              ),
                              DataCell(
                                Text(orderDateToShow),
                              ),
                          ],
                        );

                    },
                    )
                .toList(),
          ),
        ),
      ),
    );
  }
}
