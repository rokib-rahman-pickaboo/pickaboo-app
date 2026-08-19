part of 'cms_content_bloc.dart';

@freezed
class CmsContentEvent with _$CmsContentEvent {
  const factory CmsContentEvent.loadAll() = _LoadAll;

  const factory CmsContentEvent.loadBlock({required CmsBlockType blockType}) =
      _LoadBlock;
}
