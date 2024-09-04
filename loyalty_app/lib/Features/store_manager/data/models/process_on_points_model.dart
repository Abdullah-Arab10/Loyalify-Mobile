import 'package:equatable/equatable.dart';

class ProcessOnPointsModel extends Equatable{
  final int? status;
  final String? message;

  const ProcessOnPointsModel({this.status, this.message});

  factory ProcessOnPointsModel.fromJson(Map<String, dynamic> json) {
    return ProcessOnPointsModel(
      status: json['status'] as int?,
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
      };

  @override
  List<Object?> get props => [status, message];
}
