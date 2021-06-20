import 'package:catalog_app/models/cart.dart';
import 'package:catalog_app/store/store.dart';
import 'package:catalog_app/widgets/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Mytheme.creamColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.make(),
      ),
      body: Column(
        children: [
          __CartList().p32().expand(),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  final CartModel _cart = (VxState.store as MyStore).cart;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxConsumer(
              builder: (context,_ ,status ) {
                return "\$${_cart.totalPrice}".text.xl3.color(Colors.deepPurple).make();
              },
              mutations: {RemoveMutation},
              notifications: {}
          ),
          30.widthBox,
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).
              showSnackBar(
                  SnackBar(content: "Buying not supported yet!".text.make())
              );
            },
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.yellow)),
            child: "Buy".text.color(Colors.blue).make(),
          ).w32(context)
        ],
      ),
    );
  }
}


class __CartList extends StatelessWidget {
  final CartModel _cart = (VxState.store as MyStore).cart;
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    return _cart.items.isEmpty ? "Nothing to show".text.xl3.makeCentered():ListView.builder(
      itemCount: (_cart.items.length!=0)?_cart.items.length:0,
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.done),
        trailing: IconButton(icon: Icon(Icons.remove_circle_outline),
          onPressed: () {
          RemoveMutation(_cart.items[index]);
          // setState(() {});
          },
        ),
        title: _cart.items[index].name.text.make(),
      ),
    );
  }
}


