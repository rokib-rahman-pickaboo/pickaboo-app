import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/domain/entity/app_error/app_error_entity.dart';
import 'package:pickaboo/domain/entity/banner/banner_entity.dart';
import 'package:pickaboo/domain/repository/product_repository.dart';

part 'banner_event.dart';
part 'banner_state.dart';
part 'banner_bloc.freezed.dart';

@injectable
class BannerBloc extends Bloc<BannerEvent, BannerState> {
  final ProductRepository repository;

  BannerBloc(this.repository) : super(const BannerState()) {
    on<BannerEvent>((event, emit) async {
      await event.map(
        getBannerContent: (_GetBannerContent req) async {
          emit(state.copyWith(status: BannerStatus.loading));

          final result = await repository.getBannerContent();
          result.fold(
            (l) {
              if (kDebugMode) {
                print('❌ [BannerBloc] Error: ${l.message}');
              }
              emit(state.copyWith(error: l, status: BannerStatus.error));
            },
            (r) async {
              if (kDebugMode) {
                print('✅ [BannerBloc] Success: ${r.length} banners');
              }
              emit(
                state.copyWith(
                  status: BannerStatus.success,
                  banners: r,
                ),
              );
            },
          );
        },
      );
    });
  }
}
