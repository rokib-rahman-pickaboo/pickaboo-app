enum Gender {
  male(1, 'Male'),
  female(2, 'Female');

  final int value;
  final String label;

  const Gender(this.value, this.label);

  static Gender? fromValue(int value) {
    try {
      return Gender.values.firstWhere((gender) => gender.value == value);
    } catch (_) {
      return null;
    }
  }

  static Gender? fromStringValue(String? value) {
    if (value == null || value.isEmpty) return null;
    final intValue = int.tryParse(value);
    if (intValue == null) return null;
    return fromValue(intValue);
  }

  static Gender? fromLabel(String? label) {
    if (label == null || label.isEmpty) return null;
    try {
      return Gender.values.firstWhere(
        (gender) => gender.label.toLowerCase() == label.toLowerCase(),
      );
    } catch (_) {
      return null;
    }
  }
}
