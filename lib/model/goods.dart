import 'package:intl/intl.dart';

class Goods{
  String name;
  int price;
  int qty;

  Goods({required this.name, required this.price, required this.qty});

  Goods copyWith({String? name,int? price,int? qty}){
    return Goods(
      price: price ?? this.price,
      name: name ?? this.name,
      qty:  qty ?? this.qty
    );
  }

  String get formattedPrice {
    try {
      return NumberFormat.currency(
          locale: "eng_US", symbol: "Rp ", decimalDigits: 0)
          .format(price);
    } catch (e, s) {
      return "-";
    }
  }

  String get formattedTotal {
    int total=qty*price;
    try {
      return NumberFormat.currency(
          locale: "eng_US", symbol: "Rp ", decimalDigits: 0)
          .format(total);
    } catch (e, s) {
      return "-";
    }
  }


  String get formattedQty {
    try {
      return NumberFormat.currency(
          locale: "eng_US", symbol: "", decimalDigits: 0)
          .format(qty);
    } catch (e, s) {
      return "-";
    }
  }



}