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

        // Slider(
        //   value: selectedIndex.toDouble(),
        //   min: 0.0,
        //   max: (allTanks.length - 1).toDouble(),
        //   divisions: allTanks.length,
        //   onChanged: (value) => setState(() => selectedIndex = value.toInt()),
        //   activeColor: theme.primaryColor,
        //   label: '${allTanks[selectedIndex].litres} Litres',
        // ),

        // The Tank
        Wrap(
          spacing: 120,
          runSpacing: 20,
          alignment: WrapAlignment.center,
          runAlignment: WrapAlignment.spaceBetween,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            // Capacity
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Capacity: ",
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
          "Available in a variety of sizes",
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
    return SizedBox(
      width: 300,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Model Number
          Text(
            "${tank.model}",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
          ),

          _DimensionProperties(tank),

          if ((tank.inlet ?? tank.outlet ?? tank.thickness ?? tank.drain) !=
              null)
            _HoleSizeForFittingProperties(tank),
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
          SizedBox(height: 10),
          Wrap(
            spacing: 16,
            runSpacing: 4,
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
  final SteelxTank tank;
  const _HoleSizeForFittingProperties(this.tank);

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
          SizedBox(height: 10),
          Wrap(
            spacing: 16,
            runSpacing: 4,
            children: [
              // Inlet
              if (tank.inlet != null) Text('Inlet: ${tank.inlet}"'),

              // Outlet
              if (tank.outlet != null) Text('Outlet: ${tank.outlet}"'),

              // Drain
              if (tank.drain != null) Text('Drain: ${tank.drain}"'),

              // Thickness
              if (tank.thickness != null)
                Text('Thickness: ${tank.thickness} mm'),
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
              child: parameter(d.height, 'mm', 'height'),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: parameter(d.diameter, 'mm', 'diameter'),
            ),
          ] else if (d is HorizontalTankDimensions) ...[
            Align(
              alignment: Alignment.centerRight,
              child: parameter(d.clearance, 'mm', 'clearance'),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: parameter(d.length, 'mm', 'length'),
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
