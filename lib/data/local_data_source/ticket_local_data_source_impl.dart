import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/core/constants/db_constants.dart';
import 'package:pickaboo/data/local_data_source/ticket_local_data_source.dart';
import 'package:pickaboo/data/model/cache/ticket_cache_wrapper.dart';
import 'package:pickaboo/data/model/ticket/ticket_response/ticket_response.dart';

@LazySingleton(as: TicketLocalDataSource)
class TicketLocalDataSourceImpl implements TicketLocalDataSource {
  Future<Box<TicketCacheWrapper>> _cacheBox() async {
    if (Hive.isBoxOpen(dbTicketName)) {
      return Hive.box<TicketCacheWrapper>(dbTicketName);
    }
    return await Hive.openBox<TicketCacheWrapper>(dbTicketName);
  }

  @override
  Future<List<TicketResponse>?> getTicketsIfValid() async {
    final box = await _cacheBox();

    if (box.isEmpty) {
      if (kDebugMode) {
        print('📦 Ticket Cache: Empty');
      }
      return null;
    }

    final wrapper = box.getAt(0);
    if (wrapper == null) {
      return null;
    }

    if (wrapper.isExpired) {
      if (kDebugMode) {
        print('⏰ Ticket Cache: Expired (cached ${wrapper.cachedAt})');
      }
      await box.clear();
      return null;
    }

    if (kDebugMode) {
      print('✅ Ticket Cache: Valid');
    }

    return wrapper.tickets;
  }

  @override
  Future<void> insertTickets(List<TicketResponse> tickets) async {
    final box = await _cacheBox();
    await box.clear();

    final wrapper = TicketCacheWrapper(
      tickets: tickets,
      cachedAt: DateTime.now(),
    );

    await box.add(wrapper);

    if (kDebugMode) {
      print('📦 Ticket Cache: Saved tickets at ${wrapper.cachedAt}');
    }
  }

  @override
  Future<void> clearTickets() async {
    final box = await _cacheBox();
    await box.clear();
    if (kDebugMode) {
      print('📦 Ticket Cache: Cleared');
    }
  }
}
