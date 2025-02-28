import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/Services/update_product_service.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/widgets/customButton.dart';
import 'package:store_app/widgets/customText.dart';

class UpdateProductPage extends StatefulWidget {
  const UpdateProductPage({super.key});
  static String id = 'update';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName;

  String? description;

  String? image;

  String? price;
  bool isLoading = false;
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
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                CustomText(
                    hintText: 'Product Name',
                    onchange: (data) {
                      productName = data;
                    },
                    obscureText: false),
                const SizedBox(
                  height: 10,
                ),
                CustomText(
                  hintText: 'price',
                  onchange: (data) {
                    price = data;

                  },
                  obscureText: false,
                  inputType: TextInputType.number,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomText(
                    hintText: 'image',
                    onchange: (data) {
                      image = data;
                    },
                    obscureText: false),
                const SizedBox(
                  height: 10,
                ),
                CustomText(
                    hintText: 'description',
                    onchange: (data) {
                      description = data;
                    },
                    obscureText: false),
                const SizedBox(
                  height: 50,
                ),
                CustomButton(
                    text: 'Update',
                    onTap: () async{
                      try {
                        await  updateProductFunc(product);

                        print('success');
                      } catch (e) {
                        print(e.toString());
                        isLoading = false;
                        setState(() {});
                      }
                      setState(() {});
                      updateProductFunc(product);
                      isLoading = false;
                      setState(() {});
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProductFunc(ProductModel product) async{
   await UpdateProductService().updateProductService(
      id: product.id,
        title:productName==null ? product.title: productName!,
        desc: description==null ? product.description: description!,
        image: image==null ? product.image: image!,
        price: price==null ? product.price.toString(): price!,
        category: product.category);
  }
}
