import 'package:admin_panel_grocery_app/feature/product/presentation/cubit/proudect_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClearAndGetImageButton extends StatelessWidget {
  const ClearAndGetImageButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const FittedBox(
      child: Row(
        children: [
          ClearBtn(),
          SizedBox(
            width: 10,
          ),
          GetImageBtn(),
        ],
      ),
    );
  }
}

class GetImageBtn extends StatelessWidget {
  const GetImageBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        await BlocProvider.of<
                ProductCubit>(context)
            .getImage();
      },
      child: const Text(
          'chose another image'),
    );
  }
}

class ClearBtn extends StatelessWidget {
  const ClearBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        BlocProvider.of<ProductCubit>(
                context)
            .clear();
      },
      child: const Text('clear'),
    );
  }
}
