import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:flutter_animator/widgets/fading_entrances/fade_in.dart';
import 'package:flutter_animator/widgets/fading_entrances/fade_in_down.dart';
import 'package:home_solutions_kozhikode/partials/sections/contact.dart';
import 'package:home_solutions_kozhikode/partials/sections/section.dart';
import 'package:home_solutions_kozhikode/partials/sections/steelx/tank_model.dart';
import 'package:home_solutions_kozhikode/routes/landing.dart';

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
            child: FadeIn(
              preferences: const AnimationPreferences(
                duration: Duration(milliseconds: 1000),
                offset: Duration(milliseconds: 500),
              ),
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

  build(context) {
    final theme = Theme.of(context);

    return Wrap(
      spacing: 50,
      runSpacing: 20,
      alignment: WrapAlignment.center,
      runAlignment: WrapAlignment.spaceBetween,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = Axis.values.length; i > 0; --i)
                  tankAxisTypeChip(Axis.values[i - 1], theme, i),
              ],
            ),
            SizedBox(height: 30),
            FadeIn(
              preferences: const AnimationPreferences(
                duration: Duration(milliseconds: 600),
                offset: Duration(milliseconds: 800),
              ),
              child: Text(
                'SELECT CAPACITY',
                style: TextStyle(
                  fontSize: 16,
                  color: theme.primaryColorLight,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.0,
                ),
              ),
            ),
            SizedBox(height: 18),
            FadeIn(
              preferences: const AnimationPreferences(
                duration: Duration(milliseconds: 500),
                offset: Duration(milliseconds: 1000),
              ),
              child: _sizeSelectorDropDown,
            ),
          ],
        ),

        // Dimensions
        FadeIn(
          preferences: const AnimationPreferences(
            duration: Duration(milliseconds: 1000),
            offset: Duration(milliseconds: 1000),
          ),
          child: _InteractiveTank(selectedTank),
        ),

        // Other properties
        _TankProperties(selectedTank),
      ],
    );
  }

  Widget tankAxisTypeChip(Axis type, ThemeData theme, int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FadeInDown(
        preferences: AnimationPreferences(
          duration: Duration(milliseconds: 700),
          offset: Duration(milliseconds: 500 + index * 300),
        ),
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          child: Theme(
            data: theme.copyWith(canvasColor: Colors.transparent),
            child: Chip(
              side: BorderSide(color: Colors.white, width: 2),
              backgroundColor:
                  tankAxis == type ? Colors.white : Colors.transparent,
              label: Text(
                '$type'.replaceFirst('Axis.', '').toUpperCase(),
                style: TextStyle(
                  color: tankAxis == type ? theme.primaryColor : Colors.white,
                  fontWeight:
                      tankAxis == type ? FontWeight.bold : FontWeight.normal,
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
    );
  }

  Widget get _sizeSelectorDropDown {
    return DropdownButton<SteelxTank>(
      iconEnabledColor: Colors.white,
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
    );
  }
}

class _TankProperties extends StatelessWidget {
  final SteelxTank tank;

  const _TankProperties(this.tank);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final d = tank.dimensions;

    return Container(
      key: Key('${tank.model}_p'),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
      width: 300,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Model Number
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Pulse(
              preferences: AnimationPreferences(
                duration: const Duration(milliseconds: 400),
                offset: const Duration(milliseconds: 1000),
              ),
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
          ),

          SizedBox(height: 16),
          FadeIn(
            preferences: AnimationPreferences(
              duration: const Duration(milliseconds: 400),
            ),
            child: Text(
              'DIMENSIONS',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 14,
                color: theme.primaryColorLight,
                letterSpacing: 1,
              ),
            ),
          ),
          SizedBox(height: 16),
          Wrap(
            spacing: 24,
            runSpacing: 10,
            children: [
              if (d is HorizontalTankDimensions) ...[
                FadeIn(
                  preferences: AnimationPreferences(
                    duration: const Duration(milliseconds: 400),
                    offset: const Duration(milliseconds: 100),
                  ),
                  child: Text(
                    'Length: ${d.length} mm',
                    style: _propTextStyle,
                  ),
                ),
                FadeIn(
                  preferences: AnimationPreferences(
                    duration: const Duration(milliseconds: 400),
                    offset: const Duration(milliseconds: 130),
                  ),
                  child: Text(
                    'Clearance: ${d.clearance} mm',
                    style: _propTextStyle,
                  ),
                ),
              ] else if (d is VerticalTankDimensions) ...[
                FadeIn(
                  preferences: AnimationPreferences(
                    duration: const Duration(milliseconds: 400),
                    offset: const Duration(milliseconds: 100),
                  ),
                  child: Text(
                    'Diameter: ${d.diameter} mm',
                    style: _propTextStyle,
                  ),
                ),
                FadeIn(
                  preferences: AnimationPreferences(
                    duration: const Duration(milliseconds: 400),
                    offset: const Duration(milliseconds: 130),
                  ),
                  child: Text(
                    'Height: ${d.height} mm',
                    style: _propTextStyle,
                  ),
                ),
              ],

              // Manhole Dia
              if (tank.manholeDiameter != null)
                FadeIn(
                  preferences: AnimationPreferences(
                    duration: const Duration(milliseconds: 400),
                    offset: const Duration(milliseconds: 200),
                  ),
                  child: Text(
                    'Manhole Diameter: ${tank.manholeDiameter} mm',
                    style: _propTextStyle,
                  ),
                ),
            ],
          ),
          SizedBox(height: 16),

          if (tank.holeFittingSize != null) ...[
            _HoleSizeForFittingProperties(tank.holeFittingSize!),
            SizedBox(height: 28)
          ],

          // Enquire Now Button
          Align(
            alignment: Alignment.centerRight,
            child: BounceIn(
              preferences: const AnimationPreferences(
                duration: Duration(milliseconds: 500),
                offset: Duration(milliseconds: 500),
              ),
              key: Key('${tank.model}_g_quote'),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey.shade300,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  elevation: 10,
                  padding: const EdgeInsets.all(20),
                ),
                onPressed: () {
                  ContactUsForm.commentController.text =
                      'I would like to get a quote on the ${tank.capacity}L model of SteelX Stainless Steel tank model: ${tank.model}.';

                  InlineNavBar.sections['Contact']?.call(context);
                },
                child: Text(
                  'GET QUOTE',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  static const _propTextStyle = TextStyle(
    color: Colors.white,
    letterSpacing: 1,
  );
}

class _HoleSizeForFittingProperties extends StatelessWidget {
  final HoleFittingSize size;
  const _HoleSizeForFittingProperties(this.size);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FadeIn(
          preferences: AnimationPreferences(
            duration: const Duration(milliseconds: 400),
            offset: const Duration(milliseconds: 230),
          ),
          child: Text(
            'HOLE SIZE FOR FITTING',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 14,
              color: theme.primaryColorLight,
              letterSpacing: 1,
            ),
          ),
        ),
        SizedBox(height: 16),
        Wrap(
          spacing: 24,
          runSpacing: 12,
          children: [
            FadeIn(
              preferences: AnimationPreferences(
                duration: const Duration(milliseconds: 400),
                offset: const Duration(milliseconds: 260),
              ),
              child: Text(
                'Inlet: ${size.inlet}"',
                style: _TankProperties._propTextStyle,
              ),
            ),
            FadeIn(
              preferences: AnimationPreferences(
                duration: const Duration(milliseconds: 400),
                offset: const Duration(milliseconds: 300),
              ),
              child: Text(
                'Outlet: ${size.outlet}"',
                style: _TankProperties._propTextStyle,
              ),
            ),
            FadeIn(
              preferences: AnimationPreferences(
                duration: const Duration(milliseconds: 400),
                offset: const Duration(milliseconds: 330),
              ),
              child: Text(
                'Drain: ${size.drain}"',
                style: _TankProperties._propTextStyle,
              ),
            ),
            FadeIn(
              preferences: AnimationPreferences(
                duration: const Duration(milliseconds: 400),
                offset: const Duration(milliseconds: 360),
              ),
              child: Text(
                'Thickness: ${size.thickness} mm',
                style: _TankProperties._propTextStyle,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _InteractiveTank extends StatelessWidget {
  final SteelxTank tank;

  const _InteractiveTank(this.tank);

  @override
  Widget build(BuildContext context) {
    final d = tank.dimensions;

    return SizedBox(
      width: 400,
      height: tank.isVertical ? 360 : 300,
      child: Stack(
        children: [
          // Tank Thumbnail
          Align(
            alignment: tank.isHorizontal
                ? Alignment.topCenter
                : Alignment.bottomCenter,
            child: BounceIn(
              key: Key('${tank.model}'),
              preferences: const AnimationPreferences(
                duration: Duration(milliseconds: 200),
                offset: Duration(milliseconds: 100),
              ),
              child: _tankThumbnail,
            ),
          ),

          // Other relevant dimensions
          if (d is VerticalTankDimensions) ...[
            Align(
              alignment: Alignment.topCenter,
              child: parameter(d.diameter.round(), 'mm', 'diameter', 1),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: parameter(d.height.round(), 'mm', 'height', 2),
            ),
          ] else if (d is HorizontalTankDimensions) ...[
            Align(
              alignment: Alignment.bottomCenter,
              child: parameter(d.length.round(), 'mm', 'length', 1),
            ),
          ],

          // # of stands
          if (tank.stand != null)
            Positioned(
              right: 10,
              bottom: 20,
              child: parameter(tank.stand, 'mm', 'stand', 3),
            )
        ],
      ),
    );
  }

  Widget parameter<T>(T value, String unit, String description, int pos) {
    return FadeIn(
      key: Key('$value $unit $description $pos'),
      preferences: AnimationPreferences(
        duration: const Duration(milliseconds: 400),
        offset: Duration(milliseconds: 200 + pos * 100),
      ),
      child: Column(
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
      ),
    );
  }

  Widget get _tankThumbnail {
    if (tank.isHorizontal) {
      return Image(
        image: AssetImage(
          'assets/steelx_tank_horizontal.png',
        ),
        height: 250,
      );
    } else {
      return Image(
        image: AssetImage(
          'assets/steelx_tank_vertical.png',
        ),
        height: 300,
      );
    }
  }
}
