class Department {
  String rowID;
  String departmentID;
  String departmentName;
  String description;
  String manager;
  String departmentContact;
  String status;

  Department({
    required this.rowID,
    required this.departmentID,
    required this.departmentName,
    required this.description,
    required this.manager,
    required this.departmentContact,
    required this.status,
  });

  // Phương thức để tạo đối tượng từ JSON
  factory Department.fromJson(Map<String, dynamic> json) {
    return Department(
      rowID: json['RowID'],
      departmentID: json['DepartmentID'],
      departmentName: json['DepartmentName'],
      description: json['Description'],
      manager: json['Manager'],
      departmentContact: json['DepartmentContact'],
      status: json['Status'],
    );
  }

  // Phương thức để chuyển đổi đối tượng thành JSON
  Map<String, dynamic> toJson() {
    return {
      'RowID': rowID,
      'DepartmentID': departmentID,
      'DepartmentName': departmentName,
      'Description': description,
      'Manager': manager,
      'DepartmentContact': departmentContact,
      'Status': status,
    };
  }
}