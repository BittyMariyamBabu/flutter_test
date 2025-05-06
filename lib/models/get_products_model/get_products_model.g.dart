// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_products_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetProductsModel _$GetProductsModelFromJson(Map<String, dynamic> json) =>
    GetProductsModel(
      products:
          (json['products'] as List<dynamic>?)
              ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
              .toList(),
      total: (json['total'] as num?)?.toInt(),
      skip: (json['skip'] as num?)?.toInt(),
      limit: (json['limit'] as num?)?.toInt(),
    );

Map<String, dynamic> _$GetProductsModelToJson(GetProductsModel instance) =>
    <String, dynamic>{
      'products': instance.products,
      'total': instance.total,
      'skip': instance.skip,
      'limit': instance.limit,
    };
