import 'dart:typed_data';
import 'package:admin_panel_grocery_app/feature/product/presentation/cubit/proudect_cubit.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    super.key,
    this.webImage,  this.imagUrl,
  });
  final Uint8List? webImage;
  final String? imagUrl;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'product image',
          style: Theme.of(context).textTheme.displayLarge,
        ),
        const SizedBox(
          height: 10,
        ),
        FittedBox(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 250,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: 
              webImage == null
                  ?
                imagUrl!=null?     Image.network(imagUrl!): DottedBorder(
                      dashPattern: const [6.7],
                      borderType: BorderType.RRect,
                      radius: const Radius.circular(12),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.image_outlined,
                              size: 150,
                            ),
                            TextButton(
                              child: const Text(
                                'chose image',
                              ),
                              onPressed: () async {
                                await BlocProvider.of<ProductCubit>(context)
                                    .getImage();
                              },
                            )
                          ],
                        ),
                      ),
                    )
                : Image.memory(
                      BlocProvider.of<ProductCubit>(context).webImage!)
                  
                      ,
            ),
          ),
        ),
      ],
    );
  }
}
