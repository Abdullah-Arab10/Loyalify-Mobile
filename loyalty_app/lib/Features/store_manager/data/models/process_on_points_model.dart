class ProcessOnPointsModel {
  int? status;
  String? message;

  ProcessOnPointsModel({this.status, this.message});

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
}
