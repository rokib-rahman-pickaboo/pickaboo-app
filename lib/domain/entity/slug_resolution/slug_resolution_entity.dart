import 'package:freezed_annotation/freezed_annotation.dart';

part 'slug_resolution_entity.freezed.dart';

@freezed
class SlugResolutionEntity with _$SlugResolutionEntity {
  const factory SlugResolutionEntity({
    required String id,
    required String type,
  }) = _SlugResolutionEntity;
}
