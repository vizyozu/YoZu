class HistoryModel {
  String name;
  String description;
  String university;
  String noOfCource;
  String tag1;
  String tag2;

  HistoryModel(
      { this.name,

         this.description,

         this.noOfCource,

         this.university,

         this.tag1,

         this.tag2});
}

class HistoryList {
  static List<HistoryModel> list = [
    HistoryModel(
        name: "Camp-off",
        description: "Working on 20 march Want to go village for family function, and want holidy on 15 April 2021.",
        university: "Nazarat",
        noOfCource: "10th March 2021",
        tag1: "Not Approved",
        tag2: "Approved"),
    HistoryModel(
        name: "Not well",
        description: "Want holiday tomorrow.",
        university: "Nazarat",
        noOfCource: "1st March 2021",
        tag1: "Not Approved",
        tag2: "Approved"),
    HistoryModel(
        name: "Not well",
        description: "Want holiday tomorrow.",
        university: "Nazarat",
        noOfCource: "5th February 2021",
        tag1: "Not Approved",
        tag2: "Approved"),
  ];
}
