class CatalogModel {
  static List<Item> items = [];
}



class Item {
  // ignore: non_constant_identifier_names
  final int Id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String imageUrl;

  // ignore: non_constant_identifier_names
  Item({required this.Id, required this.name, required this.desc, required this.price, required this.color, required this.imageUrl});

  factory Item.fromMap(Map<String,dynamic> map) {
    return Item(
      Id : map["id"],
      name: map["name"],
      desc: map["desc"],
      price: map["price"],
      color: map["color"],
      imageUrl: map["image"],
    );
  }
  toMap() => {
    "id" :Id,
    "name" :name,
    "desc" :desc,
    "price" :price,
    "color" :color,
    "imageUrl" :imageUrl,
  };
}

final products = [
  Item(
    Id : 1,
    name: "Iphone 12 Pro",
    desc: "Apple Iphone 12th Generation",
    price: 999,
    color: "#33505a",
    imageUrl: "https://www.google.com/imgres?imgurl=https%3A%2F%2Fstore.storeimages.cdn-apple.com%2F4668%2Fas-images.apple.com%2Fis%2Fiphone-12-blue-select-2020%3Fwid%3D940%26hei%3D1112%26fmt%3Dpng-alpha%26.v%3D1604343704000&imgrefurl=https%3A%2F%2Fwww.apple.com%2Fin%2Fshop%2Fbuy-iphone%2Fiphone-12%2F6.1-inch-display-64gb-blue&tbnid=c8o3P3ld8pXOPM&vet=12ahUKEwjgmKOkxpvxAhXfhUsFHQYRBCUQMygAegUIARDeAQ..i&docid=0AkExe2z7H3UAM&w=940&h=1112&q=iphone%2012%20image&ved=2ahUKEwjgmKOkxpvxAhXfhUsFHQYRBCUQMygAegUIARDeAQ"
  )
];