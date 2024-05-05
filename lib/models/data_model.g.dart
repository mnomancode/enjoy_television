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
      date: json['date'] as String,
    );

Map<String, dynamic> _$$DataModelImplToJson(_$DataModelImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'imageUrl': instance.imageUrl,
      'videoUrl': instance.videoUrl,
      'date': instance.date,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dataModelNotifierHash() => r'e2c31593d7c6d98905f5b7b0bea842ca5b06725c';

/// See also [DataModelNotifier].
@ProviderFor(DataModelNotifier)
final dataModelNotifierProvider =
    AsyncNotifierProvider<DataModelNotifier, List<DataModel>>.internal(
  DataModelNotifier.new,
  name: r'dataModelNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$dataModelNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DataModelNotifier = AsyncNotifier<List<DataModel>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
