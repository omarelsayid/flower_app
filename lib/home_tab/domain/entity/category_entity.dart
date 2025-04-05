// lib/categories/domain/entities/category_entity.dart

import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  final String id;
  final String name;
  final String slug;
  final String image;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int productsCount;

  const CategoryEntity({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
    required this.productsCount,
  });

  @override
  List<Object?> get props =>
      [id, name, slug, image, createdAt, updatedAt, productsCount];
}
