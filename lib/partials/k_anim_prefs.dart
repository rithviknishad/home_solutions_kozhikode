import 'package:flutter_animator/flutter_animator.dart';

const _defaultOffset = Duration(milliseconds: 500);

const slowAnimation = AnimationPreferences(
  duration: Duration(milliseconds: 800),
  offset: _defaultOffset,
);

const normalAnimation = AnimationPreferences(
  duration: Duration(milliseconds: 500),
  offset: _defaultOffset,
);

const swiftAnimation = AnimationPreferences(
  duration: Duration(milliseconds: 300),
  offset: _defaultOffset,
);
