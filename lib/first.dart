// ignore_for_file: library_private_types_in_public_api, unnecessary_string_interpolations

import 'dart:io';

import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';

class First extends StatefulWidget {
  const First({super.key});

  @override
  _FirstState createState() => _FirstState();
}

class _FirstState extends State<First> {
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();
  var code = '';
  File? file;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(
                'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg',
                width: 200.0,
                height: 200.0,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(35),
                child: Container(
                  decoration: BoxDecoration(border: Border.all()),
                  child: TextFormField(
                    controller: title,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      hintText: ' Code ',
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 60,
                width: 100,
                child: MaterialButton(
                  color: Colors.indigo,
                  onPressed: () {
                    setState(() {
                      code = title.text;
                    });
                  },
                  child: const Text(
                    "Create",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              code == ''
                  ? const Text('')
                  : SizedBox(
                      height: 300,
                      width: 300,
                      child: BarcodeWidget(
                        barcode: Barcode.qrCode(
                          errorCorrectLevel: BarcodeQRCorrectionLevel.high,
                        ),
                        data: '$code',
                        width: 200,
                        height: 200,
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
