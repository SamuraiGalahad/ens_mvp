import 'package:freezed_annotation/freezed_annotation.dart';

part 'contacts_model.freezed.dart';

part 'contacts_model.g.dart';

@freezed
class Contacts with _$Contacts {
  const factory Contacts({
    required String address,
    required String command
  }) = _Contacts;

  factory Contacts.fromJson(Map<String, Object?> json)
  => _$ContactsFromJson(json);
}