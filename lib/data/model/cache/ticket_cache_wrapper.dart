import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pickaboo/data/model/ticket/ticket_response/ticket_response.dart';

part 'ticket_cache_wrapper.freezed.dart';
part 'ticket_cache_wrapper.g.dart';

@freezed
@HiveType(typeId: 18, adapterName: 'TicketCacheWrapperAdapter')
class TicketCacheWrapper with _$TicketCacheWrapper {
  const factory TicketCacheWrapper({
    @HiveField(0) required List<TicketResponse> tickets,
    @HiveField(1) required DateTime cachedAt,
  }) = _TicketCacheWrapper;

  factory TicketCacheWrapper.fromJson(Map<String, dynamic> json) =>
      _$TicketCacheWrapperFromJson(json);
}

extension TicketCacheWrapperX on TicketCacheWrapper {
  bool get isExpired {
    final now = DateTime.now();
    final difference = now.difference(cachedAt);
    return difference.inMinutes >= 30;
  }
}
