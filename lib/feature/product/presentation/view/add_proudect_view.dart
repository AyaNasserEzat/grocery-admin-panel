import 'package:admin_panel_grocery_app/core/helpers/commens.dart';
import 'package:admin_panel_grocery_app/core/helpers/responsive.dart';
import 'package:admin_panel_grocery_app/core/theme/app_color.dart';
import 'package:admin_panel_grocery_app/core/widgets/custom_loading.dart';
import 'package:admin_panel_grocery_app/feature/dashboard/presentation/view/widgets/drawer_widget.dart';
import 'package:admin_panel_grocery_app/feature/dashboard/presentation/view/widgets/header.dart';
import 'package:admin_panel_grocery_app/feature/product/presentation/cubit/proudect_cubit.dart';
import 'package:admin_panel_grocery_app/feature/product/presentation/cubit/proudect_state.dart';
import 'package:admin_panel_grocery_app/feature/product/presentation/view/widgets/animated_switched.dart';
import 'package:admin_panel_grocery_app/feature/product/presentation/view/widgets/categorItem.dart';
import 'package:admin_panel_grocery_app/feature/product/presentation/view/widgets/clear_and_get_image_btton.dart';
import 'package:admin_panel_grocery_app/feature/product/presentation/view/widgets/image_widget.dart';
import 'package:admin_panel_grocery_app/feature/product/presentation/view/widgets/kg_or_piece_widget.dart';
import 'package:admin_panel_grocery_app/feature/product/presentation/view/widgets/row_onsale_widget_add.dart';
import 'package:admin_panel_grocery_app/feature/product/presentation/view/widgets/text_form_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddProudectView extends StatelessWidget {
  const AddProudectView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideMenu(),
      body: Row(
        children: [
          if (Responsive.isDesktop(context))
            const Expanded(
              child: SideMenu(),
            ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Header(
                    title: 'add Proudect',
                    widget: Container(),
                  ),
                  const SizedBox(
                    height: 25,
                  ), //ProudectState
                  BlocConsumer<ProductCubit, ProductState>(
                      listener: (context, state) {
                    if (state is SuccessEditProductState) {
                      showToast(
                          message: 'sucessfully added product',
                          state: ToastStates.success);
                    }
                    if (state is FailureEditProductState) {
                      showToast(
                          message: state.message, state: ToastStates.error);
                    }
                  }, builder: (context, state) {
                    return Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Card(
                                  color: Colors.white,
                                  margin: const EdgeInsets.all(5),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        TextFormItem(
                                          controller:
                                              BlocProvider.of<ProductCubit>(
                                                      context)
                                                  .title,
                                          text: 'product Title',
                                          hintText: 'Enter Product name',
                                        ),
                                        TextFormItem(
                                          controller:
                                              BlocProvider.of<ProductCubit>(
                                                      context)
                                                  .price,
                                          text: r'Price in $ ',
                                          hintText: 'Enter product price',
                                        ),

                                        Text(
                                          'Proudect category',
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayLarge,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        //drop button
                                        CategoryIem(
                                          valu: BlocProvider.of<ProductCubit>(
                                                  context)
                                              .selectedCategory,
                                          onChanged: (value) {
                                            BlocProvider.of<ProductCubit>(
                                                    context)
                                                .changeItem(value);
                                          },
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          'measure unit',
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayLarge,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        //radio btn
                                        KgOrPeiceWidget(
                                            groupValue:
                                                BlocProvider.of<ProductCubit>(
                                                        context)
                                                    .groupValue,
                                            onChanged: (value) {
                                              BlocProvider.of<ProductCubit>(
                                                      context)
                                                  .changeGroubVal(value);
                                            }),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        //check is on sal
                                        RowOnSaleWidget(
                                          value: BlocProvider.of<ProductCubit>(
                                                  context)
                                              .isOnsale,
                                          onChanged: (valu) {
                                            BlocProvider.of<ProductCubit>(
                                                    context)
                                                .changIsOnSale(valu);
                                          },
                                        ),
                                        BlocProvider.of<ProductCubit>(context)
                                                    .isOnsale ==
                                                true
                                            ? AnimatedSwitcherWidget(
                                              hint:  BlocProvider.of<
                                                        ProductCubit>(context)
                                                    .selectedSalePrecent,
                                                value: BlocProvider.of<
                                                        ProductCubit>(context)
                                                    .selectedSalePrecent,
                                                onChanged: (valu) {
                                                  BlocProvider.of<ProductCubit>(
                                                          context)
                                                      .changeSaleItem(valu);
                                                },
                                                text: BlocProvider.of<
                                                        ProductCubit>(context)
                                                    .getSalPrice())
                                            : Container(),
                                        Row(
                                          children: [
                                            const Spacer(),
                                            ElevatedButton(
                                              onPressed: () async {
                                                await BlocProvider.of<
                                                        ProductCubit>(context)
                                                    .addProudect();
                                              },
                                              child: const Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(
                                                    'add product',
                                                    style: TextStyle(
                                                        color: AppColor.white),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Card(
                                  color: AppColor.white,
                                  child: Column(
                                    children: [
                                      ImageWidget(
                                        webImage: BlocProvider.of<ProductCubit>(
                                                context)
                                            .webImage,
                                      ),
                                      const ClearAndGetImageButton(),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (state is LoadingAddProductState)
                          const CustomLoading()
                      ],
                    );
                  })
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
