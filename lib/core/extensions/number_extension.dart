part of "extension.dart";

extension NumberExtension on num {
  String toIDR({String symbol = "Rp. "}) {
    final format = NumberFormat.currency(
      locale: "id_ID",
      symbol: symbol,
      decimalDigits: 0,
    );
    return format.format(this);
  }
}
