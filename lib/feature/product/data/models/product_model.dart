import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModdel {
  final String title;
  final String id;
  final String category;
  final String imageUrl;
  final double price;
   double? salePrice=0.0;
  final String isPiece;
   bool? isOnSale;
  final Timestamp createdAt;

  ProductModdel(
      {required this.title,
      required this.id,
      required this.category,
      required this.imageUrl,
      required this.price,
       this.salePrice=0,
      required this.isPiece,
       this.isOnSale=false,
      required this.createdAt});

  factory ProductModdel.fromFirebase(QueryDocumentSnapshot<Map<String, dynamic>> doc) {
    return ProductModdel(
        title: doc.get('title'),//==doc[title]
        id: doc['id'],
        category: doc['ProudectCategoryName'],
        imageUrl: doc['imagUrl'],
        price: doc['price'],
        isPiece: doc['isPiece'],
        isOnSale: doc['isOnsale'],
        salePrice: doc['salePrice'],
        createdAt: doc['createdAt']
        );
  }
}
