import '../../domain/entities/product.dart';

class ProductModel extends Product {

  ProductModel({required super.prID, required super.prName, required super.price, required super.qty});

  ProductModel copyWith({int? prID, String? id, String? prName, dynamic price, int? qty}) {
    return ProductModel(prID: prID ?? this.prID,
        prName: prName ?? this.prName,
        price: price ?? this.price,
        qty: qty ?? this.qty);
  }

  @override
  List<Object?> get props => [];
}