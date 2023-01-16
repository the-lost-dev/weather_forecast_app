class Temperature {
  Temperature.celsius(this.celsius);
  factory Temperature.fahrenheit(double fahrenheit) =>
      Temperature.celsius((fahrenheit - 32) / 1.8);
  factory Temperature.kelvin(double kelvin) =>
      Temperature.celsius(kelvin - absoluteZero);

  static double absoluteZero = 273.15;

  final double celsius;
  double get fahrenheit => celsius * 1.8 + 32;

  @override
  String toString() => 'Temperature(celsius: $celsius)';

  @override
  bool operator ==(covariant Temperature other) {
    if (identical(this, other)) return true;

    return other.celsius == celsius;
  }

  @override
  int get hashCode => celsius.hashCode;
}
