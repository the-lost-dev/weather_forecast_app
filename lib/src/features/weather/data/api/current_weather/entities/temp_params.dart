// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'temp_params.g.dart';

@JsonSerializable()
class TempParams {
  const TempParams({
    required this.temp,
    required this.temp_min,
    required this.temp_max,
    required this.humidity,
  });

  final double temp;
  final double temp_min;
  final double temp_max;
  final int humidity;

  factory TempParams.fromJson(Map<String, dynamic> json) =>
      _$TempParamsFromJson(json);

  Map<String, dynamic> toJson() => _$TempParamsToJson(this);

  @override
  String toString() {
    return 'TempParams(temp: $temp, temp_min: $temp_min, temp_max: $temp_max, humidity: $humidity)';
  }

  @override
  bool operator ==(covariant TempParams other) {
    if (identical(this, other)) return true;

    return other.temp == temp &&
        other.temp_min == temp_min &&
        other.temp_max == temp_max &&
        other.humidity == humidity;
  }

  @override
  int get hashCode {
    return temp.hashCode ^
        temp_min.hashCode ^
        temp_max.hashCode ^
        humidity.hashCode;
  }
}
