// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kana_key_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$KanaKeyModel implements DiagnosticableTreeMixin {
  String get mainCharacter;
  Map<FlickDirection, String> get flickCharacterMap;
  bool get isFlicking;
  FlickDirection get currentFlickDirection;

  /// Create a copy of KanaKeyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $KanaKeyModelCopyWith<KanaKeyModel> get copyWith =>
      _$KanaKeyModelCopyWithImpl<KanaKeyModel>(
          this as KanaKeyModel, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'KanaKeyModel'))
      ..add(DiagnosticsProperty('mainCharacter', mainCharacter))
      ..add(DiagnosticsProperty('flickCharacterMap', flickCharacterMap))
      ..add(DiagnosticsProperty('isFlicking', isFlicking))
      ..add(
          DiagnosticsProperty('currentFlickDirection', currentFlickDirection));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is KanaKeyModel &&
            (identical(other.mainCharacter, mainCharacter) ||
                other.mainCharacter == mainCharacter) &&
            const DeepCollectionEquality()
                .equals(other.flickCharacterMap, flickCharacterMap) &&
            (identical(other.isFlicking, isFlicking) ||
                other.isFlicking == isFlicking) &&
            (identical(other.currentFlickDirection, currentFlickDirection) ||
                other.currentFlickDirection == currentFlickDirection));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      mainCharacter,
      const DeepCollectionEquality().hash(flickCharacterMap),
      isFlicking,
      currentFlickDirection);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'KanaKeyModel(mainCharacter: $mainCharacter, flickCharacterMap: $flickCharacterMap, isFlicking: $isFlicking, currentFlickDirection: $currentFlickDirection)';
  }
}

/// @nodoc
abstract mixin class $KanaKeyModelCopyWith<$Res> {
  factory $KanaKeyModelCopyWith(
          KanaKeyModel value, $Res Function(KanaKeyModel) _then) =
      _$KanaKeyModelCopyWithImpl;
  @useResult
  $Res call(
      {String mainCharacter,
      Map<FlickDirection, String> flickCharacterMap,
      bool isFlicking,
      FlickDirection currentFlickDirection});
}

/// @nodoc
class _$KanaKeyModelCopyWithImpl<$Res> implements $KanaKeyModelCopyWith<$Res> {
  _$KanaKeyModelCopyWithImpl(this._self, this._then);

  final KanaKeyModel _self;
  final $Res Function(KanaKeyModel) _then;

  /// Create a copy of KanaKeyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mainCharacter = null,
    Object? flickCharacterMap = null,
    Object? isFlicking = null,
    Object? currentFlickDirection = null,
  }) {
    return _then(_self.copyWith(
      mainCharacter: null == mainCharacter
          ? _self.mainCharacter
          : mainCharacter // ignore: cast_nullable_to_non_nullable
              as String,
      flickCharacterMap: null == flickCharacterMap
          ? _self.flickCharacterMap
          : flickCharacterMap // ignore: cast_nullable_to_non_nullable
              as Map<FlickDirection, String>,
      isFlicking: null == isFlicking
          ? _self.isFlicking
          : isFlicking // ignore: cast_nullable_to_non_nullable
              as bool,
      currentFlickDirection: null == currentFlickDirection
          ? _self.currentFlickDirection
          : currentFlickDirection // ignore: cast_nullable_to_non_nullable
              as FlickDirection,
    ));
  }
}

/// @nodoc

class _KanaKeyModel extends KanaKeyModel with DiagnosticableTreeMixin {
  const _KanaKeyModel(
      {required this.mainCharacter,
      required final Map<FlickDirection, String> flickCharacterMap,
      this.isFlicking = false,
      this.currentFlickDirection = FlickDirection.none})
      : _flickCharacterMap = flickCharacterMap,
        super._();

  @override
  final String mainCharacter;
  final Map<FlickDirection, String> _flickCharacterMap;
  @override
  Map<FlickDirection, String> get flickCharacterMap {
    if (_flickCharacterMap is EqualUnmodifiableMapView)
      return _flickCharacterMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_flickCharacterMap);
  }

  @override
  @JsonKey()
  final bool isFlicking;
  @override
  @JsonKey()
  final FlickDirection currentFlickDirection;

  /// Create a copy of KanaKeyModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$KanaKeyModelCopyWith<_KanaKeyModel> get copyWith =>
      __$KanaKeyModelCopyWithImpl<_KanaKeyModel>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'KanaKeyModel'))
      ..add(DiagnosticsProperty('mainCharacter', mainCharacter))
      ..add(DiagnosticsProperty('flickCharacterMap', flickCharacterMap))
      ..add(DiagnosticsProperty('isFlicking', isFlicking))
      ..add(
          DiagnosticsProperty('currentFlickDirection', currentFlickDirection));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _KanaKeyModel &&
            (identical(other.mainCharacter, mainCharacter) ||
                other.mainCharacter == mainCharacter) &&
            const DeepCollectionEquality()
                .equals(other._flickCharacterMap, _flickCharacterMap) &&
            (identical(other.isFlicking, isFlicking) ||
                other.isFlicking == isFlicking) &&
            (identical(other.currentFlickDirection, currentFlickDirection) ||
                other.currentFlickDirection == currentFlickDirection));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      mainCharacter,
      const DeepCollectionEquality().hash(_flickCharacterMap),
      isFlicking,
      currentFlickDirection);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'KanaKeyModel(mainCharacter: $mainCharacter, flickCharacterMap: $flickCharacterMap, isFlicking: $isFlicking, currentFlickDirection: $currentFlickDirection)';
  }
}

/// @nodoc
abstract mixin class _$KanaKeyModelCopyWith<$Res>
    implements $KanaKeyModelCopyWith<$Res> {
  factory _$KanaKeyModelCopyWith(
          _KanaKeyModel value, $Res Function(_KanaKeyModel) _then) =
      __$KanaKeyModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String mainCharacter,
      Map<FlickDirection, String> flickCharacterMap,
      bool isFlicking,
      FlickDirection currentFlickDirection});
}

/// @nodoc
class __$KanaKeyModelCopyWithImpl<$Res>
    implements _$KanaKeyModelCopyWith<$Res> {
  __$KanaKeyModelCopyWithImpl(this._self, this._then);

  final _KanaKeyModel _self;
  final $Res Function(_KanaKeyModel) _then;

  /// Create a copy of KanaKeyModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? mainCharacter = null,
    Object? flickCharacterMap = null,
    Object? isFlicking = null,
    Object? currentFlickDirection = null,
  }) {
    return _then(_KanaKeyModel(
      mainCharacter: null == mainCharacter
          ? _self.mainCharacter
          : mainCharacter // ignore: cast_nullable_to_non_nullable
              as String,
      flickCharacterMap: null == flickCharacterMap
          ? _self._flickCharacterMap
          : flickCharacterMap // ignore: cast_nullable_to_non_nullable
              as Map<FlickDirection, String>,
      isFlicking: null == isFlicking
          ? _self.isFlicking
          : isFlicking // ignore: cast_nullable_to_non_nullable
              as bool,
      currentFlickDirection: null == currentFlickDirection
          ? _self.currentFlickDirection
          : currentFlickDirection // ignore: cast_nullable_to_non_nullable
              as FlickDirection,
    ));
  }
}

// dart format on
