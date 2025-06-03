import 'package:flower_app/features/orders/data/model/location_info.dart';
import 'package:flower_app/features/orders/data/model/route_modifiers.dart';
import 'package:flower_app/features/orders/domain/entites/route_entity.dart';


abstract class RouteRepository {
  Future<RouteEntity> loadRoute({
    required LocationInfo origin,
    required LocationInfo destination,
    RouteModifiers? modifiers,
  });
}