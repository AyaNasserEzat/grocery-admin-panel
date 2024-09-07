import 'package:admin_panel_grocery_app/core/helpers/commens.dart';
import 'package:admin_panel_grocery_app/core/helpers/responsive.dart';
import 'package:admin_panel_grocery_app/feature/dashboard/presentation/view/widgets/drawer_widget.dart';
import 'package:admin_panel_grocery_app/feature/dashboard/presentation/view/widgets/header.dart';
import 'package:admin_panel_grocery_app/feature/dashboard/presentation/view/widgets/searchtextFormfield_widget.dart';
import 'package:admin_panel_grocery_app/feature/product/presentation/cubit/proudect_cubit.dart';
import 'package:admin_panel_grocery_app/feature/product/presentation/cubit/proudect_state.dart';
import 'package:admin_panel_grocery_app/feature/product/presentation/view/widgets/custom_data_table.dart';
import 'package:admin_panel_grocery_app/feature/product/presentation/view/widgets/empy_search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllProudectView extends StatelessWidget {
  const AllProudectView({super.key});

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
          Expanded(
            flex: 5,
            child: SingleChildScrollView(
              child: BlocConsumer<ProductCubit, ProductState>(
                  listener: (context, state) {
                if (state is SuccessDeleteProductState) {
                  showToast(
                      message: 'sucessfully delete product',
                      state: ToastStates.success);
                }
              }, builder: (context, state) {
                ProductCubit productCubit =
                    BlocProvider.of<ProductCubit>(context);
                return Column(
                  children: [
                    Header(
                      title: 'All Proudects',
                      widget: SearchTextFieldWidgets(
                        controller: productCubit.searchController,
                        onChanged: (value) {
                          productCubit.searchProduct(value);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SingleChildScrollView(
                        child: productCubit.searchController!.text.isNotEmpty &&
                                productCubit.searchProductList.isEmpty
                            ? const EmptySearchWidget()
                            : DataTableCustom(
                                productModdelList:
                                    state is SuccessGetSearchProductState
                                        ? productCubit.searchProductList
                                        : productCubit.productList,
                              ),
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
        ],
      )),
    );
  }
}
