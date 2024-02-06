@isTest
public class ThreadTokenControllerTest {
    @isTest static void testGetTokens() {
        // Arrange
        // Create a test case
        Case testCase = new Case(Subject = 'Test Case', Status = 'New');
        insert testCase;

        ThreadTokenController.Request req = new ThreadTokenController.Request();
        req.recordId = testCase.Id; // use the ID of the test case
        List<ThreadTokenController.Request> requests = new List<ThreadTokenController.Request>{req};

        // Act
        Test.startTest();
        List<ThreadTokenController.Response> responses = ThreadTokenController.getTokens(requests);
        Test.stopTest();

        // Assert
        System.assertEquals(1, responses.size(), 'Expected one response');
        System.assertNotEquals(null, responses[0].formattedToken, 'Expected a non-null token');
    }
}