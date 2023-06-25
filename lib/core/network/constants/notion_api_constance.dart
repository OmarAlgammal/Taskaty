class NotionApiConstance {
  static const String mainPageId = '0b4639aa4c0148c592716c6db65a40a4';

  static const String baseurl = 'https://api.notion.com/v1/';

  static const String createDatabasePath =
      '${baseurl}databases';

  static String databasePath(String databaseId) =>
      'databases/$databaseId/query';

  static const String createTaskPath = baseurl + 'pages';

  static String getTaskPath(String taskId) => baseurl + 'pages/$taskId';

  static String updateTaskPath(String taskId) => baseurl + 'pages/$taskId';

  static String deleteTaskPath(String taskId) => baseurl + 'blocks/$taskId';

  static const databaseHeaders = {
    'Notion-Version': '2022-06-28,',
    'Content-Type': 'application/json',
    'authorization': 'secret_O76bCHbib2zHUHi23MbRenhai7DLgjchZ8Zq1pMvoHp',
  };
}
