
class CommissionReport {
  String rowID;
  String reportID;
  String type;
  String price;
  String amountCollected;
  String remainingAmount;
  String employeeID;
  String description;

  CommissionReport({
    required this.rowID,
    required this.reportID,
    required this.type,
    required this.price,
    required this.amountCollected,
    required this.remainingAmount,
    required this.employeeID,
    required this.description,
  });

  // Phương thức để tạo đối tượng từ JSON
  factory CommissionReport.fromJson(Map<String, dynamic> json) {
    return CommissionReport(
      rowID: json['RowID'],
      reportID: json['ReportID'],
      type: json['Type'],
      price: json['Price'],
      amountCollected: json['AmountCollected'],
      remainingAmount: json['RemainingAmount'],
      employeeID: json['EmployeeID'],
      description: json['Description'],
    );
  }

  // Phương thức để chuyển đổi đối tượng thành JSON
  Map<String, dynamic> toJson() {
    return {
      'RowID': rowID,
      'ReportID': reportID,
      'Type': type,
      'Price': price,
      'AmountCollected': amountCollected,
      'RemainingAmount': remainingAmount,
      'EmployeeID': employeeID,
      'Description': description,
    };
  }
}