import 'package:equatable/equatable.dart';

import 'store.dart';

class StoresModel extends Equatable {
  final int? status;
  final List<Store> stores;

  const StoresModel({this.status, required this.stores});

  factory StoresModel.fromJson(Map<String, dynamic> json) => StoresModel(
        status: json['status'] as int?,
        stores: (json['items'] as List<dynamic>)
            .map((e) => Store.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'items': stores.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [status, stores];
}
