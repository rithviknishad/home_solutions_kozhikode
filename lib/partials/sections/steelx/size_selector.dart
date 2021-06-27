import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:home_solutions_kozhikode/partials/sections/steelx/tank_model.dart';

class SteelxAvailableSizes extends StatefulWidget {
  const SteelxAvailableSizes();

  @override
  _SteelxAvailableSizesState createState() => _SteelxAvailableSizesState();
}

class _SteelxAvailableSizesState extends State<SteelxAvailableSizes> {
  SteelxTank selectedTank = SteelxTank.allTanks.first;

  List<SteelxTank> get allTanks => SteelxTank.allTanks;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        _heading(theme),
        Wrap(
          spacing: 120,
          runSpacing: 20,
          alignment: WrapAlignment.center,
          runAlignment: WrapAlignment.spaceBetween,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Select capacity: ",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 4),
                  DropdownButton<SteelxTank>(
                    value: selectedTank,
                    items: [
                      for (final type in SteelxTank.allTanks)
                        DropdownMenuItem(
                          value: type,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${type.model}'),
                                Text(
                                  '${type.capacity} L',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                    selectedItemBuilder: (_) => [
                      for (final type in SteelxTank.allTanks)
                        Text(
                          '${type.capacity} L',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                    ],
                    onChanged: (value) {
                      if (value != null) setState(() => selectedTank = value);
                    },
                  ),
                ],
              ),
            ),

            // Dimensions
            _InteractiveTank(selectedTank),

            // Other properties
            _TankProperties(selectedTank),
          ],
        ),
      ],
    );
  }

  Widget _heading(ThemeData theme) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 30),
        child: Text(
          "Available in a variety of capacities",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: theme.primaryColor,
            fontSize: 26,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.0,
          ),
        ),
      );
}

class _TankProperties extends StatelessWidget {
  final SteelxTank tank;

  const _TankProperties(this.tank);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      width: 300.0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          // Model Number
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '${tank.model}  -  ${tank.capacity} Litres',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
            ),
          ),

          _DimensionProperties(tank),
          SizedBox(height: 16),

          if (tank.holeFittingSize != null) ...[
            _HoleSizeForFittingProperties(tank.holeFittingSize!),
            SizedBox(height: 16)
          ],
        ],
      ),
    );
  }
}

class _DimensionProperties extends StatelessWidget {
  final SteelxTank tank;

  const _DimensionProperties(this.tank);

  @override
  Widget build(BuildContext context) {
    var d = tank.dimensions;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Dimensions',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          ),
          SizedBox(height: 16),
          Wrap(
            spacing: 24,
            runSpacing: 12,
            children: [
              if (d is HorizontalTankDimensions) ...[
                Text('Length: ${d.length} mm'),
                Text('Clearance: ${d.clearance} mm'),
              ] else if (d is VerticalTankDimensions) ...[
                Text('Diameter: ${d.diameter} mm'),
                Text('Height: ${d.height} mm'),
              ],

              // Manhole Dia
              if (tank.manholeDiameter != null)
                Text('Manhole Diameter: ${tank.manholeDiameter} mm'),
            ],
          ),
        ],
      ),
    );
  }
}

class _HoleSizeForFittingProperties extends StatelessWidget {
  final HoleFittingSize size;
  const _HoleSizeForFittingProperties(this.size);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hole Size for fitting',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          ),
          SizedBox(height: 16),
          Wrap(
            spacing: 24,
            runSpacing: 12,
            children: [
              Text('Inlet: ${size.inlet}"'),
              Text('Outlet: ${size.outlet}"'),
              Text('Drain: ${size.drain}"'),
              Text('Thickness: ${size.thickness} mm'),
            ],
          ),
        ],
      ),
    );
  }
}

class _InteractiveTank extends StatelessWidget {
  final SteelxTank tank;

  const _InteractiveTank(this.tank);

  @override
  Widget build(BuildContext context) {
    var d = tank.dimensions;

    return Container(
      width: 400,
      height: 420,
      child: Stack(
        children: [
          Center(child: _tankThumbnail),
          if (d is VerticalTankDimensions) ...[
            Align(
              alignment: Alignment.centerLeft,
              child: parameter(d.height.round(), 'mm', 'height'),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: parameter(d.diameter.round(), 'mm', 'diameter'),
            ),
          ] else if (d is HorizontalTankDimensions) ...[
            Align(
              alignment: Alignment.centerRight,
              child: parameter(d.clearance.round(), 'mm', 'clearance'),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: parameter(d.length.round(), 'mm', 'length'),
            ),
          ],
          if (tank.stand != null)
            Positioned(
              right: 10,
              bottom: 90,
              child: parameter(tank.stand, 'mm', 'stand'),
            )
        ],
      ),
    );
  }

  Widget parameter<T>(T value, String unit, String description) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "$value $unit",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
        Text(
          description,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget get _tankThumbnail => Image(
        image: AssetImage('assets/tank_size_selection_thumbnail.jpg'),
        height: 300,
      );
}
