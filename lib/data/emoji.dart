import 'package:json_annotation/json_annotation.dart';

part 'emoji.g.dart';

@JsonSerializable(
  nullable: false,
  createToJson: false,
  fieldRename: FieldRename.snake,
)
class Emoji {
  final String shortcode;
  final Uri staticUrl;
  final Uri url;
  final bool visibleInPicker;

  Emoji({this.shortcode, this.staticUrl, this.url, this.visibleInPicker});

  factory Emoji.fromJson(Map<String, dynamic> json) => _$EmojiFromJson(json);
}
