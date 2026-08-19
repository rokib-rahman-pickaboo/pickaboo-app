import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

const List<String> kPinnedCertSha256 = <String>[
];

void applyCertificatePinning(Dio dio) {
  if (kPinnedCertSha256.isEmpty) return;

  final adapter = dio.httpClientAdapter;
  if (adapter is IOHttpClientAdapter) {
    adapter.validateCertificate = (cert, host, port) {
      if (cert == null) return false;
      final fingerprint = sha256.convert(cert.der).toString();
      return kPinnedCertSha256.contains(fingerprint);
    };
  }
}
