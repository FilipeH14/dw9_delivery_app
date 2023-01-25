import 'package:dw9_delivery_app/app/core/ui/widgets/delivery_appbar.dart';
import 'package:dw9_delivery_app/app/models/product_model.dart';
import 'package:dw9_delivery_app/app/pages/home/widgets/delivery_product_tile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppbar(),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) => DeliveryProductTile(
                product: ProductModel(
                  id: 0,
                  name: 'Lanche x',
                  description: 'Lannche acompanha pão, hamburuer, mussarela e maionese',
                  price: 20.30,
                  image: 'https://burgerx.com.br/assets/img/galeria/burgers/x-burger.jpg',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
