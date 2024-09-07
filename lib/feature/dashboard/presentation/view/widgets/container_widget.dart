
import 'package:admin_panel_grocery_app/core/theme/app_color.dart';
import 'package:flutter/material.dart';
class ContainerWidget extends StatelessWidget {
  const ContainerWidget({
    super.key, required this.textLength, required this.text,  this.imageUrl, this.iconData,
  });
final String textLength;
final String text;
final IconData? iconData;
final String? imageUrl;
  @override
  Widget build(BuildContext context) {
    
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          width: 230,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(11),
            color: Colors.green[200],
          ),
          child:  Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Icon(iconData,size: 80,color: AppColor.green,),
                const SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(
                     textLength,
                      style:
                          const TextStyle(fontWeight: FontWeight.bold, fontSize: 25,color: AppColor.green),
                    ),
                    Text(
                      text,
                      style:
                          Theme.of(context).textTheme.displayLarge!.copyWith(color: AppColor.green, fontSize: 19),
                    ),
                  ],
                ),
        
                    
                    
              ],
            ),
          ),
        ),
      ),
    );
  }
}
