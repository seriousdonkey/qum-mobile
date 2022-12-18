class Fee {
  int? id;
  double baseFee;
  double pricePerUnit;
  double monthlyDiscount;

  Fee(
      {this.id,
      required this.baseFee,
      required this.pricePerUnit,
      required this.monthlyDiscount});
}
