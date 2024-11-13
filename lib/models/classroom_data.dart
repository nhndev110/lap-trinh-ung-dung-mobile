class ClassroomData {
  late String id;
  late String subject;
  late String semester;
  late String bgURL;
  late int totalStudent;

  ClassroomData(
      this.id, this.subject, this.semester, this.totalStudent,
      {this.bgURL = ""});
}

var listClassroom = [
  ClassroomData(
    "2024-2025.TIN2022.001",
    "Lập Trình Ứng Dụng Di Động - Nhóm 1",
    "2024-2025.1",
    50,
  ),
  ClassroomData(
    "2024-2025.TIN2022.002",
    "Lập Trình Ứng Dụng Di Động - Nhóm 2",
    "2024-2025.1",
    51,
    bgURL: "images/code.jpg",
  ),
  ClassroomData(
    "2024-2025.TIN2022.003",
    "Lập Trình Ứng Dụng Di Động - Nhóm 3",
    "2024-2025.1",
    52,
    bgURL: "images/honors.jpg",
  ),
  ClassroomData(
    "2024-2025.TIN2022.004",
    "Lập Trình Ứng Dụng Di Động - Nhóm 4",
    "2024-2025.1",
    53,
    bgURL: "images/honors.jpg",
  ),
  ClassroomData(
    "2024-2025.TIN2022.005",
    "Lập Trình Ứng Dụng Di Động - Nhóm 5",
    "2024-2025.1",
    54,
    bgURL: "images/learnlanguage.jpg",
  ),
  ClassroomData(
    "2024-2025.TIN2022.006",
    "Lập Trình Ứng Dụng Di Động - Nhóm 6",
    "2024-2025.1",
    55,
    bgURL: "images/learnlanguage.jpg",
  ),
  ClassroomData(
    "2024-2025.TIN2022.007",
    "Lập Trình Ứng Dụng Di Động - Nhóm 7",
    "2024-2025.1",
    56,
    bgURL: "images/learnlanguage.jpg",
  ),
];
