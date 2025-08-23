// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kana_key_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$kanaKeyViewModelHash() => r'ba43bd6e6dab09166222683ce8054bb378957883';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$KanaKeyViewModel
    extends BuildlessAutoDisposeNotifier<KanaKeyModel> {
  late final String mainCharacter;
  late final Map<FlickDirection, String> flickCharacterMap;

  KanaKeyModel build({
    required String mainCharacter,
    required Map<FlickDirection, String> flickCharacterMap,
  });
}

/// See also [KanaKeyViewModel].
@ProviderFor(KanaKeyViewModel)
const kanaKeyViewModelProvider = KanaKeyViewModelFamily();

/// See also [KanaKeyViewModel].
class KanaKeyViewModelFamily extends Family<KanaKeyModel> {
  /// See also [KanaKeyViewModel].
  const KanaKeyViewModelFamily();

  /// See also [KanaKeyViewModel].
  KanaKeyViewModelProvider call({
    required String mainCharacter,
    required Map<FlickDirection, String> flickCharacterMap,
  }) {
    return KanaKeyViewModelProvider(
      mainCharacter: mainCharacter,
      flickCharacterMap: flickCharacterMap,
    );
  }

  @override
  KanaKeyViewModelProvider getProviderOverride(
    covariant KanaKeyViewModelProvider provider,
  ) {
    return call(
      mainCharacter: provider.mainCharacter,
      flickCharacterMap: provider.flickCharacterMap,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'kanaKeyViewModelProvider';
}

/// See also [KanaKeyViewModel].
class KanaKeyViewModelProvider
    extends AutoDisposeNotifierProviderImpl<KanaKeyViewModel, KanaKeyModel> {
  /// See also [KanaKeyViewModel].
  KanaKeyViewModelProvider({
    required String mainCharacter,
    required Map<FlickDirection, String> flickCharacterMap,
  }) : this._internal(
          () => KanaKeyViewModel()
            ..mainCharacter = mainCharacter
            ..flickCharacterMap = flickCharacterMap,
          from: kanaKeyViewModelProvider,
          name: r'kanaKeyViewModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$kanaKeyViewModelHash,
          dependencies: KanaKeyViewModelFamily._dependencies,
          allTransitiveDependencies:
              KanaKeyViewModelFamily._allTransitiveDependencies,
          mainCharacter: mainCharacter,
          flickCharacterMap: flickCharacterMap,
        );

  KanaKeyViewModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.mainCharacter,
    required this.flickCharacterMap,
  }) : super.internal();

  final String mainCharacter;
  final Map<FlickDirection, String> flickCharacterMap;

  @override
  KanaKeyModel runNotifierBuild(
    covariant KanaKeyViewModel notifier,
  ) {
    return notifier.build(
      mainCharacter: mainCharacter,
      flickCharacterMap: flickCharacterMap,
    );
  }

  @override
  Override overrideWith(KanaKeyViewModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: KanaKeyViewModelProvider._internal(
        () => create()
          ..mainCharacter = mainCharacter
          ..flickCharacterMap = flickCharacterMap,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        mainCharacter: mainCharacter,
        flickCharacterMap: flickCharacterMap,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<KanaKeyViewModel, KanaKeyModel>
      createElement() {
    return _KanaKeyViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is KanaKeyViewModelProvider &&
        other.mainCharacter == mainCharacter &&
        other.flickCharacterMap == flickCharacterMap;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, mainCharacter.hashCode);
    hash = _SystemHash.combine(hash, flickCharacterMap.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin KanaKeyViewModelRef on AutoDisposeNotifierProviderRef<KanaKeyModel> {
  /// The parameter `mainCharacter` of this provider.
  String get mainCharacter;

  /// The parameter `flickCharacterMap` of this provider.
  Map<FlickDirection, String> get flickCharacterMap;
}

class _KanaKeyViewModelProviderElement
    extends AutoDisposeNotifierProviderElement<KanaKeyViewModel, KanaKeyModel>
    with KanaKeyViewModelRef {
  _KanaKeyViewModelProviderElement(super.provider);

  @override
  String get mainCharacter =>
      (origin as KanaKeyViewModelProvider).mainCharacter;
  @override
  Map<FlickDirection, String> get flickCharacterMap =>
      (origin as KanaKeyViewModelProvider).flickCharacterMap;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
