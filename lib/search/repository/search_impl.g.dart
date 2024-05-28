// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$searchRepositoryImplHash() =>
    r'77983a6a1a4e6518b64a7288af1d5d2625c7c30e';

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

abstract class _$SearchRepositoryImpl
    extends BuildlessAsyncNotifier<SearchResult?> {
  late final String query;
  late final int page;

  FutureOr<SearchResult?> build({
    required String query,
    int page = 1,
  });
}

/// See also [SearchRepositoryImpl].
@ProviderFor(SearchRepositoryImpl)
const searchRepositoryImplProvider = SearchRepositoryImplFamily();

/// See also [SearchRepositoryImpl].
class SearchRepositoryImplFamily extends Family<AsyncValue<SearchResult?>> {
  /// See also [SearchRepositoryImpl].
  const SearchRepositoryImplFamily();

  /// See also [SearchRepositoryImpl].
  SearchRepositoryImplProvider call({
    required String query,
    int page = 1,
  }) {
    return SearchRepositoryImplProvider(
      query: query,
      page: page,
    );
  }

  @override
  SearchRepositoryImplProvider getProviderOverride(
    covariant SearchRepositoryImplProvider provider,
  ) {
    return call(
      query: provider.query,
      page: provider.page,
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
  String? get name => r'searchRepositoryImplProvider';
}

/// See also [SearchRepositoryImpl].
class SearchRepositoryImplProvider
    extends AsyncNotifierProviderImpl<SearchRepositoryImpl, SearchResult?> {
  /// See also [SearchRepositoryImpl].
  SearchRepositoryImplProvider({
    required String query,
    int page = 1,
  }) : this._internal(
          () => SearchRepositoryImpl()
            ..query = query
            ..page = page,
          from: searchRepositoryImplProvider,
          name: r'searchRepositoryImplProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$searchRepositoryImplHash,
          dependencies: SearchRepositoryImplFamily._dependencies,
          allTransitiveDependencies:
              SearchRepositoryImplFamily._allTransitiveDependencies,
          query: query,
          page: page,
        );

  SearchRepositoryImplProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.query,
    required this.page,
  }) : super.internal();

  final String query;
  final int page;

  @override
  FutureOr<SearchResult?> runNotifierBuild(
    covariant SearchRepositoryImpl notifier,
  ) {
    return notifier.build(
      query: query,
      page: page,
    );
  }

  @override
  Override overrideWith(SearchRepositoryImpl Function() create) {
    return ProviderOverride(
      origin: this,
      override: SearchRepositoryImplProvider._internal(
        () => create()
          ..query = query
          ..page = page,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        query: query,
        page: page,
      ),
    );
  }

  @override
  AsyncNotifierProviderElement<SearchRepositoryImpl, SearchResult?>
      createElement() {
    return _SearchRepositoryImplProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SearchRepositoryImplProvider &&
        other.query == query &&
        other.page == page;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SearchRepositoryImplRef on AsyncNotifierProviderRef<SearchResult?> {
  /// The parameter `query` of this provider.
  String get query;

  /// The parameter `page` of this provider.
  int get page;
}

class _SearchRepositoryImplProviderElement
    extends AsyncNotifierProviderElement<SearchRepositoryImpl, SearchResult?>
    with SearchRepositoryImplRef {
  _SearchRepositoryImplProviderElement(super.provider);

  @override
  String get query => (origin as SearchRepositoryImplProvider).query;
  @override
  int get page => (origin as SearchRepositoryImplProvider).page;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
