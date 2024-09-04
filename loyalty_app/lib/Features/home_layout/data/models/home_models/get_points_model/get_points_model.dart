import 'package:equatable/equatable.dart';

class GetPointsModel extends Equatable {
  final int? status;
  final double? points;

  const GetPointsModel({this.status, this.points});

  factory GetPointsModel.fromJson(Map<String, dynamic> json) {
    return GetPointsModel(
      status: json['status'] as int?,
      points: json['points'] as double?,
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'points': points,
      };

  @override
  List<Object?> get props => [status, points];
}
