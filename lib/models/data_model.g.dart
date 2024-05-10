// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DataModelImpl _$$DataModelImplFromJson(Map<String, dynamic> json) =>
    _$DataModelImpl(
      title: json['title'] as String,
      imageUrl: json['imageUrl'] as String,
      videoUrl: json['videoUrl'] as String,
      date: json['date'] as String?,
      pagePath: json['pagePath'] as String?,
    );

Map<String, dynamic> _$$DataModelImplToJson(_$DataModelImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'imageUrl': instance.imageUrl,
      'videoUrl': instance.videoUrl,
      'date': instance.date,
      'pagePath': instance.pagePath,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getVideosHash() => r'9da16579b66cfc521a0a524dd8de5e3aee6ef5a1';

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

/// See also [getVideos].
@ProviderFor(getVideos)
const getVideosProvider = GetVideosFamily();

/// See also [getVideos].
class GetVideosFamily extends Family<AsyncValue<List<DataModel>>?> {
  /// See also [getVideos].
  const GetVideosFamily();

  /// See also [getVideos].
  GetVideosProvider call(
    String path,
  ) {
    return GetVideosProvider(
      path,
    );
  }

  @override
  GetVideosProvider getProviderOverride(
    covariant GetVideosProvider provider,
  ) {
    return call(
      provider.path,
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
  String? get name => r'getVideosProvider';
}

/// See also [getVideos].
class GetVideosProvider
    extends AutoDisposeProvider<AsyncValue<List<DataModel>>?> {
  /// See also [getVideos].
  GetVideosProvider(
    String path,
  ) : this._internal(
          (ref) => getVideos(
            ref as GetVideosRef,
            path,
          ),
          from: getVideosProvider,
          name: r'getVideosProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getVideosHash,
          dependencies: GetVideosFamily._dependencies,
          allTransitiveDependencies: GetVideosFamily._allTransitiveDependencies,
          path: path,
        );

  GetVideosProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.path,
  }) : super.internal();

  final String path;

  @override
  Override overrideWith(
    AsyncValue<List<DataModel>>? Function(GetVideosRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetVideosProvider._internal(
        (ref) => create(ref as GetVideosRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        path: path,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<AsyncValue<List<DataModel>>?> createElement() {
    return _GetVideosProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetVideosProvider && other.path == path;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, path.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetVideosRef on AutoDisposeProviderRef<AsyncValue<List<DataModel>>?> {
  /// The parameter `path` of this provider.
  String get path;
}

class _GetVideosProviderElement
    extends AutoDisposeProviderElement<AsyncValue<List<DataModel>>?>
    with GetVideosRef {
  _GetVideosProviderElement(super.provider);

  @override
  String get path => (origin as GetVideosProvider).path;
}

String _$dataModelNotifierHash() => r'e6e8961a99c1b8d05e31053e08b4cdaf366bcaa7';

abstract class _$DataModelNotifier
    extends BuildlessAsyncNotifier<List<DataModel>> {
  late final String path;

  FutureOr<List<DataModel>> build(
    String path,
  );
}

/// See also [DataModelNotifier].
@ProviderFor(DataModelNotifier)
const dataModelNotifierProvider = DataModelNotifierFamily();

/// See also [DataModelNotifier].
class DataModelNotifierFamily extends Family<AsyncValue<List<DataModel>>> {
  /// See also [DataModelNotifier].
  const DataModelNotifierFamily();

  /// See also [DataModelNotifier].
  DataModelNotifierProvider call(
    String path,
  ) {
    return DataModelNotifierProvider(
      path,
    );
  }

  @override
  DataModelNotifierProvider getProviderOverride(
    covariant DataModelNotifierProvider provider,
  ) {
    return call(
      provider.path,
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
  String? get name => r'dataModelNotifierProvider';
}

/// See also [DataModelNotifier].
class DataModelNotifierProvider
    extends AsyncNotifierProviderImpl<DataModelNotifier, List<DataModel>> {
  /// See also [DataModelNotifier].
  DataModelNotifierProvider(
    String path,
  ) : this._internal(
          () => DataModelNotifier()..path = path,
          from: dataModelNotifierProvider,
          name: r'dataModelNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$dataModelNotifierHash,
          dependencies: DataModelNotifierFamily._dependencies,
          allTransitiveDependencies:
              DataModelNotifierFamily._allTransitiveDependencies,
          path: path,
        );

  DataModelNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.path,
  }) : super.internal();

  final String path;

  @override
  FutureOr<List<DataModel>> runNotifierBuild(
    covariant DataModelNotifier notifier,
  ) {
    return notifier.build(
      path,
    );
  }

  @override
  Override overrideWith(DataModelNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: DataModelNotifierProvider._internal(
        () => create()..path = path,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        path: path,
      ),
    );
  }

  @override
  AsyncNotifierProviderElement<DataModelNotifier, List<DataModel>>
      createElement() {
    return _DataModelNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DataModelNotifierProvider && other.path == path;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, path.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DataModelNotifierRef on AsyncNotifierProviderRef<List<DataModel>> {
  /// The parameter `path` of this provider.
  String get path;
}

class _DataModelNotifierProviderElement
    extends AsyncNotifierProviderElement<DataModelNotifier, List<DataModel>>
    with DataModelNotifierRef {
  _DataModelNotifierProviderElement(super.provider);

  @override
  String get path => (origin as DataModelNotifierProvider).path;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
