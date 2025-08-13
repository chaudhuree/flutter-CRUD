import 'package:crud/Style/Style.dart';
import 'package:flutter/material.dart';

class ProductCreateScreen extends StatefulWidget {
  const ProductCreateScreen({super.key});

  @override
  State<ProductCreateScreen> createState() => _ProductCreateScreenState();
}

class _ProductCreateScreenState extends State<ProductCreateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Product'),
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                TextFormField(
                  onChanged: (value) {},
                  decoration: appInputDecoration('Name'),
                ),
                TextFormField(
                  onChanged: (value) {},
                  decoration: appInputDecoration('Price'),
                ),
                TextFormField(
                  onChanged: (value) {},
                  decoration: appInputDecoration('Description'),
                ),
                TextFormField(onChanged: (value) {}),
                TextFormField(onChanged: (value) {}),
                SizedBox(height: 20),
                ElevatedButton(onPressed: () {}, child: const Text('Create')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
