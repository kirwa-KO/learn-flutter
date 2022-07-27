import "package:flutter/material.dart";
import 'package:flutter_complete_guide/providers/Product.dart';
import 'package:flutter_complete_guide/providers/ProductsProvider.dart';
import 'package:provider/provider.dart';

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
  bool _isInit = true;
  bool _isLoading = false;

  Product editedProduct = Product(
      id: null, title: null, description: null, price: null, imageUrl: null);

  Map<String, String> _initValues = {
    "title": "",
    "price": "",
    "description": "",
    "imageUrl": "",
  };

  void initState() {
    _imageUrlFocusNode.addListener(_updateImageUrl);
    super.initState();
  }

  void didChangeDependencies() {
    if (_isInit) {
      final productId = ModalRoute.of(context).settings.arguments as String;
      if (productId != null) {
        editedProduct =
            Provider.of<ProductsProvider>(context).findById(productId);
        _initValues = {
          "title": editedProduct.title,
          "price": editedProduct.price.toString(),
          "description": editedProduct.description,
          //   "imageUrl": "",
        };
        _imageURLController.text = editedProduct.imageUrl;
      }
    }
    _isInit = false;
    super.didChangeDependencies();
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
    final isValid = _formKey.currentState.validate();
    if (!isValid) return;
    _formKey.currentState.save();

    // print(editedProduct.title);
    // print(editedProduct.price);
    // print(editedProduct.description);
    // print(editedProduct.imageUrl);
    setState(() {
      _isLoading = true;
    });

    if (editedProduct.id != null) {
      Provider.of<ProductsProvider>(context, listen: false)
          .updareProduct(editedProduct.id, editedProduct);
      setState(() {
        _isLoading = false;
      });
    } else {
      Provider.of<ProductsProvider>(context, listen: false)
          .addProduct(editedProduct);
      setState(() {
        _isLoading = false;
      });
    }

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
//   print(_isLoading);
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
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    TextFormField(
                      initialValue: _initValues["title"],
                      decoration: InputDecoration(labelText: "Title"),
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_priceFocusNode);
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Please provide a value...!!";
                        }
                        return null;
                      },
                      onSaved: (val) {
                        editedProduct = Product(
                            id: editedProduct.id,
                            isFavorite: editedProduct.isFavorite,
                            title: val,
                            description: editedProduct.description,
                            price: editedProduct.price,
                            imageUrl: editedProduct.imageUrl);
                      },
                    ),
                    TextFormField(
                      initialValue: _initValues["price"],
                      decoration: InputDecoration(labelText: "Price"),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      focusNode: _priceFocusNode,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context)
                            .requestFocus(_descriptionFocusNode);
                      },
                      validator: (value) {
                        if (value.isEmpty) return "Please provide a price";
                        if (double.tryParse(value) == null)
                          return "Please provice a price number";
                        if (double.parse(value) <= 0)
                          return "Please enter a number greater than 0";
                        return null;
                      },
                      onSaved: (val) {
                        editedProduct = Product(
                            id: editedProduct.id,
                            isFavorite: editedProduct.isFavorite,
                            title: editedProduct.title,
                            description: editedProduct.description,
                            price: double.parse(val),
                            imageUrl: editedProduct.imageUrl);
                      },
                    ),
                    TextFormField(
                      initialValue: _initValues["description"],
                      decoration: InputDecoration(labelText: "Description"),
                      maxLines: 3,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.multiline,
                      focusNode: _descriptionFocusNode,
                      validator: (value) {
                        if (value.isEmpty) return "Provide a description";
                        if (value.length < 10)
                          return "PRovide a description greater than 10 characters";
                        return null;
                      },
                      onSaved: (val) {
                        editedProduct = Product(
                            id: editedProduct.id,
                            isFavorite: editedProduct.isFavorite,
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
                                  color: Theme.of(context).primaryColor,
                                  width: 2)),
                          child: _imageURLController.text.isEmpty
                              ? Text("Enter Image Url")
                              : FittedBox(
                                  child:
                                      Image.network(_imageURLController.text),
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
                                  id: editedProduct.id,
                                  isFavorite: editedProduct.isFavorite,
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
