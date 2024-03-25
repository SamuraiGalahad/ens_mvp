// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contacts_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Contacts _$ContactsFromJson(Map<String, dynamic> json) {
  return _Contacts.fromJson(json);
}

/// @nodoc
mixin _$Contacts {
  String get address => throw _privateConstructorUsedError;
  String get command => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContactsCopyWith<Contacts> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactsCopyWith<$Res> {
  factory $ContactsCopyWith(Contacts value, $Res Function(Contacts) then) =
      _$ContactsCopyWithImpl<$Res, Contacts>;
  @useResult
  $Res call({String address, String command});
}

/// @nodoc
class _$ContactsCopyWithImpl<$Res, $Val extends Contacts>
    implements $ContactsCopyWith<$Res> {
  _$ContactsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? command = null,
  }) {
    return _then(_value.copyWith(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      command: null == command
          ? _value.command
          : command // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContactsImplCopyWith<$Res>
    implements $ContactsCopyWith<$Res> {
  factory _$$ContactsImplCopyWith(
          _$ContactsImpl value, $Res Function(_$ContactsImpl) then) =
      __$$ContactsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String address, String command});
}

/// @nodoc
class __$$ContactsImplCopyWithImpl<$Res>
    extends _$ContactsCopyWithImpl<$Res, _$ContactsImpl>
    implements _$$ContactsImplCopyWith<$Res> {
  __$$ContactsImplCopyWithImpl(
      _$ContactsImpl _value, $Res Function(_$ContactsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? command = null,
  }) {
    return _then(_$ContactsImpl(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      command: null == command
          ? _value.command
          : command // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContactsImpl implements _Contacts {
  const _$ContactsImpl({required this.address, required this.command});

  factory _$ContactsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContactsImplFromJson(json);

  @override
  final String address;
  @override
  final String command;

  @override
  String toString() {
    return 'Contacts(address: $address, command: $command)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContactsImpl &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.command, command) || other.command == command));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, address, command);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContactsImplCopyWith<_$ContactsImpl> get copyWith =>
      __$$ContactsImplCopyWithImpl<_$ContactsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContactsImplToJson(
      this,
    );
  }
}

abstract class _Contacts implements Contacts {
  const factory _Contacts(
      {required final String address,
      required final String command}) = _$ContactsImpl;

  factory _Contacts.fromJson(Map<String, dynamic> json) =
      _$ContactsImpl.fromJson;

  @override
  String get address;
  @override
  String get command;
  @override
  @JsonKey(ignore: true)
  _$$ContactsImplCopyWith<_$ContactsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
