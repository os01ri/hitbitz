enum PaymentMethod {
  none,
  cash,
  latter,
  creditCard;

  static const PaymentMethod defaultMethod = cash;

  factory PaymentMethod.getByIndex(int? index) => switch (index) {
        1 => cash,
        2 => latter,
        3 => creditCard,
        _ => none,
      };
}
