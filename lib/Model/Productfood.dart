import 'dart:convert';

List<Productfood> productfoodFromMap(String str) =>
    List<Productfood>.from(json.decode(str).map((x) => Productfood.fromMap(x)));

String productfoodToMap(List<Productfood> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Productfood {
  Productfood({
    this.foodid,
    this.foodname,
    this.foodprice,
    this.sizetype,
    this.producttype,
    this.foodimage,
  });

  String foodid;
  String foodname;
  String foodprice;
  String sizetype;
  String producttype;
  String foodimage;

  factory Productfood.fromMap(Map<String, dynamic> json) => Productfood(
        foodid: json["foodid"],
        foodname: json["foodname"],
        foodprice: json["foodprice"],
        sizetype: json["sizetype"],
        producttype: json["producttype"],
        foodimage: imagecorrection(json["foodimage"]),
      );

  Map<String, dynamic> toMap() => {
        "foodid": foodid,
        "foodname": foodname,
        "foodprice": foodprice,
        "sizetype": sizetype,
        "producttype": producttype,
        "foodim": foodimage,
      };
}

String imagecorrection(foodimage) {
  switch (foodimage.length % 4) {
    //case 1 fiha chak w mahich mjarba
    case 1:
      foodimage = foodimage;
      print("image 1");
      break;

    case 2:
      foodimage = foodimage + "++";
      print("image 2");
      break;

    case 3:
      foodimage = foodimage + "+";
      print("image 3");
      break;
  }
  return foodimage;
}
