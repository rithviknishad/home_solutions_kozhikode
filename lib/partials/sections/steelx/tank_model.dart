import 'package:flutter/foundation.dart';

@immutable
abstract class TankDimensions {
  const TankDimensions();
}

class VerticalTankDimensions extends TankDimensions {
  final double diameter;
  final double height;

  const VerticalTankDimensions(this.diameter, this.height);
}

class HorizontalTankDimensions extends TankDimensions {
  final double length;
  final double clearance;

  const HorizontalTankDimensions(this.length, this.clearance);
}

@immutable
class HoleFittingSize {
  /// Inlet: inches
  /// Outlet: inches
  /// Thickenss: mm
  /// Drain: inches
  final double inlet, outlet, thickness, drain;

  const HoleFittingSize(this.inlet, this.outlet, this.thickness, this.drain);
}

@immutable
class SteelxTank {
  final String model;
  final int capacity;

  final TankDimensions dimensions;

  final int? manholeDiameter;

  final int? stand, legs;

  final HoleFittingSize? holeFittingSize;

  bool get isHorizontal => dimensions is HorizontalTankDimensions;
  bool get isVertical => dimensions is VerticalTankDimensions;

  const SteelxTank(
    this.model, {
    required this.capacity,
    required this.dimensions,
    this.manholeDiameter,
    this.stand,
    this.legs,
    this.holeFittingSize,
  });

  static List<SteelxTank> allTanks = [
    SteelxTank(
      'SX25',
      capacity: 250,
      dimensions: VerticalTankDimensions(700, 960),
      manholeDiameter: 420,
      holeFittingSize: HoleFittingSize(1, 2, 0.6, 1),
    ),
    SteelxTank(
      'SXG250L',
      capacity: 250,
      dimensions: VerticalTankDimensions(760, 960),
      stand: 320,
      legs: 3,
    ),
    SteelxTank(
      'SX50',
      capacity: 500,
      dimensions: VerticalTankDimensions(700, 1450),
      manholeDiameter: 420,
      holeFittingSize: HoleFittingSize(1, 2, 0.6, 1),
    ),
    SteelxTank(
      'SXG500L',
      capacity: 500,
      dimensions: VerticalTankDimensions(760, 1450),
      stand: 320,
      legs: 3,
    ),
    SteelxTank(
      'SX100',
      capacity: 1000,
      dimensions: VerticalTankDimensions(970, 1760),
      manholeDiameter: 420,
      holeFittingSize: HoleFittingSize(1, 2, 0.6, 1),
    ),
    SteelxTank(
      'SXG1000L',
      capacity: 1000,
      dimensions: VerticalTankDimensions(1030, 1760),
      stand: 320,
      legs: 3,
    ),
    SteelxTank(
      'SX150',
      capacity: 1500,
      dimensions: VerticalTankDimensions(1230, 2325),
      manholeDiameter: 420,
      holeFittingSize: HoleFittingSize(1, 2, 0.6, 1),
    ),
    SteelxTank(
      'SXG1500L',
      capacity: 1500,
      dimensions: VerticalTankDimensions(1030, 2325),
      stand: 320,
      legs: 4,
    ),
    SteelxTank(
      'SX200',
      capacity: 2000,
      dimensions: VerticalTankDimensions(1420, 2355),
      manholeDiameter: 530,
      holeFittingSize: HoleFittingSize(1, 2, 0.6, 1),
    ),
    SteelxTank(
      'SXG2000L',
      capacity: 2000,
      dimensions: VerticalTankDimensions(1480, 2055),
      stand: 485,
      legs: 4,
    ),
    SteelxTank(
      'SXG2500L',
      capacity: 2500,
      dimensions: VerticalTankDimensions(1480, 2365),
      stand: 485,
      legs: 4,
    ),
    SteelxTank(
      'SX300',
      capacity: 3000,
      dimensions: VerticalTankDimensions(1420, 2365),
      manholeDiameter: 530,
      holeFittingSize: HoleFittingSize(1, 2, 0.8, 1),
    ),
    SteelxTank(
      'SXG3000L',
      capacity: 3000,
      dimensions: VerticalTankDimensions(1480, 2575),
      stand: 485,
      legs: 6,
    ),
    SteelxTank(
      'SX400',
      capacity: 4000,
      dimensions: VerticalTankDimensions(1700, 2575),
      manholeDiameter: 530,
      holeFittingSize: HoleFittingSize(2, 2, 0.8, 1),
    ),
    SteelxTank(
      'SXG4000L',
      capacity: 4000,
      dimensions: VerticalTankDimensions(1720, 2150),
      stand: 485,
      legs: 8,
    ),
    SteelxTank(
      'SX500',
      capacity: 5000,
      dimensions: VerticalTankDimensions(1700, 2600),
      manholeDiameter: 700,
      holeFittingSize: HoleFittingSize(2, 2, 0.8, 1),
    ),
    SteelxTank(
      'SXG5000L',
      capacity: 5000,
      dimensions: VerticalTankDimensions(1720, 2600),
      stand: 485,
      legs: 8,
    ),
    SteelxTank(
      'SXH10',
      capacity: 1000,
      dimensions: HorizontalTankDimensions(1600, 160),
      manholeDiameter: 420,
      holeFittingSize: HoleFittingSize(1, 2, 0.6, 1),
    ),
    SteelxTank(
      'SXH15',
      capacity: 1500,
      dimensions: HorizontalTankDimensions(1650, 160),
      manholeDiameter: 420,
      holeFittingSize: HoleFittingSize(1, 2, 0.6, 1),
    ),
    SteelxTank(
      'SXH20',
      capacity: 2000,
      dimensions: HorizontalTankDimensions(1700, 160),
      manholeDiameter: 530,
      holeFittingSize: HoleFittingSize(1, 2, 0.6, 1),
    ),
  ]..sort((a, b) => a.capacity.compareTo(b.capacity));
}
