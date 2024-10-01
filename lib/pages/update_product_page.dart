import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store/helper/show_snack_bar.dart';
import 'package:store/models/product_model.dart';
import 'package:store/services/update_product.dart';
import 'package:store/widgets/custom_button.dart';
import 'package:store/widgets/custom_text_field.dart';

class UpdateProductPage extends StatefulWidget {
  const UpdateProductPage({super.key});
  static String id = 'UpdateProductPage';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName, desc, image, price, id;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    bool isLoading = false;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: const Text(
            'Update Product',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(
            16,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                onChanged: (data) {
                  productName = data;
                },
                hintText: 'Product Name',
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                onChanged: (data) {
                  desc = data;
                },
                hintText: 'Description',
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                inputType: TextInputType.number,
                onChanged: (data) {
                  price = data;
                },
                hintText: 'Price',
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                onChanged: (data) {
                  image = data;
                },
                hintText: 'Image',
              ),
              const SizedBox(
                height: 50,
              ),
              CustomButton(
                  text: 'Update',
                  onTap: () async {
                    isLoading = true;
                    setState(() {});
                    try {
                      await updateProduct(product);
                      showSnackBar(
                          context, 'The Product is Updated Successfully');
                    } catch (e) {
                      showSnackBar(context, e.toString());
                    }
                    isLoading = false;
                    setState(() {});
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async {
    await UpdateProductService().updateProduct(
      title: productName == null ? product.title : productName!,
      price: price == null ? product.price.toString() : price!,
      description: desc == null ? product.description : desc!,
      image: image == null ? product.image : image!,
      id: product.id,
      category: product.category,
    );
  }
}
