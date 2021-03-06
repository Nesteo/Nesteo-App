# Nesteo

Frontend Mobile-App of the Nesteo nesting box management application for ringing associations. - [More Information](https://github.com/Nesteo/Nesteo)

![GitHub release (latest by date)](https://img.shields.io/github/v/release/Nesteo/Nesteo-App)
![GitHub tag (latest by date)](https://img.shields.io/github/v/tag/Nesteo/Nesteo-App)
![CircleCI](https://img.shields.io/circleci/build/github/Nesteo/Nesteo-App?token=ac103de9b3a2c8975aa3415c8c0febc24f5ad960)
![GitHub issues](https://img.shields.io/github/issues-raw/Nesteo/Nesteo-App)
![GitHub last commit](https://img.shields.io/github/last-commit/Nesteo/Nesteo-App)

## Development

Due to the dependency on the Google Maps API an API Key is needed. Get your API Key here: <https://console.developers.google.com>.

* Click on credentials, create credentials, API Key
  * Now you have an API Key
* Click on library and search for "Maps SDK for Android" and enable it
* Click on library and search for "Maps SDK for iOS" and enable it (if you develop for iOS)
* Restrict your API Key to only access these Maps SDKs

When you start the build-process, the API Key will be searched in the environment variable "ORG_GRADLE_PROJECT_MAPS_API_KEY". The build will fail if you don't set this variable.

### Before you start your development-environment (Visual Studio Code for example).

On Linux do 

```bash
export ORG_GRADLE_PROJECT_MAPS_API_KEY=REPLACEWITHYOURKEY"
```

On Windows navigate to the project home folder in the command line and enter:

```
set ORG_GRADLE_PROJECT_MAPS_API_KEY "REPLACEWITHYOURKEY"
```

On iOS in XCode, add your environment variable in the project scheme.
Name: ORG_GRADLE_PROJECT_MAPS_API_KEY
Value: REPLACEWITHYOURKEY

## Documentation

The auto-generated documentation can be found at <https://nesteo.github.io/Nesteo-App/>

### Writing Documentation

Please follow the guidelines at <https://dart.dev/guides/language/effective-dart/documentation> for documentation comments.

The documentation can be generated with `dartdoc`, which is automatically installed with the dart SDK. You might need to include the `bin` directory of your dart SDK folder to PATH.

Dartdoc should be executed in the projects root-folder with the following command: `dartdoc --output ./docs/`

Please refer to the doc-comments in the `lib/backend/repositories/`-Folder.
