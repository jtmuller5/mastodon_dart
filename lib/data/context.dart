import 'package:json_annotation/json_annotation.dart';

import 'status.dart';

part 'context.g.dart';

/// https://docs.joinmastodon.org/api/entities/#context

@JsonSerializable(
  nullable: false,
  createToJson: false,
  fieldRename: FieldRename.snake,
)
class Context {
  final List<Status> ancestors;
  final List<Status> descendants;

  Context({
    this.ancestors,
    this.descendants,
  });

  factory Context.fromJson(Map<String, dynamic> json) =>
      _$ContextFromJson(json);
}
