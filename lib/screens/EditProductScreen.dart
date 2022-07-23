import "package:flutter/material.dart";
import 'package:flutter_complete_guide/providers/Product.dart';

class EditProductScreen extends StatefulWidget {
  static const routeName = "/edit-product";
  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _imageURLController = TextEditingController();
  final _imageUrlFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  Product editedProduct = Product(
      id: null, title: null, description: null, price: null, imageUrl: null);

  void initState() {
    _imageUrlFocusNode.addListener(_updateImageUrl);
    super.initState();
  }

  @override
  void dispose() {
    _imageURLController.removeListener(_updateImageUrl);
    _priceFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _imageURLController.dispose();
    _imageUrlFocusNode.dispose();
    super.dispose();
  }

  void _updateImageUrl() {
    if (!_imageUrlFocusNode.hasFocus) {
      setState(() {});
    }
  }

  void _saveForm() {
    _formKey.currentState.save();
    print(editedProduct.title);
    print(editedProduct.price);
    print(editedProduct.description);
    print(editedProduct.imageUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Product"),
        actions: [
          IconButton(
            onPressed: _saveForm,
            icon: Icon(Icons.save),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: "Title"),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_priceFocusNode);
                },
                onSaved: (val) {
                  editedProduct = Product(
                      id: DateTime.now().toString(),
                      title: val,
                      description: editedProduct.description,
                      price: editedProduct.price,
                      imageUrl: editedProduct.imageUrl);
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Price"),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                focusNode: _priceFocusNode,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_descriptionFocusNode);
                },
                onSaved: (val) {
                  editedProduct = Product(
                      id: DateTime.now().toString(),
                      title: editedProduct.title,
                      description: editedProduct.description,
                      price: double.parse(val),
                      imageUrl: editedProduct.imageUrl);
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Description"),
                maxLines: 3,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.multiline,
                focusNode: _descriptionFocusNode,
                onSaved: (val) {
                  editedProduct = Product(
                      id: DateTime.now().toString(),
                      title: editedProduct.title,
                      description: val,
                      price: editedProduct.price,
                      imageUrl: editedProduct.imageUrl);
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    margin: EdgeInsets.only(
                      top: 8,
                      right: 10,
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Theme.of(context).primaryColor, width: 2)),
                    child: _imageURLController.text.isEmpty
                        ? Text("Enter Image Url")
                        : FittedBox(
                            child: Image.network(_imageURLController.text),
                            fit: BoxFit.cover,
                          ),
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Image URL",
                      ),
                      focusNode: _imageUrlFocusNode,
                      keyboardType: TextInputType.url,
                      textInputAction: TextInputAction.done,
                      controller: _imageURLController,
                      onEditingComplete: () {
                        setState(() {});
                      },
                      onSaved: (val) {
                        editedProduct = Product(
                            id: DateTime.now().toString(),
                            title: editedProduct.title,
                            description: editedProduct.description,
                            price: editedProduct.price,
                            imageUrl: val);
                      },
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
