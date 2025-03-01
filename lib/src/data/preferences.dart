import 'package:json_annotation/json_annotation.dart';
import 'package:mastodon_dart/src/mock/properties.dart';

part 'preferences.g.dart';

/// https://docs.joinmastodon.org/entities/preferences/
/// Represents a user's preferences.
@JsonSerializable(
  
  createToJson: false,
  fieldRename: FieldRename.snake,
)
class UserPreferences {
  /// Default visibility for new posts. Enumerated by [PostingVisibility].
  final PostingVisibility? defaultPostingVisibility;

  /// Default sensitivity flag for new posts
  final bool? isSensitiveByDefault;

  /// Default language for new posts
  @JsonKey()
  final dynamic defaultLanguage;

  /// Whether media attachments should be automatically displayed or blurred/hidden. Enumerated by [MediaDefaults].
  final MediaDefaults? mediaDefaults;

  /// Whether CWs should be expanded by default
  final bool? expandSpoilersByDefault;

  UserPreferences({
    this.defaultPostingVisibility,
    this.isSensitiveByDefault,
    this.defaultLanguage,
    this.mediaDefaults,
    this.expandSpoilersByDefault,
  });

  UserPreferences.mock()
      : defaultPostingVisibility = PostingVisibility.public,
        isSensitiveByDefault = MockProperties.boolean,
        defaultLanguage = 'en',
        mediaDefaults = MediaDefaults.defaultSensitive,
        expandSpoilersByDefault = MockProperties.boolean;

  factory UserPreferences.fromJson(Map<String, dynamic> json) =>
      _$UserPreferencesFromJson(json);
}

/// Default visibility for new posts.
/// - public = Public post
/// - unlisted = Unlisted post
/// - private = Followers-only post
/// - direct = Direct post
enum PostingVisibility { public, unlisted, private, direct }

/// Whether media attachments should be automatically displayed or blurred/hidden.
/// - default = Hide media marked as sensitive (cannot use 'default' keyword)
/// - show_all = Always show all media by default, regardless of sensitivity
/// - hide_all = Always hide all media by default, regardless of sensitivity
enum MediaDefaults { defaultSensitive, show_all, hide_all }
