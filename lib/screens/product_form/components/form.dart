import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class FormProduct extends StatelessWidget {
  const FormProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final _nameController = TextEditingController();
    final _priceController = TextEditingController();
    final _descriptionController = TextEditingController();

    return Container(
        child: Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: "Nama Produk",
                hintText: "Masukan Nama Produk",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Nama Produk tidak boleh kosong";
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _priceController,
              decoration: InputDecoration(
                labelText: "Harga Produk",
                hintText: "Masukan Harga Produk",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Harga Produk tidak boleh kosong";
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: "Deskripsi Produk",
                hintText: "Masukan Deskripsi Produk",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Deskripsi Produk tidak boleh kosong";
                }
                return null;
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                print(_nameController.text);
                print(_priceController.text);
                print(_descriptionController.text);
              }
            },
            child: const Text("Pesan Sekarang"),
          ),
        ],
      ),
    ));
  }
}
