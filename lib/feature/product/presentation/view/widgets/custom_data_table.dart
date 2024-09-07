import 'package:admin_panel_grocery_app/core/theme/app_color.dart';
import 'package:admin_panel_grocery_app/feature/product/data/models/product_model.dart';
import 'package:admin_panel_grocery_app/feature/product/presentation/cubit/proudect_cubit.dart';
import 'package:admin_panel_grocery_app/feature/product/presentation/view/edit_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataTableCustom extends StatelessWidget {
  const DataTableCustom({
    super.key,
    required this.productModdelList,
  });

  final List<ProductModdel> productModdelList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
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
                label: Text('name'),
              ),
              DataColumn(
                label: Text('category'),
              ),
              DataColumn(
                label: Text('price'),
              ),
              DataColumn(
                label: Text('sale price'),
              ),
              DataColumn(
                label: Text('Edit'),
              ),
              DataColumn(
                label: Text('delet'),
              ),
            ],
            rows: productModdelList
                .map(
                  (product) => DataRow(
                    cells: [
                      DataCell(
                        Image.network(
                          product.imageUrl,
                          width: 50,
                          height: 50,
                        ),
                      ),
                      DataCell(
                        Text(product.title),
                      ),
                      DataCell(
                        Text(product.category),
                      ),
                      DataCell(
                        Text(product.price.toString()),
                      ),
                      DataCell(
                        Text(product.salePrice!.toStringAsFixed(1)),
                      ),
                      DataCell(
                        IconButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return EditProductView(
                                productModdel: product,
                              );
                            }));
                          },
                          icon: const Icon(
                            Icons.edit,
                            color: AppColor.green,
                          ),
                        ),
                      ),
                      DataCell(
                        IconButton(
                          onPressed: () {
                            BlocProvider.of<ProductCubit>(context)
                                .deletProudect(product.id);
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: AppColor.green,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
                .toList()),
      ),
    );
  }
}
