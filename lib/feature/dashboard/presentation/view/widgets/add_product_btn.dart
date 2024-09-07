import 'package:admin_panel_grocery_app/core/theme/app_color.dart';
import 'package:admin_panel_grocery_app/feature/product/presentation/view/add_proudect_view.dart';
import 'package:flutter/material.dart';

class AddProductBtn extends StatelessWidget {
  const AddProductBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddProudectView()));
                  },
                child:const Row(
                  children: [
                    Icon(Icons.add,color: AppColor.white,size: 20,),
                    Text('  add product',style: TextStyle(color:AppColor.white),),
                    
                  ],
                ) ,),
      ],
    );
  }
}
