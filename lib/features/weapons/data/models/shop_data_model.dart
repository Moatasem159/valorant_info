import 'package:valorant_info/features/weapons/domain/entities/shop_data.dart';

class ShopDataModel extends ShopData {
  ShopDataModel({
    super.cost,
    super.categoryText,
    super.newImage,
  });
  factory ShopDataModel.fromJson(Map<String, dynamic> json) => ShopDataModel(
    cost: json["cost"]??0,
    categoryText: json["categoryText"]??'',
    newImage: json["newImage"]??'',
  );

 static Map<String, dynamic> toJson(ShopData shopData) => {
    "cost":shopData.cost,
    "categoryText": shopData.categoryText,
    "newImage": shopData.newImage,
  };
}
