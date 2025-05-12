# LearnForum - Swift Learning Forum App

This is a Swift application that demonstrates API integration with a learning forum backend. The app includes a QuestionBank feature that retrieves and displays question banks from the server.

## Requirements

- iOS 15.0+
- Xcode 14.0+
- Swift 5.7+

## Installation

1. Clone the repository
2. Open `LearnForum.xcodeproj` in Xcode
3. The project uses a pre-generated API client based on OpenAPI specifications

## API Configuration

The app is configured to connect to the backend API at http://43.165.196.25:8101. The API base URL can be modified in `LearnForumApp.swift` if needed.

## Features Implemented

- **QuestionBank API Integration**: The app demonstrates how to call the QuestionBank API and display the results
- **Error Handling**: Proper error handling for API failures with user-friendly messages
- **UI**: Simple UI to display the QuestionBank data

## Testing the API Integration

1. Run the app in a simulator or on a device
2. Navigate to the "Question Banks" tab
3. The app will automatically attempt to load the question banks
4. Use the refresh button if needed

## Troubleshooting

If you encounter API connection issues:

1. Verify that the API server is running
2. Check that the base URL is correctly set in `LearnForumApp.swift`
3. Check the Xcode console for detailed error messages

## Next Steps

- Add authentication support
- Implement create/edit functionality for question banks
- Add search capabilities
- Display related questions for each question bank 