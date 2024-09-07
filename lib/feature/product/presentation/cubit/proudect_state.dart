abstract class ProductState{}
class InitialProductState extends ProductState {}
class LoadingAddProductState extends ProductState {}
class SuccessAddProductState extends ProductState {}
class FailureAddProductState extends ProductState {
  final String message;
  FailureAddProductState(this.message);
}
class ChangeItemState extends ProductState {}
class ChangeSaleItemState extends ProductState {}
class ChangeSaleItemEditState extends ProductState {}
class ChangeEditItemState extends ProductState{}
class ChangGroubValState extends ProductState {}
class ChangGroubValEditState extends ProductState {}
class ChangIsOnSaleState extends ProductState{}
class ChangIsOnSaleEditState extends ProductState{}
class ChangPrecenteEditState extends ProductState{}
class GetImageState extends ProductState {}
class ChangeTitleEdit extends ProductState {}
class ChangePriceeEdit extends ProductState {}
class FailureGetImageState extends ProductState {}
class SuccessUploadImagToFirebasetState extends ProductState {}
class FailureUploadImagToFirebasetState extends ProductState {
  final String message;
  FailureUploadImagToFirebasetState(this.message);
}

class LoadingGetProductState extends ProductState {}
class SuccessGetProductState extends ProductState {}
class FailureGetProductState extends ProductState {
  final String message;
  FailureGetProductState(this.message);
}
class ClearState extends ProductState {}
class SuccessGetSearchProductState extends ProductState{}
class PercentageToShow extends ProductState{}

class LoadingEditProductState extends ProductState {}
class SuccessEditProductState extends ProductState {}
class FailureEditProductState extends ProductState {
  final String message;
  FailureEditProductState(this.message);
}

class LoadingDeleteProductState extends ProductState {}
class SuccessDeleteProductState extends ProductState {}
class FailureDeleteProductState extends ProductState {
  final String message;
  FailureDeleteProductState(this.message);
}