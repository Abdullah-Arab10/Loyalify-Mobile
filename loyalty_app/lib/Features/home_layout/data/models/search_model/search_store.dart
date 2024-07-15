import 'package:equatable/equatable.dart';

class SearchStore extends Equatable {
  final int? id;
  final String? name;
  final String? category;
  final String? storeImage;

  const SearchStore({this.id, this.name, this.category, this.storeImage});

  factory SearchStore.fromJson(Map<String, dynamic> json) => SearchStore(
        id: json['id'] as int?,
        name: json['name'] as String?,
        category: json['category'] as String?,
        storeImage: json['storeImage'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'category': category,
        'storeImage': storeImage,
      };

  @override
  List<Object?> get props => [id, name, category, storeImage];
}
