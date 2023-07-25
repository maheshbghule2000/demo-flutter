import 'package:json_annotation/json_annotation.dart';

part 'query_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Query {
  Query();

  factory Query.fromJson(Map<String, dynamic> json) =>
      _$QueryFromJson(json);

  Map<String, dynamic> toJson() => _$QueryToJson(this);

}

