import 'package:equatable/equatable.dart';

class Item extends Equatable {
	final String? id;
	final String? offerName;
	final String? offerImage;
	final String? storeName;
	final String? storeImage;
	final int? pointAmount;

	const Item({
		this.id, 
		this.offerName, 
		this.offerImage, 
		this.storeName, 
		this.storeImage, 
		this.pointAmount, 
	});

	factory Item.fromJson(Map<String, dynamic> json) => Item(
				id: json['id'] as String?,
				offerName: json['offerName'] as String?,
				offerImage: json['offerImage'] as String?,
				storeName: json['storeName'] as String?,
				storeImage: json['storeImage'] as String?,
				pointAmount: json['pointAmount'] as int?,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'offerName': offerName,
				'offerImage': offerImage,
				'storeName': storeName,
				'storeImage': storeImage,
				'pointAmount': pointAmount,
			};

	@override
	List<Object?> get props {
		return [
				id,
				offerName,
				offerImage,
				storeName,
				storeImage,
				pointAmount,
		];
	}
}
