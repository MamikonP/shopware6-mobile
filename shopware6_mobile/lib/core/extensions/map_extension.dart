extension NullableMapStringExtension on Map<String, String>? {
  String? mapToStringWithPrefix() {
    if (this == null) {
      return null;
    }
    final StringBuffer buffer = StringBuffer();
    for (final MapEntry<String, String> entry in this!.entries) {
      final String key = entry.key;
      buffer.write('$key=${entry.value}&');
    }
    return buffer
        .toString()
        .substring(0, buffer.length - 1); // removing trailing '&'
  }
}

extension MapExtension on Map<String, dynamic> {
  Map<String, String> toMapString() => map((String key, dynamic value) =>
      MapEntry<String, String>(key, value.toString()));
}
