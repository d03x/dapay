part of "extension.dart";

extension NumberExtension on num {
  String toIDR() {
    final format = NumberFormat.currency(
      locale: "id_ID",
      symbol: "Rp. ",
      decimalDigits: 0,
    );
    return format.format(this);
  }
}
