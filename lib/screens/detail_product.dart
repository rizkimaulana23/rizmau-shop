import 'package:flutter/material.dart';
import 'package:rizmau_shop/models/product.dart';


class DetailProduct extends StatelessWidget {
  final Product product;

  const DetailProduct({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.fields.name),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous page
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              product.fields.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text("Region: ${product.fields.region}"),
            SizedBox(height: 10),
            Text("Amount: ${product.fields.amount}"),
            SizedBox(height: 10),
            Text("Amount Collected: ${product.fields.amountCollected}"),
            SizedBox(height: 10),
            Text("Description: ${product.fields.description}"),

          ],
        ),
      ),
    );
  }
}