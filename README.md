# PixelCraft AI 🎨

> ⚠️ **Notice: PixelCraft AI is currently under development and not fully functional.**  
> The application is in progress and some features may not yet work as expected.

PixelCraft AI is a Flutter application that generates unique pixel art images based on user prompts using Google's Imagen model via the Gemini API. Users can enter a text prompt, generate an image, view it within the app, and save it to their device's photo library.

---

## Features

* **Text-to-Image Generation**: Leverages Google's Imagen model to create pixel art from text prompts.
* **Simple UI**: Clean and intuitive interface for easy interaction.
* **Image Display**: Shows the generated pixel art directly in the app.
* **Save to Photos**: Allows users to save their creations to their device's photo gallery (iOS/Android).
* **Cross-Platform**: Built with Flutter for Web, iOS, and Android support.

---

## Setup Instructions

### Prerequisites

1. **Flutter SDK**: Ensure you have the Flutter SDK installed. You can find installation instructions on the [official Flutter website](https://flutter.dev/docs/get-started/install).
2. **Git**: Required for cloning the repository.
3. **IDE**: An IDE like VS Code with the Flutter extension or Android Studio.
4. **(For iOS)**: Xcode installed on a macOS machine.
5. **(For Android)**: Android Studio and Android SDK setup.

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

1. Create a file named `.env` in the root of the project directory (e.g., `/pixelcraft-ai/.env`).
2. Add your API key to this file in the following format:

```
API_KEY=YOUR_GOOGLE_GENERATIVE_AI_KEY_HERE
```

Replace `YOUR_GOOGLE_GENERATIVE_AI_KEY_HERE` with your actual API key.  
**Note**: The `.env` file is included in `.gitignore` and should not be committed to version control.

---

## Running the Application

Once the setup is complete, you can run the application on various platforms.

### Web

1. Ensure web support is enabled in your Flutter environment:
    ```bash
    flutter config --enable-web
    ```
2. Run the application in Chrome (or another supported browser):
    ```bash
    flutter run -d chrome
    ```

### iOS

1. **Simulator**:
    * Open the iOS Simulator (e.g., via Xcode or `open -a Simulator`).
    * Find your simulator's ID by running: `flutter devices`
    * Run the app: `flutter run -d YOUR_SIMULATOR_ID` (replace `YOUR_SIMULATOR_ID`)
2. **Physical Device**:
    * Connect your iOS device via USB.
    * You may need to set up code signing in Xcode:
        1. Open the iOS project in Xcode: `open ios/Runner.xcworkspace`
        2. Select the `Runner` project in the navigator.
        3. Go to the "Signing & Capabilities" tab.
        4. Select your team and ensure a valid signing certificate is chosen.
    * Run the app: `flutter run`

### Android

1. **Emulator**:
    * Launch an Android emulator via Android Studio (AVD Manager) or the command line.
    * Find your emulator's ID: `flutter devices`
    * Run the app: `flutter run -d YOUR_EMULATOR_ID` (replace `YOUR_EMULATOR_ID`)
2. **Physical Device**:
    * Connect your Android device via USB (ensure Developer Options and USB Debugging are enabled on the device).
    * Run the app: `flutter run`

---

## Adding Desktop Support (Optional)

This project is primarily configured for Web, iOS, and Android. If you wish to run it on a desktop platform (Windows, macOS, or Linux), you can add support by following these steps:

1. **Enable Desktop Support for Flutter**:
    Open your terminal and run the command for the platform you want to enable (e.g., for macOS):
    ```bash
    flutter config --enable-macos-desktop
    ```
    Replace `macos` with `windows` or `linux` as needed.

2. **Create Platform-Specific Files**:
    In your project's root directory (`pixelcraft-ai`), run:
    ```bash
    flutter create .
    ```
    This command will generate the necessary platform-specific files and directories (e.g., `macos/`, `windows/`, or `linux/`).

3. **Run the Application**:
    Once the platform support is added and files are generated, you can run the application on the chosen desktop platform:
    ```bash
    flutter run -d macos
    ```
    Replace `macos` with `windows` or `linux` as appropriate.

    Additional configuration or troubleshooting might be needed depending on your specific desktop environment and Flutter setup.

---

## License

This project is licensed under the MIT License. For the full license text, please see the [LICENSE](LICENSE) file.
