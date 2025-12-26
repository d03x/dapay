part of "saldo_widget.dart";

class SaldoState extends Notifier<bool> {
  @override
  bool build() {
    return false;
  }

  void toggle() {
    state = !state;
  }
}

final saldoWidgetProvider = NotifierProvider<SaldoState, bool>(() {
  return SaldoState();
});
