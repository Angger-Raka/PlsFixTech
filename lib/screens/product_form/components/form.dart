import 'dart:io';

import 'package:firebase_chatting/helper/chatting_firebase.dart';
import 'package:firebase_chatting/screens/history/history_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FormProduct extends StatefulWidget {
  const FormProduct({Key? key}) : super(key: key);

  @override
  State<FormProduct> createState() => _FormProductState();
}

class _FormProductState extends State<FormProduct> {
  @override
  String? imagePath;
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
              child: imagePath != null
                  ? SizedBox(
                      width: 200,
                      height: 200,
                      child: Image.network(imagePath ?? ""),
                    )
                  : Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                      ),
                      child: const Center(child: Text("No Image")),
                    )),
          imagePath == null
              ? ElevatedButton(
                  onPressed: () async {
                    File file = await getImage();
                    imagePath = await DatabaseService.uploadImage(file);
                    setState(() {});
                  },
                  child: const Text("Upload Image Here"),
                )
              : ElevatedButton(
                  onPressed: () async {
                    //delet image from storage firebase
                    await DatabaseService.deleteImage(imagePath!);
                    imagePath = null;
                    setState(() {});
                  },
                  child: const Text("Remove Image"),
                ),
          const SizedBox(
            height: 20,
          ),
          // make dropdown button of category [Service Delivery, Selling, exchange]
          DropdownButton(
            items: const [
              DropdownMenuItem(
                child: Text("Service Delivery"),
                value: "Service Delivery",
              ),
              DropdownMenuItem(
                child: Text("Selling"),
                value: "Selling",
              ),
              DropdownMenuItem(
                child: Text("Exchange"),
                value: "Exchange",
              ),
            ],
            onChanged: (value) {
              print(value);
            },
            hint: Text("Select Category"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
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
              decoration: const InputDecoration(
                labelText: "Harga Produk",
                hintText: "Masukan Harga Produk",
              ),
              keyboardType: TextInputType.number,
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
              decoration: const InputDecoration(
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
                if (imagePath != null) {
                  try {
                    DatabaseService.sendProduct(
                        _nameController.text,
                        int.parse(_priceController.text),
                        _descriptionController.text,
                        imagePath!);
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Data berhasil disimpan')));
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HistoryScreen()),
                    );
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Data gagal disimpan')));
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Image tidak boleh kosong')));
                }
              }
            },
            child: const Text("Pesan Sekarang"),
          ),
          const SizedBox(
            height: 80,
          ),
        ],
      ),
    ));
  }
}

Future<File> getImage() async {
  final picker = ImagePicker();
  final pickedFile = await picker.pickImage(source: ImageSource.gallery);

  return File(pickedFile!.path);
}
