import 'package:flutter_test/flutter_test.dart';
import 'package:pickaboo/core/utils/html_extensions.dart';

void main() {
  group('TitleSanitizerExtension Tests', () {
    test('Identifies Home Slider and CMS slider placeholders as generic', () {
      expect('Home Slider'.isGenericOrPlaceholderTitle, isTrue);
      expect('home slider'.isGenericOrPlaceholderTitle, isTrue);
      expect('Home_Slider'.isGenericOrPlaceholderTitle, isTrue);
      expect('Main Slider'.isGenericOrPlaceholderTitle, isTrue);
      expect('Category Slider'.isGenericOrPlaceholderTitle, isTrue);
      expect('Hero Banner'.isGenericOrPlaceholderTitle, isTrue);
      expect('banner'.isGenericOrPlaceholderTitle, isTrue);
      expect('Home'.isGenericOrPlaceholderTitle, isTrue);
      expect('category'.isGenericOrPlaceholderTitle, isTrue);
      expect(''.isGenericOrPlaceholderTitle, isTrue);
      expect('   '.isGenericOrPlaceholderTitle, isTrue);
      expect((null as String?).isGenericOrPlaceholderTitle, isTrue);
    });

    test('Identifies real category and brand titles as valid (not placeholder)', () {
      expect('Kitchen Essentials on Pickaboo'.isGenericOrPlaceholderTitle, isFalse);
      expect('Smartphones'.isGenericOrPlaceholderTitle, isFalse);
      expect('Air Conditioners'.isGenericOrPlaceholderTitle, isFalse);
      expect('Philips'.isGenericOrPlaceholderTitle, isFalse);
      expect('Electronics & Gadgets'.isGenericOrPlaceholderTitle, isFalse);
      expect('Fashion'.isGenericOrPlaceholderTitle, isFalse);
    });

    test('sanitizedCatalogTitle returns empty string for placeholders and cleaned string for real titles', () {
      expect('Home Slider'.sanitizedCatalogTitle, '');
      expect('home slider'.sanitizedCatalogTitle, '');
      expect('Main Slider'.sanitizedCatalogTitle, '');
      expect((null as String?).sanitizedCatalogTitle, '');
      expect(''.sanitizedCatalogTitle, '');

      expect(
        'Kitchen Essentials on Pickaboo'.sanitizedCatalogTitle,
        'Kitchen Essentials on Pickaboo',
      );
      expect('<b>Smartphones</b>'.sanitizedCatalogTitle, 'Smartphones');
      expect('Men &amp; Women Fashion'.sanitizedCatalogTitle, 'Men & Women Fashion');
    });
  });
}
