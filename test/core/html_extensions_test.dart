import 'package:flutter_test/flutter_test.dart';
import 'package:pickaboo/core/utils/html_extensions.dart';

void main() {
  group('removeHtmlTags', () {
    test('plain text passes through untouched', () {
      expect('Electronics & more'.removeHtmlTags, 'Electronics & more');
      expect('Samsung Galaxy S24'.removeHtmlTags, 'Samsung Galaxy S24');
      expect(''.removeHtmlTags, '');
    });

    test('strips tags', () {
      expect('<p>Hello</p>'.removeHtmlTags, 'Hello');
      expect('<span class="a">4K</span> TV'.removeHtmlTags, '4K TV');
      expect('Line<br/>Break'.removeHtmlTags, 'LineBreak');
    });

    test('decodes common entities', () {
      expect('Tom &amp; Jerry'.removeHtmlTags, 'Tom & Jerry');
      expect('&lt;tag&gt;'.removeHtmlTags, '<tag>');
      expect('a&nbsp;b'.removeHtmlTags, 'a b');
      expect('&quot;quoted&quot;'.removeHtmlTags, '"quoted"');
      expect('it&#39;s'.removeHtmlTags, "it's");
    });

    test('falls back to the parser for numeric entities', () {
      expect('Brand&#8482;'.removeHtmlTags, 'Brand™');
    });

    test('handles tags and entities together', () {
      expect(
        '<strong>Tom &amp; Jerry</strong>'.removeHtmlTags,
        'Tom & Jerry',
      );
    });
  });
}
