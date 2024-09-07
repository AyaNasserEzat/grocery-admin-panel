import 'package:admin_panel_grocery_app/feature/order/data/models/order_model.dart';
import 'package:admin_panel_grocery_app/feature/order/presentation/view_model/order_tate.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(InitialOrderState());

  List<OrderModel> orderList = [];
 
  getOrder() async {
    try {
      emit(LoadingGetOrderState());
      final snapshot =
          await FirebaseFirestore.instance.collection('orders').get();
      orderList =
          snapshot.docs.map((doc) => OrderModel.fromMap(doc)).toList();

      emit(SuccessGetOrderState());
    } on FirebaseException catch (e) {
      emit(FailureGetOrderState(e.toString()));
    }
  }
  
getTotalEarns(){
  int total=0;
  for (int i=0;i<orderList.length;i++){
total+=(orderList[i].price*orderList[i].quantity);
  }
  return total;
}

}
