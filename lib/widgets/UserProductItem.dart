import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/providers/ProductsProvider.dart';
import 'package:flutter_complete_guide/screens/EditProductScreen.dart';
import 'package:provider/provider.dart';

class UserProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  const UserProductItem({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return (ListTile(
      title: Text(this.title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(this.imageUrl),
      ),
      trailing: Container(
        width: 100,
        child: Row(children: [
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamed(EditProductScreen.routeName, arguments: this.id);
            },
            icon: Icon(Icons.edit),
            color: Theme.of(context).primaryColor,
          ),
          IconButton(
            onPressed: () {
              Provider.of<ProductsProvider>(context, listen: false)
                  .deleteProduct(this.id);
            },
            icon: Icon(Icons.delete),
            color: Theme.of(context).errorColor,
          ),
        ]),
      ),
    ));
  }
}
