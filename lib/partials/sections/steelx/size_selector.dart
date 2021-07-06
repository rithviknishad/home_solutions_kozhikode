import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animator/widgets/fading_entrances/fade_in.dart';
import 'package:flutter_animator/widgets/fading_entrances/fade_in_down.dart';
import 'package:flutter_animator/widgets/fading_entrances/fade_in_up.dart';
import 'package:home_solutions_kozhikode/partials/k_anim_prefs.dart';
import 'package:home_solutions_kozhikode/partials/sections/section.dart';
import 'package:home_solutions_kozhikode/partials/sections/steelx/tank_model.dart';

class SteelxTankSizesSection extends MySection {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return Container(
      padding: _getPadding(size),
      width: size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.lightBlue.shade200,
            theme.primaryColor,
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // The Heading
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 8),
            child: FadeInUp(
              preferences: normalAnimation,
              child: Text(
                "Available in variety of sizes that suit your needs",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 2,
                ),
              ),
            ),
          ),

          // Available Sizes
          SteelxAvailableSizes(),
          SizedBox(height: 30.0),
        ],
      ),
    );
  }

  EdgeInsets _getPadding(Size size) => EdgeInsets.symmetric(
        horizontal: max((size.width - maxDisplayWidth) / 2, 0) + 10,
      ).copyWith(top: 30, bottom: 60);
}

class SteelxAvailableSizes extends StatefulWidget {
  const SteelxAvailableSizes();

  @override
  _SteelxAvailableSizesState createState() => _SteelxAvailableSizesState();
}

class _SteelxAvailableSizesState extends State<SteelxAvailableSizes> {
  SteelxTank selectedTank = SteelxTank.allTanks.first;

  Axis tankAxis =
      SteelxTank.allTanks.first.isHorizontal ? Axis.horizontal : Axis.vertical;

  List<SteelxTank> get filteredTanks => [
        ...SteelxTank.allTanks.where(
            (t) => tankAxis == Axis.vertical ? t.isVertical : t.isHorizontal)
      ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Wrap(
      spacing: 120,
      runSpacing: 20,
      alignment: WrapAlignment.center,
      runAlignment: WrapAlignment.spaceBetween,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.center,
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 10,
                runSpacing: 10,
                children: [
                  for (final type in [Axis.vertical, Axis.horizontal])
                    FadeInDown(
                      preferences: slowAnimation,
                      child: GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        child: Theme(
                          data: theme.copyWith(canvasColor: Colors.transparent),
                          child: Chip(
                            side: BorderSide(color: Colors.white, width: 2),
                            backgroundColor: tankAxis == type
                                ? Colors.white
                                : Colors.transparent,
                            label: Text(
                              '$type'.replaceFirst('Axis.', '').toUpperCase(),
                              style: TextStyle(
                                color: tankAxis == type
                                    ? theme.primaryColor
                                    : Colors.white,
                                fontWeight: tankAxis == type
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                                letterSpacing: 1,
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          if (tankAxis != type) {
                            setState(() {
                              tankAxis = type;
                              selectedTank = filteredTanks.first;
                            });
                          }
                        },
                      ),
                    ),
                ],
              ),
            ),
            FadeInUp(
              preferences: slowAnimation,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "SELECT CAPACITY:".toUpperCase(),
                      style: TextStyle(
                        fontSize: 16,
                        color: theme.primaryColorLight,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.0,
                      ),
                    ),
                    SizedBox(height: 10),
                    DropdownButton<SteelxTank>(
                      value: selectedTank,
                      items: [
                        for (final type in filteredTanks)
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
                        for (final type in filteredTanks)
                          Text(
                            '${type.capacity} L',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Colors.white,
                              letterSpacing: 1,
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
            ),
          ],
        ),

        // Dimensions
        FadeIn(
          key: Key(selectedTank.model),
          preferences: normalAnimation.copyWith(offset: Duration.zero),
          child: _InteractiveTank(selectedTank),
        ),

        // Other properties
        FadeIn(
          key: Key('${selectedTank.model}_p'),
          preferences: slowAnimation,
          child: _TankProperties(selectedTank),
        ),
      ],
    );
  }
}

class _TankProperties extends StatelessWidget {
  final SteelxTank tank;

  const _TankProperties(this.tank);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18,
                color: Colors.white,
                letterSpacing: 1.0,
              ),
            ),
          ),

          _DimensionProperties(tank),
          SizedBox(height: 16),

          if (tank.holeFittingSize != null) ...[
            _HoleSizeForFittingProperties(tank.holeFittingSize!),
            SizedBox(height: 16)
          ],

          // Enquire Now Button
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                elevation: 6,
              ),
              onPressed: () {},
              child: Container(
                height: 55,
                width: 170,
                child: Center(
                  child: Text(
                    'ENQUIRE NOW',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                      color: theme.primaryColor,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _DimensionProperties extends StatelessWidget {
  final SteelxTank tank;

  const _DimensionProperties(this.tank);

  static const _propTextStyle = TextStyle(
    color: Colors.white,
    letterSpacing: 1,
  );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var d = tank.dimensions;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'DIMENSIONS',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 14,
              color: theme.primaryColorLight,
              letterSpacing: 1,
            ),
          ),
          SizedBox(height: 16),
          Wrap(
            spacing: 24,
            runSpacing: 12,
            children: [
              if (d is HorizontalTankDimensions) ...[
                Text(
                  'Length: ${d.length} mm',
                  style: _propTextStyle,
                ),
                Text(
                  'Clearance: ${d.clearance} mm',
                  style: _propTextStyle,
                ),
              ] else if (d is VerticalTankDimensions) ...[
                Text(
                  'Diameter: ${d.diameter} mm',
                  style: _propTextStyle,
                ),
                Text(
                  'Height: ${d.height} mm',
                  style: _propTextStyle,
                ),
              ],

              // Manhole Dia
              if (tank.manholeDiameter != null)
                Text(
                  'Manhole Diameter: ${tank.manholeDiameter} mm',
                  style: _propTextStyle,
                ),
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
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'HOLE SIZE FOR FITTING',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 14,
              color: theme.primaryColorLight,
              letterSpacing: 1,
            ),
          ),
          SizedBox(height: 16),
          Wrap(
            spacing: 24,
            runSpacing: 12,
            children: [
              Text(
                'Inlet: ${size.inlet}"',
                style: _DimensionProperties._propTextStyle,
              ),
              Text(
                'Outlet: ${size.outlet}"',
                style: _DimensionProperties._propTextStyle,
              ),
              Text(
                'Drain: ${size.drain}"',
                style: _DimensionProperties._propTextStyle,
              ),
              Text(
                'Thickness: ${size.thickness} mm',
                style: _DimensionProperties._propTextStyle,
              ),
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
            fontSize: 18,
            color: Colors.white,
            letterSpacing: 1,
          ),
        ),
        Text(
          description,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: Colors.white,
            letterSpacing: 1,
          ),
        ),
      ],
    );
  }

  Widget get _tankThumbnail => Image(
        image: AssetImage(
          'assets/steelx_tank_${tank.isHorizontal ? 'horizontal' : 'vertical'}.png',
        ),
        height: 300,
      );
}
