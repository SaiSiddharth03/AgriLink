import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class AddProductPage extends StatefulWidget {
  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final _formKey = GlobalKey<FormState>();
  final _productNameController = TextEditingController();
  final _productUnitController = TextEditingController();
  final _productQuantityController = TextEditingController();
  final _productUnitPriceController = TextEditingController();
  ImagePicker _imagePicker = ImagePicker();
  XFile? _imageFile;
  String _imageUrl = "";

  Future<void> _addProduct() async {
    if (_formKey.currentState!.validate() && _imageFile != null) {
      try {
        // Upload image to Firebase Storage
        final storageRef = FirebaseStorage.instance.ref().child('products/${_productNameController.text}.jpg');
        await storageRef.putFile(File(_imageFile!.path));
        _imageUrl = await storageRef.getDownloadURL();

        // Create a new product document in Firestore
        final docRef = FirebaseFirestore.instance.collection('products').doc();
        await docRef.set({
          'name': _productNameController.text,
          'unit': _productUnitController.text,
          'quantity': int.parse(_productQuantityController.text),
          'unitPrice': double.parse(_productUnitPriceController.text),
          'imageUrl': _imageUrl,
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Product added successfully!')),
        );
        Navigator.pop(context); // Close the page after successful addition
      } on FirebaseException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${e.message}')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill out all fields and select an image')),
      );
    }
  }

  Future<void> _pickImage() async {
    final pickedFile = await _imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = pickedFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    FloatingActionButton(
                      onPressed: _pickImage,
                      child: const Icon(Icons.add_a_photo),
                    ),
                    const SizedBox(width: 20.0),
                    ElevatedButton(
                      onPressed: _pickImage,
                      child: const Text('Browse Image'),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                if (_imageFile != null)
                  Image.file(File(_imageFile!.path), width: 200, height: 200),
                TextFormField(
                  controller: _productNameController,
                  decoration: const InputDecoration(labelText: 'Product Name'),
                  validator: (value) => value!.isEmpty ? 'Please enter product name' : null,
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  controller: _productUnitController,
                  decoration: const InputDecoration(labelText: 'Product Unit (e.g., kg, pcs)'),
                  validator: (value) => value!.isEmpty ? 'Please enter product unit' : null,
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  controller: _productQuantityController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Product Quantity'),
                  validator: (value) => value!.isEmpty ? 'Please enter product quantity' : null,
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  controller: _productUnitPriceController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Product Unit Price'),
                  validator: (value) => value!.isEmpty ? 'Please enter product unit price' : null,
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: _addProduct,
                  child: const Text('Add Product'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
