// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'index_bottom_bar.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BottomBar {
  int get currentIndex => throw _privateConstructorUsedError;
  List<MyNavItem> get items => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BottomBarCopyWith<BottomBar> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BottomBarCopyWith<$Res> {
  factory $BottomBarCopyWith(BottomBar value, $Res Function(BottomBar) then) =
      _$BottomBarCopyWithImpl<$Res, BottomBar>;
  @useResult
  $Res call({int currentIndex, List<MyNavItem> items});
}

/// @nodoc
class _$BottomBarCopyWithImpl<$Res, $Val extends BottomBar>
    implements $BottomBarCopyWith<$Res> {
  _$BottomBarCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentIndex = null,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      currentIndex: null == currentIndex
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<MyNavItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BottomBarImplCopyWith<$Res>
    implements $BottomBarCopyWith<$Res> {
  factory _$$BottomBarImplCopyWith(
          _$BottomBarImpl value, $Res Function(_$BottomBarImpl) then) =
      __$$BottomBarImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int currentIndex, List<MyNavItem> items});
}

/// @nodoc
class __$$BottomBarImplCopyWithImpl<$Res>
    extends _$BottomBarCopyWithImpl<$Res, _$BottomBarImpl>
    implements _$$BottomBarImplCopyWith<$Res> {
  __$$BottomBarImplCopyWithImpl(
      _$BottomBarImpl _value, $Res Function(_$BottomBarImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentIndex = null,
    Object? items = null,
  }) {
    return _then(_$BottomBarImpl(
      currentIndex: null == currentIndex
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<MyNavItem>,
    ));
  }
}

/// @nodoc

class _$BottomBarImpl implements _BottomBar {
  const _$BottomBarImpl(
      {required this.currentIndex, required final List<MyNavItem> items})
      : _items = items;

  @override
  final int currentIndex;
  final List<MyNavItem> _items;
  @override
  List<MyNavItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'BottomBar(currentIndex: $currentIndex, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BottomBarImpl &&
            (identical(other.currentIndex, currentIndex) ||
                other.currentIndex == currentIndex) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, currentIndex, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BottomBarImplCopyWith<_$BottomBarImpl> get copyWith =>
      __$$BottomBarImplCopyWithImpl<_$BottomBarImpl>(this, _$identity);
}

abstract class _BottomBar implements BottomBar {
  const factory _BottomBar(
      {required final int currentIndex,
      required final List<MyNavItem> items}) = _$BottomBarImpl;

  @override
  int get currentIndex;
  @override
  List<MyNavItem> get items;
  @override
  @JsonKey(ignore: true)
  _$$BottomBarImplCopyWith<_$BottomBarImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
