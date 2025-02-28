import 'package:flutter/material.dart';
import 'package:store_app/Services/get_all_products_service.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/widgets/customCard.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
static String id='HomePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(icon:const Icon(Icons.shopping_cart,color: Colors.black)
            ,onPressed: (){},)
        ],
        centerTitle: true,
        title: const Text('MZ Store',style: TextStyle(
          color: Colors.black
        ),),
      ),
      body: Padding(

        padding: const EdgeInsets.only(left: 16,right: 16,top: 65),
        child:FutureBuilder(future: GetAllProductsService().getAllProducts(), builder:(context,snapshot)

        {print(snapshot.data); if (snapshot.hasData) {
          List<ProductModel> products=snapshot.data!;

   return GridView.builder(
              itemCount: products.length,
              clipBehavior:Clip.none,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio:1.5,
                  crossAxisSpacing: 10,
                  mainAxisSpacing:100
              ), itemBuilder: (context,index){
            return CustomCard(product:products[index]);
          });
 }
 else {
   return const Center(child: CircularProgressIndicator());
        }
},)
      )
    );
  }
}


