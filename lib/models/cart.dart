import 'package:catalog_app/models/catalog.dart';
import 'package:catalog_app/store/store.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {

  // static final cartModel;

  //Creating Singleton in this way !
  // CartModel._internal();
  // factory CartModel() => cartModel;

  late CatalogModel _catalog;

  //Collection of Ids of each item
  final List<int> _itemIds = [];

  // get catalog
  CatalogModel get catalog => _catalog;

  //set catalog
  set catalog(CatalogModel newCatalog) {
    assert(newCatalog!=null);
    _catalog = newCatalog;
  }

  // Get item into cart
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  // Get total Price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  // Add items
  void add(Item item) {
    _itemIds.add(item.Id);
  }

  //Remove items
  void remove(Item item) {
    _itemIds.remove(item.Id);
  }
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);
  @override
  perform() {
    store!.cart._itemIds.add(item.Id);
  }

}