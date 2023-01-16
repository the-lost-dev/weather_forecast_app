import 'package:json_annotation/json_annotation.dart';

part 'wind_param.g.dart';

@JsonSerializable()
class WindParam {
  const WindParam({
    required this.speed,
  });

  final double speed;

  factory WindParam.fromJson(Map<String, dynamic> json) =>
      _$WindParamFromJson(json);

  Map<String, dynamic> toJson() => _$WindParamToJson(this);

  @override
  String toString() => 'WindParam(speed: $speed)';

  @override
  bool operator ==(covariant WindParam other) {
    if (identical(this, other)) return true;

    return other.speed == speed;
  }

  @override
  int get hashCode => speed.hashCode;
}
