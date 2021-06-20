import 'package:catalog_app/models/cart.dart';
import 'package:catalog_app/models/catalog.dart';
import 'package:catalog_app/store/store.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_lorem/flutter_lorem.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({Key? key, required this.catalog}) :
        assert(catalog != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.white60,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.xl4.red500.make(),
            _AddToCart(catalog: catalog,).wh(150, 50)
          ],
        ).p16(),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Hero(tag:Key(catalog.Id.toString()),
            child: Text(catalog.name,textAlign: TextAlign.center,)
            ).p16(),
            Expanded(
              child: VxArc(
              height: 30.0,
              edge: VxEdge.TOP,
              arcType: VxArcType.CONVEY,
              child: Container(
                color: Colors.white,
                width: context.screenWidth,
                child: Column(
                  children: [
                    catalog.name.text.xl4.color(Colors.blue).bold.make(),
                    catalog.desc.text.textStyle(context.captionStyle!).xl.make(),
                    10.heightBox,
                    lorem(paragraphs: 2,words: 60).
                    text.textStyle(context.captionStyle!).xl.make(),
                  ],
                ).py64(),
              ),
            ),
            )
          ],
        ),
      ),
    );
  }
}

class _AddToCart extends StatelessWidget {
  final Item catalog;
  _AddToCart({
    Key? key, required this.catalog,
  }) : super(key: key);

  // final _cart = CartModel();
  @override
  Widget build(BuildContext context) {

    VxState.watch(context, on: [AddMutation]);// redraws the whole widget as setState works
    final CartModel _cart = (VxState.store as MyStore).cart;

    bool isInCart = _cart.items.contains(catalog) ? true:false;
    return ElevatedButton(
      onPressed: () {
        isInCart.toggle();
        if (!isInCart) {
          AddMutation(catalog);
          // setState(() {});
        }
      },
      style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(Colors.indigoAccent),
          shape: MaterialStateProperty.all(
            StadiumBorder(),
          )),
      child: isInCart ? Icon(Icons.done) : "Add To Cart".text.make(),
    );
  }
}
