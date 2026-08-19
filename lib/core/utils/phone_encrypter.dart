import 'package:intl/intl.dart';
import 'package:pickaboo/core/utils/encryption_helper.dart';

class PhoneEncrypter {
  static String encryptPhone(String phone, EncryptionHelper encryptionHelper) {
    final now = DateTime.now();
    final date = DateFormat('yyyy-MM-dd').format(now);
    final time = DateFormat('HH:mm').format(now);

    final formatted = '$phone#$date#$time';

    return encryptionHelper.encrypt(formatted);
  }
}
