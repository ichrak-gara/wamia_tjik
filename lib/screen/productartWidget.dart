import 'package:flutter/material.dart';

class ProductCartWidget extends StatefulWidget {

  final bool active;
  final Function onTap;

  const ProductCartWidget({
    required this.active,
    required this.onTap,
});


  @override
  State<ProductCartWidget> createState() => _ProductCartWidgetState();
}

class _ProductCartWidgetState extends State<ProductCartWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Panier: Liste des produits'),
        centerTitle: true,
        actions: [

        ],
      ),
    );
  }
}

