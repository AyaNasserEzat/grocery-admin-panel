import 'dart:typed_data';
import 'package:admin_panel_grocery_app/feature/product/data/models/product_model.dart';
import 'package:admin_panel_grocery_app/feature/product/presentation/cubit/proudect_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(InitialProductState());
  TextEditingController title = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController? titleedit = TextEditingController();
  TextEditingController? priceedit = TextEditingController();

  String groupValue = 'KG';
  String? groubValueEdit;
  String selectedCategory = 'fruites';
  String? selectedCategoryEdit;
  bool? isOnsale = false;
  String selectedSalePrecent = '10';
  String? selectedSalePrecentEdit;
  bool? isOnsaleEdit=false;

  //File? productPic;if not web image
  //Uint8List is a typed list used to represent binary data in Dart.
  Uint8List? webImage;
  String? imagUrl;
  List<String> category = [
    'fruites',
    'vegetables',
    'nuts',
    'herps',
    'grains',
    'spices'
  ];
  List<String> salePrecentList = [
    '10',
    '20',
    '30',
    '40',
    '50',
    '60',
    '70',
  ];

  void changeItem(item) {
    selectedCategory = item;
    emit(ChangeItemState());
  }

  void changeItemEdit(item) {
    selectedCategoryEdit = item;
    emit(ChangeEditItemState());
  }

  void changeSaleItem(item) {
    selectedSalePrecent = item;
    emit(ChangeSaleItemState());
  }

  void changeSaleItemEdit(item) {
    selectedSalePrecentEdit = item;
    emit(ChangeSaleItemEditState());
  }

  double? getSalPrice() {
    return double.parse(price.text) *
        (1-double.parse(selectedSalePrecent)/100);  
  }

  
  double? getSalPriceEdit({required ProductModdel productModdel}) {
 
    return 
     double.parse(priceedit!.text.isNotEmpty ? priceedit!.text  : productModdel.price.toString()) *
        (1-double.parse(selectedSalePrecentEdit ?? percetToShow(productModdel: productModdel))/100);  
  }

  percetToShow({required ProductModdel productModdel}) {
  String? percentToShow =(((productModdel.price-productModdel.salePrice!)/productModdel.price)*100).toString();      
  return percentToShow;
  }

  void changeGroubVal(val) {
    groupValue = val;
    emit(ChangGroubValState());
  }

  void changeGroubValEdit(val) {
    groubValueEdit = val;
    emit(ChangGroubValEditState());
  }

  void changIsOnSale(val) {
    isOnsale = val;
    emit(ChangIsOnSaleState());
  }

  void changIsOnSaleEdit(val) {
   // if(isOnsaleEdit==false){selectedSalePrecentEdit = '10';}//make these for to resete it beacuse without it its show privouse one
     isOnsaleEdit = val;
    // selectedSalePrecentEdit = '10';
    emit(ChangIsOnSaleEditState());
  }

  //chanfe controller
  changeTitleedit(value) {
    titleedit!.text = value;
    emit(ChangeTitleEdit());
  }

  changePriceedit(value) {
    priceedit!.text = value;
    emit(ChangePriceeEdit());
  }

  getImage() async {
    final XFile? pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    // productPic=File(pickedImage!.path);//if not web
    final Uint8List imageData = await pickedImage!.readAsBytes();
    webImage = imageData;
    emit(GetImageState());
  }

  //upload image
  Future<String?> uploadImage() async {
    try {
      final ref = FirebaseStorage.instance
          .ref()
          .child('userImages')
          .child('$_uuid.png');

      // final uploadTask =
      await ref.putData(webImage!);

      final imagUrl = await ref.getDownloadURL();
      emit(SuccessUploadImagToFirebasetState());
      return imagUrl; // Returns the download URL of the uploaded image
    } catch (e) {
      // print('Error uploading image: $e');
      emit(FailureUploadImagToFirebasetState('Faild to upload image'));
      return null;
    }
  }

  final _uuid = const Uuid().v4();
  addProudect() async {
    try {
      emit(LoadingAddProductState());
      await FirebaseFirestore.instance.collection('products').doc(_uuid).set({
        'id': _uuid,
        'title': title.text,
        'price': int.parse(price.text),
        'salePrice': isOnsale == true ? getSalPrice() : 0.0,
        'imagUrl': await uploadImage(),
        'ProudectCategoryName': selectedCategory,
        'isOnsale': isOnsale,
        'isPiece': groupValue,
        'createdAt': Timestamp.now(),
      });
      clear();
      getProduct();
      emit(SuccessAddProductState());
    } on FirebaseException catch (e) {
      print(e.toString());
      emit(FailureAddProductState(e.message!));
    }
  }

  ////Edit proudect
  editProudect(ProductModdel productModdel) async {
    try {
      emit(LoadingEditProductState());
      await FirebaseFirestore.instance
          .collection('products')
          .doc(productModdel.id)
          .update({
        // 'id': _uuid,
        'title': titleedit!.text.isNotEmpty?titleedit!.text:productModdel.title,
        'price': priceedit!.text.isNotEmpty?double.parse(priceedit!.text):productModdel.price,
        'salePrice':isOnsaleEdit==true? getSalPriceEdit(productModdel: productModdel):0.0 ,
        'imagUrl': await uploadImage() ?? productModdel.imageUrl,
        'ProudectCategoryName': selectedCategoryEdit ?? productModdel.category,
        'isOnsale': isOnsaleEdit ?? productModdel.isOnSale,
        'isPiece': groubValueEdit ?? productModdel.isPiece,
        'createdAt': Timestamp.now(),
      });
      getProduct();
      emit(SuccessEditProductState());
    } on FirebaseException catch (e) {
      // print(e.toString());
      emit(FailureEditProductState(e.message!));
    }
  }
  //delete product

  deletProudect(String id) async {
    try {
      emit(LoadingDeleteProductState());
      await FirebaseFirestore.instance.collection('products').doc(id).delete();
      getProduct();
      emit(SuccessDeleteProductState());
    } on FirebaseException catch (e) {
      //print(e.toString());
      emit(FailureDeleteProductState(e.message!));
    }
  }

  List<ProductModdel> productList=[];
  getProduct() async {
    try {
      final snapshot =
          await FirebaseFirestore.instance.collection('products').orderBy('createdAt',descending: true).get();
      productList =
          snapshot.docs.map((doc) => ProductModdel.fromFirebase(doc)).toList();
      emit(SuccessGetProductState());
    } on FirebaseException catch (e) {
      emit(FailureGetProductState(e.toString()));
    }
  }

  //get product by id
  findProdById(String productId) {
    return productList.firstWhere((element) => element.id == productId);
  }
  //search list
List<ProductModdel> searchProductList = [];
TextEditingController? searchController = TextEditingController();
  List<ProductModdel> searchProduct(String searchText) {
    searchProductList = productList
        .where((element) =>
            element.title.toLowerCase().contains(searchText.toLowerCase()))
        .toList();
    emit(SuccessGetSearchProductState());
    return searchProductList;
  }
  clear() {
    title.clear();
    price.clear();
    titleedit!.clear();
    priceedit!.clear();
    webImage = null;
    groupValue = 'KG';
    selectedCategory = 'fruites';
    selectedSalePrecent = '10';
    isOnsale = false;
    emit(ClearState());
  }
}
