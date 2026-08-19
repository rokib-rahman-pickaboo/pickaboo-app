part of 'cms_content_bloc.dart';

@freezed
class CmsContentState with _$CmsContentState {
  const factory CmsContentState({
    CmsBlockEntity? productOffer,
    CmsBlockEntity? priceGuarantee,
    CmsBlockEntity? priceGuaranteeTc,
    CmsBlockEntity? pickabooVerified,
    CmsBlockEntity? expressDelivery,
    required bool isLoading,
    AppErrorEntity? error,
  }) = _CmsContentState;
}
