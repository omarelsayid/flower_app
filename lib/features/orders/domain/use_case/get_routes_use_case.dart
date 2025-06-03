import 'package:flower_app/features/orders/data/model/location_info.dart';
import 'package:flower_app/features/orders/data/model/route_modifiers.dart';
import 'package:flower_app/features/orders/domain/entites/route_entity.dart';
import 'package:flower_app/features/orders/domain/repo/routes_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoadRouteUseCase {
  final RouteRepository repository;
  LoadRouteUseCase(this.repository);

  Future<RouteEntity> call({
    required LocationInfo origin,
    required LocationInfo destination,
    RouteModifiers? modifiers,
  }) {
    return repository.loadRoute(
      origin: origin,
      destination: destination,
      modifiers: modifiers,
    );
  }
}
