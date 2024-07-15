import 'package:equatable/equatable.dart';

import 'search_store.dart';

class SearchStoresModel extends Equatable {
  final int? status;
  final List<SearchStore> stores;

  const SearchStoresModel({this.status, required this.stores});

  factory SearchStoresModel.fromJson(Map<String, dynamic> json) => SearchStoresModel(
        status: json['status'] as int?,
        stores: (json['items'] as List<dynamic>)
            .map((e) => SearchStore.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'items': stores.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [status, stores];
}
