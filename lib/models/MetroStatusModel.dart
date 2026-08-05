class MetroStatus {

  final String lineName;
  final String status;


  MetroStatus({
    required this.lineName,
    required this.status,
  });


  factory MetroStatus.fromJson(Map<String,dynamic> json){

    return MetroStatus(
      lineName: json['line_name'],
      status: json['status'],
    );

  }

}