import 'package:flutter/material.dart';
import 'package:receipt_scanner/model/receipt_model_4.dart';

class ReceiptEditPages extends StatefulWidget {
  final ReceiptModelSoldItem4 item;
  const ReceiptEditPages({super.key, required this.item});

  @override
  State<ReceiptEditPages> createState() => _ReceiptEditPagesState();
}

class _ReceiptEditPagesState extends State<ReceiptEditPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [],
      ),
    );
  }

  ttf() {
    TextField(
      style: TextStyle(color: Theme.of(context).canvasColor),
      cursorColor: Theme.of(context).primaryColor,
      decoration: InputDecoration(
        filled: true,
        fillColor: Theme.of(context).colorScheme.background,
        prefixIcon: Icon(Icons.search, color: Theme.of(context).primaryColor),
        errorBorder: _border(),
        enabledBorder: _border(),
        focusedBorder: _border(),
        disabledBorder: _border(),
        border: _border(),
        hintStyle: TextStyle(color: Theme.of(context).primaryColor),
        hintText: "Chek Raqamini kiriting",
      ),
    );
  }

  OutlineInputBorder _border() => OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Color.fromARGB(255, 8, 84, 146)));
}
