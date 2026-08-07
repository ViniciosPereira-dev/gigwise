enum TripPlatform { uber, nineNine, inDrive, other }

enum TripSource { manual, ocr, import }

class Trip {
  final String id;
  final TripPlatform platform;
  final int amountInCents;
  final int? tipInCents;
  final int? tollInCents;
  final double distanceInKm;
  final DateTime startedAt;
  final DateTime finishedAt;
  final String? originAddress;
  final String? destinationAddress;
  final String? note;
  final TripSource source;

  Trip._({
    required this.id,
    required this.platform,
    required this.amountInCents,
    required this.distanceInKm,
    required this.startedAt,
    required this.finishedAt,
    this.tipInCents,
    this.tollInCents,
    this.originAddress,
    this.destinationAddress,
    this.note,
    required this.source,
  });

  factory Trip({
    required String id,
    required TripPlatform platform,
    required int amountInCents,
    required double distanceInKm,
    required DateTime startedAt,
    required DateTime finishedAt,
    int? tipInCents,
    int? tollInCents,
    String? originAddress,
    String? destinationAddress,
    String? note,
    required TripSource source,
  }) {
    if (id.trim().isEmpty) {
      throw ArgumentError('Trip id cannot be empty.');
    }

    if (amountInCents <= 0) {
      throw ArgumentError('Trip amount must be greater than zero.');
    }

    if (distanceInKm < 0) {
      throw ArgumentError('Trip distance cannot be negative.');
    }

    if (tipInCents != null && tipInCents < 0) {
      throw ArgumentError('Trip tip cannot be negative.');
    }

    if (tollInCents != null && tollInCents < 0) {
      throw ArgumentError('Trip toll cannot be negative.');
    }

    if (!finishedAt.isAfter(startedAt)) {
      throw ArgumentError('Trip finishedAt must be after startedAt.');
    }

    return Trip._(
      id: id,
      platform: platform,
      amountInCents: amountInCents,
      distanceInKm: distanceInKm,
      startedAt: startedAt,
      finishedAt: finishedAt,
      tipInCents: tipInCents,
      tollInCents: tollInCents,
      originAddress: originAddress,
      destinationAddress: destinationAddress,
      note: note,
      source: source,
    );
  }

  Duration get duration => finishedAt.difference(startedAt);

  int get totalRevenueInCents => amountInCents + (tipInCents ?? 0);

  bool get hasTip => tipInCents != null && tipInCents! > 0;

  bool get hasToll => tollInCents != null && tollInCents! > 0;
}
