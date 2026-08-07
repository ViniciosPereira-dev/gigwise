import 'package:flutter_test/flutter_test.dart';
import 'package:gigwise/features/trips/domain/entities/trip.dart';

void main() {
  group('Trip', () {
    test('should create a valid trip', () {
      final trip = Trip(
        id: 'trip-1',
        platform: TripPlatform.uber,
        amountInCents: 2500,
        distanceInKm: 10.5,
        startedAt: DateTime(2026, 8, 7, 10),
        finishedAt: DateTime(2026, 8, 7, 10, 30),
        source: TripSource.manual,
      );

      expect(trip.id, 'trip-1');
      expect(trip.platform, TripPlatform.uber);
      expect(trip.amountInCents, 2500);
      expect(trip.distanceInKm, 10.5);
      expect(trip.source, TripSource.manual);
    });
  });

  test('should reject an empty id', () {
    expect(
      () => Trip(
        id: '',
        platform: TripPlatform.uber,
        amountInCents: 2500,
        distanceInKm: 10,
        startedAt: DateTime(2026, 8, 7, 10),
        finishedAt: DateTime(2026, 8, 7, 10, 30),
        source: TripSource.manual,
      ),
      throwsArgumentError,
    );
  });

  test('should reject zero amount', () {
    expect(
      () => Trip(
        id: 'trip-1',
        platform: TripPlatform.uber,
        amountInCents: 0,
        distanceInKm: 10,
        startedAt: DateTime(2026, 8, 7, 10),
        finishedAt: DateTime(2026, 8, 7, 10, 30),
        source: TripSource.manual,
      ),
      throwsArgumentError,
    );
  });

  test('should reject negative distance', () {
    expect(
      () => Trip(
        id: 'trip-1',
        platform: TripPlatform.uber,
        amountInCents: 2500,
        distanceInKm: -1,
        startedAt: DateTime(2026, 8, 7, 10),
        finishedAt: DateTime(2026, 8, 7, 10, 30),
        source: TripSource.manual,
      ),
      throwsArgumentError,
    );
  });

  test('should reject negative tip', () {
    expect(
      () => Trip(
        id: 'trip-1',
        platform: TripPlatform.uber,
        amountInCents: 2500,
        tipInCents: -100,
        distanceInKm: 10,
        startedAt: DateTime(2026, 8, 7, 10),
        finishedAt: DateTime(2026, 8, 7, 10, 30),
        source: TripSource.manual,
      ),
      throwsArgumentError,
    );
  });

  test('should reject negative toll', () {
    expect(
      () => Trip(
        id: 'trip-1',
        platform: TripPlatform.uber,
        amountInCents: 2500,
        tollInCents: -500,
        distanceInKm: 10,
        startedAt: DateTime(2026, 8, 7, 10),
        finishedAt: DateTime(2026, 8, 7, 10, 30),
        source: TripSource.manual,
      ),
      throwsArgumentError,
    );
  });

  test('should reject trip with same start and finish time', () {
    final time = DateTime(2026, 8, 7, 10);

    expect(
      () => Trip(
        id: 'trip-1',
        platform: TripPlatform.uber,
        amountInCents: 2500,
        distanceInKm: 10,
        startedAt: time,
        finishedAt: time,
        source: TripSource.manual,
      ),
      throwsArgumentError,
    );
  });

  test('should reject trip that finishes before it starts', () {
    expect(
      () => Trip(
        id: 'trip-1',
        platform: TripPlatform.uber,
        amountInCents: 2500,
        distanceInKm: 10,
        startedAt: DateTime(2026, 8, 7, 10),
        finishedAt: DateTime(2026, 8, 7, 9, 30),
        source: TripSource.manual,
      ),
      throwsArgumentError,
    );
  });

  test('should calculate trip duration', () {
    final trip = Trip(
      id: 'trip-1',
      platform: TripPlatform.uber,
      amountInCents: 2500,
      distanceInKm: 10,
      startedAt: DateTime(2026, 8, 7, 10),
      finishedAt: DateTime(2026, 8, 7, 10, 30),
      source: TripSource.manual,
    );

    expect(trip.duration, const Duration(minutes: 30));
  });

  test('should calculate total revenue including tip', () {
    final trip = Trip(
      id: 'trip-1',
      platform: TripPlatform.uber,
      amountInCents: 2500,
      tipInCents: 500,
      distanceInKm: 10,
      startedAt: DateTime(2026, 8, 7, 10),
      finishedAt: DateTime(2026, 8, 7, 10, 30),
      source: TripSource.manual,
    );

    expect(trip.totalRevenueInCents, 3000);
  });

  test('should use zero when tip is not provided', () {
    final trip = Trip(
      id: 'trip-1',
      platform: TripPlatform.uber,
      amountInCents: 2500,
      distanceInKm: 10,
      startedAt: DateTime(2026, 8, 7, 10),
      finishedAt: DateTime(2026, 8, 7, 10, 30),
      source: TripSource.manual,
    );

    expect(trip.totalRevenueInCents, 2500);
  });

  test('should identify when trip has a tip', () {
    final trip = Trip(
      id: 'trip-1',
      platform: TripPlatform.uber,
      amountInCents: 2500,
      tipInCents: 500,
      distanceInKm: 10,
      startedAt: DateTime(2026, 8, 7, 10),
      finishedAt: DateTime(2026, 8, 7, 10, 30),
      source: TripSource.manual,
    );

    expect(trip.hasTip, isTrue);
  });

  test('should return false when trip has no tip', () {
    final trip = Trip(
      id: 'trip-1',
      platform: TripPlatform.uber,
      amountInCents: 2500,
      distanceInKm: 10,
      startedAt: DateTime(2026, 8, 7, 10),
      finishedAt: DateTime(2026, 8, 7, 10, 30),
      source: TripSource.manual,
    );

    expect(trip.hasTip, isFalse);
  });

  test('should identify when trip has a toll', () {
    final trip = Trip(
      id: 'trip-1',
      platform: TripPlatform.uber,
      amountInCents: 2500,
      tollInCents: 850,
      distanceInKm: 10,
      startedAt: DateTime(2026, 8, 7, 10),
      finishedAt: DateTime(2026, 8, 7, 10, 30),
      source: TripSource.manual,
    );

    expect(trip.hasToll, isTrue);
  });
}
