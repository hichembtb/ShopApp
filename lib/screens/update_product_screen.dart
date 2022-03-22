import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product_service.dart';
import 'package:store_app/widgets/custom_botton.dart';
import 'package:store_app/widgets/custom_text_field.dart';

class UpdateProductScreen extends StatefulWidget {
  const UpdateProductScreen({Key? key}) : super(key: key);
  static String route = "updateScreen";

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  String? productName, descr, image, price;
  bool isLoading = false;
  // Update Product Methode

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Update product',
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0.0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextField(
                onChanged: (value) {
                  productName = value;
                },
                hintText: 'Product Name',
              ),
              CustomTextField(
                onChanged: (value) {
                  descr = value;
                },
                hintText: 'Description',
              ),
              // Price Field
              CustomTextField(
                onChanged: (value) {
                  price = value;
                },
                hintText: 'Price',
                keyboardType: TextInputType.number,
              ),
              CustomTextField(
                onChanged: (value) {},
                hintText: 'Image',
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
              ),
              CustomButton(
                onPressed: () async {
                  isLoading = true;
                  setState(() {});

                  try {
                    await updateProduct(product);
                    print('done');
                  } catch (ex) {
                    throw Exception(ex.toString());
                  }
                  isLoading = false;
                  setState(() {});
                },
                text: 'update',
                textStyle: const TextStyle(
                  color: Colors.white,
                ),
                buttonColor: Colors.black,
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async {
    print('start');
    await UpdateProductService().updateProduct(
      title: productName == null ? product.title : productName!,
      price: price == null ? product.price.toString() : price!,
      desc: descr == null ? product.description : descr!,
      image: image == null ? product.image : image!,
      category: product.category,
      id: product.id,
    );
  }
}
