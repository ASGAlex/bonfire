import 'package:bonfire/collision/collision_config.dart';
import 'package:bonfire/lighting/lighting_config.dart';
import 'package:bonfire/player/rotation_player.dart';
import 'package:bonfire/util/extensions/game_component_extensions.dart';
import 'package:flame/components.dart';
import 'package:flutter/widgets.dart';

import '../../mixins/attackable.dart';

extension RotationPlayerExtensions on RotationPlayer {
  void simpleAttackRange({
    /// use animation facing right.
    required Future<SpriteAnimation> animation,
    required Vector2 size,
    Future<SpriteAnimation>? animationDestroy,
    Vector2? destroySize,
    dynamic id,
    double speed = 150,
    double damage = 1,
    double? radAngleDirection,
    bool withDecorationCollision = true,
    VoidCallback? onDestroy,
    CollisionConfig? collision,
    LightingConfig? lightingConfig,
  }) {
    double? angle = radAngleDirection ?? this.angle;

    this.simpleAttackRangeByAngle(
      angle: angle,
      animation: animation,
      animationDestroy: animationDestroy,
      size: size,
      id: id,
      speed: speed,
      damage: damage,
      withDecorationCollision: withDecorationCollision,
      onDestroy: onDestroy,
      destroySize: destroySize,
      collision: collision,
      lightingConfig: lightingConfig,
      attackFrom: AttackFromEnum.PLAYER_OR_ALLY,
    );
  }

  void simpleAttackMelee({
    required Future<SpriteAnimation> animationTop,
    required double damage,
    required Vector2 size,
    dynamic id,
    double? radAngleDirection,
    bool withPush = true,
  }) {
    double? angle = radAngleDirection ?? this.angle;
    this.simpleAttackMeleeByAngle(
      radAngleDirection: angle,
      animationTop: animationTop,
      damage: damage,
      id: id,
      size: size,
      withPush: withPush,
      attacker: AttackFromEnum.PLAYER_OR_ALLY,
    );
  }
}
