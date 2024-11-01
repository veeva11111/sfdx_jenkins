@isTest
private class TaskUtilTest {//test class
    @isTest static void testGetTaskPriority() {
        // Test with 'CA' which should return 'High'
        System.assertEquals('High', TaskUtil.getTaskPriority('CA'), 'Expected High priority for CA');

        // Test with another state which should return 'Normal'
        System.assertEquals('Normal', TaskUtil.getTaskPriority('NY'), 'Expected Normal priority for NY');

        // Test with null which should return null
        System.assertEquals(null, TaskUtil.getTaskPriority(null), 'Expected null for blank lead state');

        // Test with empty string which should return null
        System.assertEquals(null, TaskUtil.getTaskPriority(''), 'Expected null for empty lead state');

        // Test with a long string which should return null
        System.assertEquals(null, TaskUtil.getTaskPriority('CALIFORNIA'), 'Expected null for long lead state');
    }
}
