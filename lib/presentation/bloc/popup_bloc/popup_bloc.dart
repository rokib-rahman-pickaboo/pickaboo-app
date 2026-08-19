import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/domain/entity/app_error/app_error_entity.dart';
import 'package:pickaboo/domain/entity/popup/popup_entity.dart';
import 'package:pickaboo/domain/repository/product_repository.dart';

part 'popup_event.dart';
part 'popup_state.dart';
part 'popup_bloc.freezed.dart';

@injectable
class PopupBloc extends Bloc<PopupEvent, PopupState> {
  final ProductRepository repository;

  PopupBloc(this.repository) : super(const PopupState()) {
    on<PopupEvent>((event, emit) async {
      await event.map(
        getPopupContent: (_GetPopupContent req) async {
          emit(state.copyWith(status: PopupStatus.loading));

          final result = await repository.getPopupContent();
          result.fold(
            (l) {
              if (kDebugMode) {
                print('❌ [PopupBloc] Error: ${l.message}');
              }
              emit(state.copyWith(error: l, status: PopupStatus.error));
            },
            (r) async {
              if (kDebugMode) {
                print('✅ [PopupBloc] Success: ${r.title}, Active: ${r.active}');
              }
              final offerTitles = (r.title).split('&&');
              final linkType = offerTitles.isNotEmpty ? offerTitles[0] : '';
              final link = offerTitles.length > 1 ? offerTitles[1] : '';
              final name = offerTitles.length > 2 ? offerTitles[2] : '';

              String imageUrl = '';
              final RegExp regex = RegExp(r'src="([^"]+)"');
              final match = regex.firstMatch(r.content);
              if (match != null) {
                imageUrl = match.group(1) ?? '';
              }

              if (kDebugMode) {
                print(
                  '📝 [PopupBloc] Parsed: linkType=$linkType, link=$link, name=$name, imageUrl=$imageUrl',
                );
              }

              emit(
                state.copyWith(
                  status: PopupStatus.success,
                  popup: r,
                  linkType: linkType,
                  link: link,
                  name: name,
                  imageUrl: imageUrl,
                ),
              );
            },
          );
        },
      );
    });
  }
}
