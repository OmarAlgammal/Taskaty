enum MainTabs {
  today('Today', 0),
  weekly('Weekly', 1),
  monthly('Monthly', 2),
  all('All',3);

  static List<MainTabs> get periodsTaps => [weekly, monthly];

  final String name;
  final int groupNum;
  const MainTabs(this.name, this.groupNum);
}
