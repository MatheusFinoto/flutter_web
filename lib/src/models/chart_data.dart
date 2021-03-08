class ChartData {
  String type;
  int index;
  int value;

  ChartData({this.type, this.index, this.value});

  factory ChartData.fromJson(Map<String, dynamic> json) {
    return ChartData(
        type : json['type'],
        index : json['index'],
        value : json['value'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['index'] = this.index;
    data['value'] = this.value;
    return data;
  }
}
