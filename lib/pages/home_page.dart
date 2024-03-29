import 'package:catalog_app/models/cart.dart';
import 'package:catalog_app/models/catalog.dart';
import 'package:catalog_app/pages/home_detail_page.dart';
import 'package:catalog_app/store/store.dart';
import 'package:catalog_app/utils/routes.dart';
import 'package:catalog_app/widgets/drawer.dart';
import 'package:catalog_app/widgets/item_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    final decodeData = jsonDecode(catalogJson);
    var productData = decodeData["products"];
    CatalogModel.items = List.from(productData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    // final dummyList = List.generate(50, (index) => CatalogModel.items[0]);
    return Scaffold(
      floatingActionButton: VxBuilder(
        builder: (context,_,status) => FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, MyRoutes.cartRoute);
          },
          child: Icon(CupertinoIcons.cart),
        ).badge(color: Vx.red500,size: 23,count: _cart.items.length),
        mutations: {RemoveMutation,AddMutation},
      ),
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)?ListView.builder(
          // itemCount: CatalogModel.items.length,
          itemCount: CatalogModel.items.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder:
                      (context) =>
                          HomeDetailPage(
                              catalog: CatalogModel.items[index])
                  )
              ),
              child: ItemWidget(
                item: CatalogModel.items[index],
                // item: dummyList[index],
              ),
            );
            },
        ): Center(
          child: CircularProgressIndicator(),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
