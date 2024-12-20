import 'package:firestore/auth/core/app_util.dart';
import 'package:firestore/product/model/product_model.dart';
import 'package:firestore/product/service/product_service.dart';
import 'package:flutter/material.dart';


class ProductProvider extends ChangeNotifier {
  ProductProvider(this.productService);

  ProductService productService;
  String? error;
  bool isLoading = false;

  Future addProduct(Product product) async {
    try {
      error = null;
      isLoading = true;
      notifyListeners();
      await productService.addProduct(product);
      isLoading = false;
      AppUtil.showToast('Product Added Successfully');
    } catch (e) {
      error = e.toString();
      AppUtil.showToast(error.toString());
    }
    notifyListeners();
  }
}
