class Fee {
  int? id;
  double baseFee;
  double pricePerUnit;
  double monthlyDiscount;
  DateTime dateStart;
  DateTime dateEnd;

  Fee(
      {this.id,
      required this.baseFee,
      required this.pricePerUnit,
      required this.monthlyDiscount,
      required this.dateStart,
      required this.dateEnd});
}
