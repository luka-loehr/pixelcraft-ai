# PixelCraft AI ஆर्ट 🎨

PixelCraft AI is a Flutter application that generates unique pixel art images based on user prompts using Google's Imagen model via the Gemini API. Users can enter a text prompt, generate an image, view it within the app, and save it to their device's photo library.

## Features

*   **Text-to-Image Generation**: Leverages Google's Imagen model to create pixel art from text prompts.
*   **Simple UI**: Clean and intuitive interface for easy interaction.
*   **Image Display**: Shows the generated pixel art directly in the app.
*   **Save to Photos**: Allows users to save their creations to their device's photo gallery (iOS/Android).
*   **Cross-Platform**: Built with Flutter for Web, iOS, and Android support.

## Setup Instructions

### Prerequisites

1.  **Flutter SDK**: Ensure you have the Flutter SDK installed. You can find installation instructions on the [official Flutter website](https://flutter.dev/docs/get-started/install).
2.  **Git**: Required for cloning the repository.
3.  **IDE**: An IDE like VS Code with the Flutter extension or Android Studio.
4.  **(For iOS)**: Xcode installed on a macOS machine.
5.  **(For Android)**: Android Studio and Android SDK setup.

### 1. Clone the Repository

```bash
git clone https://github.com/luka-loehr/pixelcraft-ai.git
cd pixelcraft-ai
```

### 2. Install Dependencies

Navigate to the project directory and run:

```bash
flutter pub get
```

This command will fetch all the necessary Dart/Flutter packages defined in `pubspec.yaml`.

### 3. Set Up API Key

The application requires a Google Generative AI API key to interact with the Imagen model.

1.  Create a file named `.env` in the root of the project directory (e.g., `/pixelcraft-ai/.env`).
2.  Add your API key to this file in the following format:

    ```
    API_KEY=YOUR_GOOGLE_GENERATIVE_AI_KEY_HERE
    ```

    Replace `YOUR_GOOGLE_GENERATIVE_AI_KEY_HERE` with your actual API key.
    **Note**: The `.env` file is included in `.gitignore` and should not be committed to version control.

## Running the Application

Once the setup is complete, you can run the application on various platforms.

### Web

1.  Ensure web support is enabled in your Flutter environment:
    ```bash
    flutter config --enable-web
    ```
2.  Run the application in Chrome (or another supported browser):
    ```bash
    flutter run -d chrome
    ```

### iOS

1.  **Simulator**:
    *   Open the iOS Simulator (e.g., via Xcode or `open -a Simulator`).
    *   Find your simulator's ID by running: `flutter devices`
    *   Run the app: `flutter run -d YOUR_SIMULATOR_ID` (replace `YOUR_SIMULATOR_ID`)
2.  **Physical Device**:
    *   Connect your iOS device via USB.
    *   You may need to set up code signing in Xcode:
        1.  Open the iOS project in Xcode: `open ios/Runner.xcworkspace`
        2.  Select the `Runner` project in the navigator.
        3.  Go to the "Signing & Capabilities" tab.
        4.  Select your team and ensure a valid signing certificate is chosen.
    *   Run the app: `flutter run` (Flutter should auto-detect your connected device).

### Android

1.  **Emulator**:
    *   Launch an Android emulator via Android Studio (AVD Manager) or the command line.
    *   Find your emulator's ID: `flutter devices`
    *   Run the app: `flutter run -d YOUR_EMULATOR_ID` (replace `YOUR_EMULATOR_ID`)
2.  **Physical Device**:
    *   Connect your Android device via USB (ensure Developer Options and USB Debugging are enabled on the device).
    *   Run the app: `flutter run` (Flutter should auto-detect your connected device).

### Desktop (Experimental)

While not explicitly configured in this iteration, Flutter supports desktop platforms (Windows, macOS, Linux). You can enable them via:
```bash
flutter config --enable-<platform>-desktop # e.g., --enable-macos-desktop
flutter create . # To generate platform-specific files if not present
flutter run -d <platform> # e.g., -d macos
```
Further configuration might be needed.

## License

This project is licensed under the MIT License.

Copyright (c) 2025 Luka Löhr

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

If you use this software or substantial portions of it, you are required to
mention the original author, Luka Löhr 2025, in your project's acknowledgments,
credits, or a similar appropriate section.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

For the full license text, please see the [LICENSE](LICENSE) file.
