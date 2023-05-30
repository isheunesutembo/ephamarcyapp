// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'productitem.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductItem _$ProductItemFromJson(Map<String, dynamic> json) {
  return _ProductItem.fromJson(json);
}

/// @nodoc
mixin _$ProductItem {
  int get quantity => throw _privateConstructorUsedError;
  Product get productItem => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductItemCopyWith<ProductItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductItemCopyWith<$Res> {
  factory $ProductItemCopyWith(
          ProductItem value, $Res Function(ProductItem) then) =
      _$ProductItemCopyWithImpl<$Res, ProductItem>;
  @useResult
  $Res call({int quantity, Product productItem});

  $ProductCopyWith<$Res> get productItem;
}

/// @nodoc
class _$ProductItemCopyWithImpl<$Res, $Val extends ProductItem>
    implements $ProductItemCopyWith<$Res> {
  _$ProductItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quantity = null,
    Object? productItem = null,
  }) {
    return _then(_value.copyWith(
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      productItem: null == productItem
          ? _value.productItem
          : productItem // ignore: cast_nullable_to_non_nullable
              as Product,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductCopyWith<$Res> get productItem {
    return $ProductCopyWith<$Res>(_value.productItem, (value) {
      return _then(_value.copyWith(productItem: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ProductItemCopyWith<$Res>
    implements $ProductItemCopyWith<$Res> {
  factory _$$_ProductItemCopyWith(
          _$_ProductItem value, $Res Function(_$_ProductItem) then) =
      __$$_ProductItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int quantity, Product productItem});

  @override
  $ProductCopyWith<$Res> get productItem;
}

/// @nodoc
class __$$_ProductItemCopyWithImpl<$Res>
    extends _$ProductItemCopyWithImpl<$Res, _$_ProductItem>
    implements _$$_ProductItemCopyWith<$Res> {
  __$$_ProductItemCopyWithImpl(
      _$_ProductItem _value, $Res Function(_$_ProductItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quantity = null,
    Object? productItem = null,
  }) {
    return _then(_$_ProductItem(
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      productItem: null == productItem
          ? _value.productItem
          : productItem // ignore: cast_nullable_to_non_nullable
              as Product,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProductItem implements _ProductItem {
  _$_ProductItem({required this.quantity, required this.productItem});

  factory _$_ProductItem.fromJson(Map<String, dynamic> json) =>
      _$$_ProductItemFromJson(json);

  @override
  final int quantity;
  @override
  final Product productItem;

  @override
  String toString() {
    return 'ProductItem(quantity: $quantity, productItem: $productItem)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductItem &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.productItem, productItem) ||
                other.productItem == productItem));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, quantity, productItem);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductItemCopyWith<_$_ProductItem> get copyWith =>
      __$$_ProductItemCopyWithImpl<_$_ProductItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductItemToJson(
      this,
    );
  }
}

abstract class _ProductItem implements ProductItem {
  factory _ProductItem(
      {required final int quantity,
      required final Product productItem}) = _$_ProductItem;

  factory _ProductItem.fromJson(Map<String, dynamic> json) =
      _$_ProductItem.fromJson;

  @override
  int get quantity;
  @override
  Product get productItem;
  @override
  @JsonKey(ignore: true)
  _$$_ProductItemCopyWith<_$_ProductItem> get copyWith =>
      throw _privateConstructorUsedError;
}
