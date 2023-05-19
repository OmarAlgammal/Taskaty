class ApiConstance {
  static const String tasksDatabaseId = '99bba8a61af540aeab96520aba171ca7';

  static const String baseurl = 'https://api.notion.com/v1/';


  static String databasePath(String databaseId) =>
      'databases/$databaseId/query';

  static const String createTaskPath = baseurl + 'pages';

  static String getTaskPath(String taskId) => baseurl + 'pages/$taskId';

  static String updateTaskPath(String taskId) => baseurl + 'pages/$taskId';

  static String deleteTaskPath(String taskId) => baseurl + 'blocks/$taskId';

  static const databaseHeaders = {
    'Notion-Version': '2022-06-28,',
    'Content-Type': 'application/json',
    'authorization':
    'secret_JM7Wrj7qcdflIbjWxZJPUzqygCZdd7lh30pLkKii9j6',
  };
}
