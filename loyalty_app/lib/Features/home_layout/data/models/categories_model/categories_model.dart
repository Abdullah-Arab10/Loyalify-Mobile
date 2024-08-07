import 'package:equatable/equatable.dart';

import 'category.dart';

class CategoriesModel extends Equatable {
  final int? status;
  final List<Category> categories;

  const CategoriesModel({this.status, required this.categories});

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      status: json['status'] as int?,
      categories: (json['items'] as List<dynamic>)
          .map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'items': categories.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [status, categories];
}
