class HijriOffsetState {
  final int offset;
  final Map<String, List<String>> cachedEvents;

  const HijriOffsetState({
    required this.offset,
    required this.cachedEvents,
  });

  HijriOffsetState copyWith({
    int? offset,
    Map<String, List<String>>? cachedEvents,
  }) {
    return HijriOffsetState(
      offset: offset ?? this.offset,
      cachedEvents: cachedEvents ?? this.cachedEvents,
    );
  }
}