class Task {
  DateTime date;
  String subject; //教科
  int max_page; //ページ総数 (１日あたり)
  int progress_page; //現在進んでるページ

  Task(this.date, this.subject, this.max_page, this.progress_page);
}

List<Task> todaystask =[
  Task(DateTime.now(), '国語', 5, 1),
  Task(DateTime.now(), '化学', 8, 0),
  Task(DateTime.now(), '数学', 3, 3),
  Task(DateTime.now(), '英語', 6, 4),
];


List<Task> alltask = [
  Task(DateTime.now(), '国語', 5, 1),
  Task(DateTime.now(), '化学', 8, 0),
  Task(DateTime.now(), '数学', 3, 3),
  Task(DateTime.now(), '英語', 6, 4),
  Task(DateTime.now().add(Duration(days: 1)), '国語', 2, 0),
  Task(DateTime.now().add(Duration(days: 1)), '化学', 4, 0),
  Task(DateTime.now().add(Duration(days: 1)), '数学', 3, 0),
  Task(DateTime.now().add(Duration(days: 1)), '英語', 6, 0),
  Task(DateTime.now().add(Duration(days: 2)), '国語', 2, 0),
  Task(DateTime.now().add(Duration(days: 2)), '物理', 4, 0),
  Task(DateTime.now().add(Duration(days: 2)), '数学', 3, 0),
  Task(DateTime.now().add(Duration(days: 3)), '日本史', 2, 0),
  Task(DateTime.now().add(Duration(days: 3)), '世界史', 4, 0),
  Task(DateTime.now().add(Duration(days: 3)), '数学', 3, 0),
  Task(DateTime.now().add(Duration(days: 3)), '物理', 3, 0),
  Task(DateTime.now().add(Duration(days: 3)), '生物', 3, 0),
];