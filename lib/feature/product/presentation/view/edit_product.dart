import 'package:admin_panel_grocery_app/core/helpers/commens.dart';
import 'package:admin_panel_grocery_app/core/helpers/responsive.dart';
import 'package:admin_panel_grocery_app/core/theme/app_color.dart';
import 'package:admin_panel_grocery_app/core/widgets/custom_loading.dart';
import 'package:admin_panel_grocery_app/feature/dashboard/presentation/view/widgets/drawer_widget.dart';
import 'package:admin_panel_grocery_app/feature/dashboard/presentation/view/widgets/header.dart';
import 'package:admin_panel_grocery_app/feature/product/data/models/product_model.dart';
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

class EditProductView extends StatefulWidget {
  const EditProductView({required this.productModdel, super.key});
  final ProductModdel productModdel;

  @override
  State<EditProductView> createState() => _EditProductViewState();
}

class _EditProductViewState extends State<EditProductView> {
  @override
  void initState() {
    BlocProvider.of<ProductCubit>(context).selectedCategoryEdit =
        widget.productModdel.category;
    BlocProvider.of<ProductCubit>(context).groubValueEdit =
        widget.productModdel.isPiece;
    BlocProvider.of<ProductCubit>(context).isOnsaleEdit =
        widget.productModdel.isOnSale;
    BlocProvider.of<ProductCubit>(context).selectedSalePrecentEdit =
        widget.productModdel.isOnSale == false
            ? '10'
            : BlocProvider.of<ProductCubit>(context)
                .percetToShow(productModdel: widget.productModdel);
    super.initState();
  }

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
                    title: 'edit Proudect',
                    widget: Container(),
                  ),
                  const SizedBox(
                    height: 25,
                  ), //ProudectState
                  BlocConsumer<ProductCubit, ProductState>(
                      listener: (context, state) {
                    if (state is SuccessEditProductState) {
                      showToast(
                          message: 'sucessfully edited product',
                          state: ToastStates.success);
                    }
                    if (state is FailureEditProductState) {
                      showToast(
                          message: state.message, state: ToastStates.error);
                    }
                  }, builder: (context, state) {
                    ProductCubit productCubit =
                        BlocProvider.of<ProductCubit>(context);
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
                                          initialValue:
                                              widget.productModdel.title,
                                          onChanged: (value) {
                                            productCubit.changeTitleedit(value);
                                          },
                                          text: 'product Title',
                                          hintText: 'Enter Product name',
                                        ),
                                        TextFormItem(
                                          initialValue: widget
                                              .productModdel.price
                                              .toString(),
                                          onChanged: (value) {
                                            productCubit.changePriceedit(value);
                                          },
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
                                          valu: productCubit
                                                  .selectedCategoryEdit ??
                                              widget.productModdel.category,
                                          onChanged: (value) {
                                            setState(() {
                                              productCubit
                                                  .selectedCategoryEdit = value;
                                              productCubit
                                                  .changeItemEdit(value);
                                            });
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
                                              productCubit.groubValueEdit,
                                          onChanged: (value) {
                                            setState(() {
                                              productCubit.groubValueEdit =
                                                  value;
                                              productCubit
                                                  .changeGroubValEdit(value);
                                            });
                                          },
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        //check is on sal
                                        RowOnSaleWidget(
                                          value: productCubit.isOnsaleEdit,
                                          onChanged: (valu) {
                                            setState(() {
                                              productCubit.isOnsaleEdit = valu;
                                              productCubit
                                                  .changIsOnSaleEdit(valu);
                                            });
                                          },
                                        ),

                                        productCubit.isOnsaleEdit == true
                                            ? AnimatedSwitcherWidget(
                                                hint: productCubit
                                                    .selectedSalePrecentEdit,
                                                value: productCubit
                                                    .selectedSalePrecentEdit,
                                                onChanged: (valu) {
                                                  setState(() {
                                                    productCubit
                                                            .selectedSalePrecentEdit =
                                                        valu;
                                                    productCubit
                                                        .changeSaleItemEdit(
                                                            valu);
                                                  });
                                                },
                                                text: productCubit
                                                    .getSalPriceEdit(
                                                        productModdel: widget
                                                            .productModdel),
                                              )
                                            : Container(),

                                        Row(
                                          children: [
                                            const Spacer(),
                                            ElevatedButton(
                                              onPressed: () async {
                                                await productCubit.editProudect(
                                                    widget.productModdel);
                                              },
                                              child: const Row(
                                                children: [
                                                  Text(
                                                    'edit product',
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
                                        webImage: productCubit.webImage,
                                        imagUrl: widget.productModdel.imageUrl,
                                      ),
                                      const GetImageBtn(),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (state is LoadingEditProductState)
                          const Positioned(
                              top: 0,
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: CustomLoading())
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
