import 'package:firestore/product/model/product_model.dart';
import 'package:firestore/product/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  final idController = TextEditingController();
  final colorController = TextEditingController();
  final key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Screen"),
      ),
      body: Form(
        key: key,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                mainTextFormField(nameController,'Enter Name'),
                mainTextFormField(descriptionController,'Enter Description'),
                mainTextFormField(priceController,'Enter Price'),
                mainTextFormField(idController,'Enter Id'),
                mainTextFormField(colorController,'Enter Color'),
                const SizedBox(
                  height: 16,
                ),
                GestureDetector(
                  onTap: addProduct,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: const Text(
                        "Add New Product",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget mainTextFormField(controller, labelText) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(0),),
        ),
      ),
    );
  }
  Future addProduct() async {
    String name = nameController.text;
    String description = descriptionController.text;
    double price = double.parse(priceController.text);
    String color = colorController.text;
    String id = idController.text;
    Product product = Product(
      name: name,
      description: description,
      price: price,
      color: color,
    );
    final provider = Provider.of<ProductProvider>(context,listen: false);
    await provider.addProduct(product);
  }
}
