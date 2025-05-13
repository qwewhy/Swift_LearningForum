# LearnForum - Swift Learning Forum App

LearnForum is an iOS application providing mobile support for a learning forum. The app integrates with the learning forum backend API, implementing features like question bank browsing, user authentication, and question detail viewing.

## Repository

GitHub: [https://github.com/qwewhy/Swift_LearningForum](https://github.com/qwewhy/Swift_LearningForum)

## Project Introduction

This project is an iOS application developed with Swift, primarily implementing API integration with a learning forum backend. The app supports user login/registration, question bank browsing, question detail viewing, question searching, comment interaction, and more.

## Requirements

- iOS 15.0+
- Xcode 14.0+
- Swift 5.7+

## Installation

1. Clone the repository
2. Open `LearnForum.xcodeproj` in Xcode
3. The app uses a pre-generated API client based on OpenAPI specifications

## API Configuration

The app is configured to connect to the backend API server:
- API Base URL: http://43.165.196.25:8101
- The API Base URL can be modified in `LearnForumApp.swift`

## Key Features

- **User System**: Supports user registration, login, and logout
- **Question Bank**: Browse question bank lists and view details
- **Question Query**: Search and browse question lists
- **Question Details**: View detailed question content and answers
- **Comments**: Add and view comments for questions
- **User Center**: View personal profile and check-in records
- **Image Caching**: Implementation of image loading cache mechanism

## Project Structure

- `LearnForumApp.swift`: App entry point and API client configuration
- `ContentView.swift`: Main content view and navigation control
- `LoginView.swift`: User login and registration interface
- `QuestionBankView.swift`: Question bank list and detail views
- `AskQuestionView.swift`: Question search functionality
- `QuestionDetailView.swift`: Question details and answer display
- `UserProfileView.swift`: User profile page
- `ImageCache.swift`: Image caching implementation
- `SettingsView.swift`: Application settings interface

## Troubleshooting

If you encounter API connection issues:
1. Verify that the API server is running
2. Check that the base URL is correctly set in `LearnForumApp.swift`
3. Check the Xcode console for detailed error messages

## Development Team

- **qwewhy**: Hongyuan Wang
- **kyrie**: Jingyu Deng
- **ryin**: Yanao Kong
- **yuxing**: Yuxing Ren 