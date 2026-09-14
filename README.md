# AVA — Voice Assistant

Flutter voice assistant that records speech, sends it to the Gemini API, speaks the
answer back, and lets signed-in users save responses to Firestore.

## Requirements

- Flutter 3.24.x (Dart 3.5.x)
- A Firebase project (Auth with Google Sign-In + Firestore)
- A Gemini API key

## Configuration

The Gemini API key is **not** stored in the repository. Pass it at build/run time:

```bash
flutter run --dart-define=GEMINI_API_KEY=your_key
flutter build apk --release --dart-define=GEMINI_API_KEY=your_key
```

Firebase config lives in `lib/firebase_options.dart`, `android/app/google-services.json`
and `ios/Runner/GoogleService-Info.plist`. Regenerate them for your own project with
`flutterfire configure`.

Firestore security rules are in `firestore.rules`; deploy them with
`firebase deploy --only firestore:rules`. They restrict each document in
`savedResponses` to the user that created it.

## Android release signing

Release builds are signed with the keystore described by `android/key.properties`
(kept out of version control):

```properties
storePassword=...
keyPassword=...
keyAlias=...
storeFile=/absolute/path/to/keystore.jks
```

Without that file the build falls back to debug signing, which must never be used
for published artifacts.

## Development

```bash
flutter pub get
flutter analyze
flutter test
```
