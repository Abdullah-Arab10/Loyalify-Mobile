import 'package:equatable/equatable.dart';

import 'items.dart';

class OfferDetailsModel extends Equatable {
	final int? status;
	final Items? items;

	const OfferDetailsModel({this.status, this.items});

	factory OfferDetailsModel.fromJson(Map<String, dynamic> json) {
		return OfferDetailsModel(
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
