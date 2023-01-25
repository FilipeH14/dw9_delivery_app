import 'package:dw9_delivery_app/app/core/ui/helpers/loader.dart';
import 'package:dw9_delivery_app/app/core/ui/helpers/messages.dart';
import 'package:dw9_delivery_app/app/core/ui/widgets/delivery_appbar.dart';
import 'package:dw9_delivery_app/app/models/product_model.dart';
import 'package:dw9_delivery_app/app/pages/home/widgets/delivery_product_tile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with Loader, Messages {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppbar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // showLoader();
          // await Future.delayed(const Duration(seconds: 2));
          // hideLoader();
          showError('Erro ao criar qualquer coisa');
          await Future.delayed(const Duration(seconds: 2));
          showInfo('Erro ao criar qualquer coisa');
          await Future.delayed(const Duration(seconds: 2));
          showError('Erro ao criar qualquer coisa');
          await Future.delayed(const Duration(seconds: 2));
        },
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) => DeliveryProductTile(
                product: ProductModel(
                  id: 0,
                  name: 'Lanche x',
                  description:
                      'Lannche acompanha pão, hamburuer, mussarela e maionese',
                  price: 20.30,
                  image:
                      'https://burgerx.com.br/assets/img/galeria/burgers/x-burger.jpg',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
