import 'package:equatable/equatable.dart';

class Product extends Equatable {

   Product({
    required this.prID,
    required this.img,
    required this.prName,
    required this.price,
    required this.qty,
  });

  final int prID;
  final String prName;
  final String img;
  final dynamic price;
  int qty;

  @override
  List<Object?> get props => [prID];
}