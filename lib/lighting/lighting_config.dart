import 'package:bonfire/bonfire.dart';
import 'package:bonfire/util/pulse_value.dart';
import 'package:flutter/widgets.dart';

/// Class used to configure lighting
class LightingConfig {
  /// Radius of the lighting
  final double radius;

  /// Color of the lighting
  final Color color;

  /// Enable pulse effect in lighting
  final bool withPulse;

  /// Light follow component angle
  final bool useComponentAngle;

  /// Configure variation in pulse effect
  final double pulseVariation;

  /// Configure speed in pulse effect
  final double pulseSpeed;

  /// Configure curve in pulse effect
  final Curve pulseCurve;

  /// Configure blur in lighting
  final double blurBorder;

  /// Configure type of the lighting
  final LightingType type;

  final Vector2 align;

  double _blurSigma = 0;

  PulseValue? _pulseAnimation;

  LightingConfig({
    required this.radius,
    required this.color,
    this.withPulse = false,
    this.useComponentAngle = false,
    this.pulseCurve = Curves.decelerate,
    this.pulseVariation = 0.1,
    this.pulseSpeed = 1,
    this.blurBorder = 20,
    this.type = LightingType.circle,
    Vector2? align,
  }) : this.align = align ?? Vector2.zero() {
    _pulseAnimation = PulseValue(speed: pulseSpeed, curve: pulseCurve);
    _blurSigma = _convertRadiusToSigma(blurBorder);
  }

  void update(double dt) {
    _pulseAnimation?.update(dt);
  }

  double get valuePulse => _pulseAnimation?.value ?? 0.0;
  double get blurSigma => _blurSigma;

  static double _convertRadiusToSigma(double radius) {
    return radius * 0.57735 + 0.5;
  }

  LightingConfig copyWith({
    double? radius,
    Color? color,
    bool? withPulse,
    bool? useComponentAngle,
    double? pulseVariation,
    double? pulseSpeed,
    Curve? pulseCurve,
    double? blurBorder,
    LightingType? type,
  }) {
    return LightingConfig(
      radius: radius ?? this.radius,
      color: color ?? this.color,
      withPulse: withPulse ?? this.withPulse,
      useComponentAngle: useComponentAngle ?? this.useComponentAngle,
      pulseVariation: pulseVariation ?? this.pulseVariation,
      pulseSpeed: pulseSpeed ?? this.pulseSpeed,
      pulseCurve: pulseCurve ?? this.pulseCurve,
      blurBorder: blurBorder ?? this.blurBorder,
      type: type ?? this.type,
    );
  }
}
