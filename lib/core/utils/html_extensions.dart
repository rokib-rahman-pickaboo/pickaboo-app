import 'package:html/parser.dart' show parse;

final RegExp _htmlTagPattern = RegExp(r'<[^>]*>');

const Map<String, String> _commonEntities = {
  '&amp;': '&',
  '&lt;': '<',
  '&gt;': '>',
  '&quot;': '"',
  '&#39;': "'",
  '&apos;': "'",
  '&nbsp;': ' ',
};

final RegExp _commonEntityPattern = RegExp(
  '(${_commonEntities.keys.join('|')})',
);

final RegExp _otherEntityPattern = RegExp(r'&[#a-zA-Z0-9]+;');

extension HtmlStringExtension on String {
  String get removeHtmlTags {
    if (isEmpty) return this;

    final hasTag = contains('<');
    final hasEntity = contains('&');

    if (!hasTag && !hasEntity) return this;

    var result = hasTag ? replaceAll(_htmlTagPattern, '') : this;

    if (hasEntity) {
      result = result.replaceAllMapped(
        _commonEntityPattern,
        (m) => _commonEntities[m[0]] ?? m[0]!,
      );

      if (result.contains(_otherEntityPattern)) {
        try {
          return parse(result).body?.text ?? result;
        } catch (_) {
          return result;
        }
      }
    }

    return result;
  }
}
