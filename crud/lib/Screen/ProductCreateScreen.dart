import 'package:crud/RestApi/restClient.dart';
import 'package:crud/Style/Style.dart';
import 'package:flutter/material.dart';

class ProductCreateScreen extends StatefulWidget {
  const ProductCreateScreen({super.key});

  @override
  State<ProductCreateScreen> createState() => _ProductCreateScreenState();
}

class _ProductCreateScreenState extends State<ProductCreateScreen> {
  Map<String, String> formValues = {
    "Img": "",
    "ProductCode": "",
    "ProductName": "",
    "Qty": "",
    "TotalPrice": "",
    "UnitPrice": "",
  };
  bool loading = false;

  inputOnChange(mapKey, textValue) {
    setState(() {
      formValues.update(mapKey, (value) => textValue);
    });
  }

  formOnSubmit() async {
    if (formValues['Img']!.isEmpty) {
      errorToast('Image Link Required !');
    } else if (formValues['ProductCode']!.isEmpty) {
      errorToast('Product Code Required !');
    } else if (formValues['ProductName']!.isEmpty) {
      errorToast('Product Name Required !');
    } else if (formValues['Qty']!.isEmpty) {
      errorToast('Product Qty Required !');
    } else if (formValues['TotalPrice']!.isEmpty) {
      errorToast('Total Price Required !');
    } else if (formValues['UnitPrice']!.isEmpty) {
      errorToast('Unit Price Required !');
    } else {
      setState(() {
        loading = true;
      });
      await productCreateRequest(formValues);
      formValues = {
        "Img": "",
        "ProductCode": "",
        "ProductName": "",
        "Qty": "",
        "TotalPrice": "",
        "UnitPrice": "",
      };
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Product'),
        // automaticallyImplyLeading: false,
      ),
      body: loading
          ? Center(child: CircularProgressIndicator())
          : Stack(
              children: [
                // full screen background
                screenBackground(context),
                // main content
                SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        TextFormField(
                          onChanged: (value) {
                            inputOnChange("ProductName", value);
                          },
                          decoration: appInputDecoration('Name'),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          onChanged: (value) {
                            inputOnChange("ProductCode", value);
                          },
                          decoration: appInputDecoration('Product Code'),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          onChanged: (value) {
                            inputOnChange("Img", value);
                          },
                          decoration: appInputDecoration('Product Image'),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          onChanged: (value) {
                            inputOnChange("UnitPrice", value);
                          },
                          decoration: appInputDecoration('Unit Price'),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          onChanged: (value) {
                            inputOnChange("TotalPrice", value);
                          },
                          decoration: appInputDecoration('Total Price'),
                        ),
                        SizedBox(height: 20),
                        appDropDownStyle(
                          DropdownButton<String>(
                            value: formValues["Qty"]!.isEmpty
                                ? "Select Qt"
                                : formValues["Qty"],
                            onChanged: (value) {
                              setState(() {
                                formValues["Qty"] = value ?? "";
                              });
                            },
                            items: [
                              DropdownMenuItem(
                                value: "Select Qt",
                                child: Text('Select Qt'),
                              ),
                              DropdownMenuItem(
                                value: "1 pcs",
                                child: Text('1 pcs'),
                              ),
                              DropdownMenuItem(
                                value: '2 pcs',
                                child: Text('2 pcs'),
                              ),
                              DropdownMenuItem(
                                value: '3 pcs',
                                child: Text('3 pcs'),
                              ),
                              DropdownMenuItem(
                                value: '4 pcs',
                                child: Text('4 pcs'),
                              ),
                            ],
                            isExpanded: true,
                            underline: Container(),
                          ),
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: appButtonStyle(),
                            onPressed: () {
                              formOnSubmit();
                            },
                            child: successButtonChild('Create'),
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
