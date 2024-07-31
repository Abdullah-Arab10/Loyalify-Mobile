import 'package:equatable/equatable.dart';

class Items extends Equatable {
	final String? name;
	final String? description;
	final String? address;
	final String? phoneNumber;
	final int? categoryId;
	final String? userId;
	final String? coverImage;
	final String? storeImage;
	final String? state;

	const Items({
		this.name, 
		this.description, 
		this.address, 
		this.phoneNumber, 
		this.categoryId, 
		this.userId, 
		this.coverImage, 
		this.storeImage, 
		this.state, 
	});

	factory Items.fromJson(Map<String, dynamic> json) => Items(
				name: json['name'] as String?,
				description: json['description'] as String?,
				address: json['address'] as String?,
				phoneNumber: json['phoneNumber'] as String?,
				categoryId: json['categoryId'] as int?,
				userId: json['userId'] as String?,
				coverImage: json['coverImage'] as String?,
				storeImage: json['storeImage'] as String?,
				state: json['state'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'name': name,
				'description': description,
				'address': address,
				'phoneNumber': phoneNumber,
				'categoryId': categoryId,
				'userId': userId,
				'coverImage': coverImage,
				'storeImage': storeImage,
				'state': state,
			};

	@override
	List<Object?> get props {
		return [
				name,
				description,
				address,
				phoneNumber,
				categoryId,
				userId,
				coverImage,
				storeImage,
				state,
		];
	}
}
