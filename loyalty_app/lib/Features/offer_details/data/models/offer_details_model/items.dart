import 'package:equatable/equatable.dart';

class Items extends Equatable {
	final String? name;
	final String? description;
	final String? image;
	final double? pointAmount;
	final String? createdAt;
	final String? deadline;
	final double? userPoints;

	const Items({
		this.name, 
		this.description, 
		this.image, 
		this.pointAmount, 
		this.createdAt, 
		this.deadline, 
		this.userPoints, 
	});

	factory Items.fromJson(Map<String, dynamic> json) => Items(
				name: json['name'] as String?,
				description: json['description'] as String?,
				image: json['image'] as String?,
				pointAmount: json['pointAmount'] as double?,
				createdAt: json['createdAt'] as String?,
				deadline: json['deadline'] as String?,
				userPoints: json['userPoints'] as double?,
			);

	Map<String, dynamic> toJson() => {
				'name': name,
				'description': description,
				'image': image,
				'pointAmount': pointAmount,
				'createdAt': createdAt,
				'deadline': deadline,
				'userPoints': userPoints,
			};

	@override
	List<Object?> get props {
		return [
				name,
				description,
				image,
				pointAmount,
				createdAt,
				deadline,
				userPoints,
		];
	}
}
