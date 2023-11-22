import 'package:flutter/material.dart';
import 'package:rizmau_shop/models/product.dart';

class ProductListPage extends StatelessWidget {
  final List<Product> items;

  ProductListPage({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Item'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(items[index].fields.name),
              subtitle: Text(
                  'Region: ${items[index].fields.region}\n' + 
                  'Amount: ${items[index].fields.amount}\n' + 
                  'Amount Collected : ${items[index].fields.amountCollected}\n' + 
                  'Deskripsi: ${items[index].fields.description}' + 
                  ''),
            ),
          );
        },
      ),
    );
  }
}