import 'package:equatable/equatable.dart';

import 'items.dart';

class StoreDetailsModel extends Equatable {
	final int? status;
	final Items? items;

	const StoreDetailsModel({this.status, this.items});

	factory StoreDetailsModel.fromJson(Map<String, dynamic> json) {
		return StoreDetailsModel(
			status: json['status'] as int?,
			items: json['items'] == null
						? null
						: Items.fromJson(json['items'] as Map<String, dynamic>),
		);
	}



	Map<String, dynamic> toJson() => {
				'status': status,
				'items': items?.toJson(),
			};

	@override
	List<Object?> get props => [status, items];
}
