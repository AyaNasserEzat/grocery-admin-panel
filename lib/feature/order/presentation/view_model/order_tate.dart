abstract class OrderState{}
class InitialOrderState extends OrderState {}

class LoadingGetOrderState extends OrderState {}
class SuccessGetOrderState extends OrderState {}
class FailureGetOrderState extends OrderState {
  final String message;
  FailureGetOrderState(this.message);
}