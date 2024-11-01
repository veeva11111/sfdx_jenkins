public class TaskUtil {//28 April 2024...
  public static String getTaskPriority(String leadState) {
    // Validate input
    if(String.isBlank(leadState) || leadState.length() > 2) {
      return null;
    }
    String taskPriority;
    if(leadState == 'CA') {
      taskPriority = 'High'; 
    } else {
      taskPriority = 'Normal';
    }
    return taskPriority;
  }
}
