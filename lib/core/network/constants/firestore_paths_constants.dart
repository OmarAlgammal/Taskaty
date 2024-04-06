class FirestorePathsConstants{
  static String allTasksPath (String userId)  => '$userId/tasks/all';
  static String singleTaskPath (String userId,String taskId)  => '$userId/tasks/all/$taskId';
  static String allPaymentsPath (String userId) => '$userId/payments/all';
  static String savePaymentPath (String userId, String transactionId) => '$userId/payments/all/$transactionId';
  static String pricingPath = 'pricing/pricing';
  static String thanksPath = 'thanks';
  static String registrationPath = 'registration';
}