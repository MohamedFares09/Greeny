const double kEgpToUsdRate = 50;

String getCurrency() {
  return "USD";
}

String formatPaypalAmount(num egpAmount) {
  return (egpAmount / kEgpToUsdRate).toStringAsFixed(2);
}
