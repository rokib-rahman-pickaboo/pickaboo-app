import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';
import 'package:encrypt/encrypt.dart' as encrypt_lib;
import 'package:injectable/injectable.dart';
import 'package:pointycastle/export.dart';

@lazySingleton
class EncryptionHelper {
  static const String keyString = "12ASFVAKHSKAHSOETUYNHKJLSHSBHSNJ";
  static const int iterations = 999;
  static const int keySize = 32;
  static const int ivSize = 16;

  String encrypt(String plainText) {
    try {
      final salt = _generateRandomBytes(256);

      final ivBytes = _generateRandomBytes(16);
      final iv = encrypt_lib.IV(ivBytes);

      final keyBytes = _deriveKey(keyString, salt);
      final key = encrypt_lib.Key(keyBytes);

      final encrypter = encrypt_lib.Encrypter(
        encrypt_lib.AES(key, mode: encrypt_lib.AESMode.cbc, padding: 'PKCS7'),
      );
      final encrypted = encrypter.encrypt(plainText, iv: iv);

      final output = {
        "ciphertext": encrypted.base64,
        "iv": _bytesToHex(ivBytes),
        "salt": _bytesToHex(salt),
        "iterations": iterations,
      };

      return base64.encode(utf8.encode(json.encode(output)));
    } catch (e) {
      throw Exception("Encryption failed: $e");
    }
  }

  Uint8List _deriveKey(String password, Uint8List salt) {
    final derivator = PBKDF2KeyDerivator(HMac(SHA512Digest(), 128));
    final params = Pbkdf2Parameters(salt, iterations, keySize);
    derivator.init(params);
    return derivator.process(Uint8List.fromList(utf8.encode(password)));
  }

  Uint8List _generateRandomBytes(int length) {
    final rnd = Random.secure();
    final bytes = Uint8List(length);
    for (var i = 0; i < length; i++) {
      bytes[i] = rnd.nextInt(255);
    }
    return bytes;
  }

  String _bytesToHex(Uint8List bytes) {
    return bytes.map((byte) => byte.toRadixString(16).padLeft(2, '0')).join('');
  }
}
