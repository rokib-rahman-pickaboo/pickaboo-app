// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReviewResponseImpl _$$ReviewResponseImplFromJson(Map<String, dynamic> json) =>
    _$ReviewResponseImpl(
      reviewId: _toStringSafe(json['review_id']),
      postedOn: _toDateTimeSafe(json['posted_on']),
      reviwerId: _toStringSafe(json['reviwer_id']),
      reviwerName: _toStringSafe(json['reviwer_name']),
      reviwerImage: _toStringSafe(json['reviwer_image']),
      reviwerRating: _toDoubleSafe(json['reviwer_rating']),
      title: _toStringSafe(json['title']),
      detail: _toStringSafe(json['detail']),
      isRecommended: _toStringSafe(json['is_recommended']),
      images: _toStringListSafe(json['images']),
      likeCount: _toIntSafe(json['like_count']),
      dislikesCount: _toIntSafe(json['dislikes_count']),
      doLike: _toBoolSafe(json['do_like']),
      doDislike: _toBoolSafe(json['do_dislike']),
    );

Map<String, dynamic> _$$ReviewResponseImplToJson(
  _$ReviewResponseImpl instance,
) => <String, dynamic>{
  'review_id': instance.reviewId,
  'posted_on': instance.postedOn?.toIso8601String(),
  'reviwer_id': instance.reviwerId,
  'reviwer_name': instance.reviwerName,
  'reviwer_image': instance.reviwerImage,
  'reviwer_rating': instance.reviwerRating,
  'title': instance.title,
  'detail': instance.detail,
  'is_recommended': instance.isRecommended,
  'images': instance.images,
  'like_count': instance.likeCount,
  'dislikes_count': instance.dislikesCount,
  'do_like': instance.doLike,
  'do_dislike': instance.doDislike,
};
