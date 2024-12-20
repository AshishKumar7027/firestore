import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore/product/model/product_model.dart';

class ProductService {
  Future addProduct(Product product) async {
    FirebaseFirestore.instance
        .collection('product')
        .doc(product.id)
        .set(product.toJson());
  }
}
