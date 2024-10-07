class SavedNewsFeed {
  String rowID;
  String employeeID;
  String newsFeedID;
  String dateSaved;
  String code;

  SavedNewsFeed({
    required this.rowID,
    required this.employeeID,
    required this.newsFeedID,
    required this.dateSaved,
    required this.code,
  });

  // Phương thức để tạo đối tượng từ JSON
  factory SavedNewsFeed.fromJson(Map<String, dynamic> json) {
    return SavedNewsFeed(
      rowID: json['RowID'],
      employeeID: json['EmployeeID'],
      newsFeedID: json['NewsFeedID'],
      dateSaved: json['DateSaved'],
      code: json['Code'],
    );
  }

  // Phương thức để chuyển đổi đối tượng thành JSON
  Map<String, dynamic> toJson() {
    return {
      'RowID': rowID,
      'EmployeeID': employeeID,
      'NewsFeedID': newsFeedID,
      'DateSaved': dateSaved,
      'Code': code,
    };
  }
}