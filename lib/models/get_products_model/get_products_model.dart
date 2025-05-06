import 'package:json_annotation/json_annotation.dart';

import 'product.dart';

part 'get_products_model.g.dart';

@JsonSerializable()
class GetProductsModel {
  List<Product>? products;
  int? total;
  int? skip;
  int? limit;

  GetProductsModel({this.products, this.total, this.skip, this.limit});

  factory GetProductsModel.fromJson(Map<String, dynamic> json) {
    return _$GetProductsModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetProductsModelToJson(this);
}
