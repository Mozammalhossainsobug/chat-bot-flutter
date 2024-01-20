# Chat-Bot Flutter: Chat with ChatGPT-3.5
<table>
  <tr>
    <td>
      <img src="https://github.com/Mozammalhossainsobug/chat-bot-flutter/blob/main/assets/images/ai.png" height=70 align="left"> 
    <p>
    The Chat-Bot Flutter app is a versatile and user-friendly feature that facilitates real-time communication with ChatGPT-3.5. It offers a wide range of functionalities to ensure seamless and engaging conversations with AI.
      </p>
    </td>
  </tr>
</table>

[![made-with-flutter](https://img.shields.io/badge/Made%20with-Flutter-1f425f.svg)](https://flutter.dev/) 
[![powered-by-ChatGPT-3.5](https://img.shields.io/badge/Made%20with-ChatGPT:3.5-1f425f.svg)](https://openai.com/blog/chatgpt)
![Hits](https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https://github.com/mozammalhossainsobug/chat-bot-flutter&title=Views) 
![Release](https://img.shields.io/github/v/release/mozammalhossainsobug/chat-bot-flutter) 
![Stars](https://img.shields.io/github/stars/mozammalhossainsobug/chat-bot-flutter) 
![Forks](https://img.shields.io/github/forks/mozammalhossainsobug/chat-bot-flutter) 
![Contributors](https://img.shields.io/github/contributors/mozammalhossainsobug/chat-bot-flutter) 

## Changelog

Changes and progress about development is all heavily documented in GitHub [commits](https://github.com/Mozammalhossainsobug/chat-bot-flutter/pulls) and in the [changelog](https://github.com/Mozammalhossainsobug/chat-bot-flutter/pulls)

### File Structure
A High-level overview of the project structure:
```

lib/
└── src/
    ├── core
    ├── feature/
    │   ├── inbox
    │   ├── on_boarding
    └── main.dart

```
A High-level overview of a feature:
```

└── inbox/
    ├── data/
    │   ├── data_source
    │   ├── model
    │   └── repository
    ├── domain/
    │   ├── entities
    │   ├── repositories
    │   └── use_cases
    └── presentation/
        ├── pages
        ├── riverpod
        └── widget              
```
## Bundled Packages
This repository contains some packages, those are listed below. They can be found in the pubspec.yaml.

<details>
<summary>Dependencies</summary>

* [dartz](https://pub.dev/packages/dartz/versions/0.10.1)
* [flutter_screenutil](https://pub.dev/packages/flutter_screenutil/versions/5.8.4)
* [flutter_bloc](https://pub.dev/packages/flutter_bloc/versions/8.1.3)
* [equatable](https://pub.dev/packages/equatable/versions/2.0.5)
* [bloc](https://pub.dev/packages/bloc/versions/8.1.2)
* [get_it](https://pub.dev/packages/get_it/versions/7.6.0)
* [dio](https://pub.dev/packages/dio/versions/5.1.1)
* [pretty_dio_logger](https://pub.dev/packages/pretty_dio_logger/versions/1.3.1)
* [logger](https://pub.dev/packages/logger/versions/1.1.0)
* [shared_preferences](https://pub.dev/packages/shared_preferences/versions/2.2.0)
* [flutter_svg](https://pub.dev/packages/flutter_svg/versions/2.0.7)
* [intl](https://pub.dev/packages/intl/versions/0.18.1)
* [fluttertoast](https://pub.dev/packages/fluttertoast/versions/8.2.2)
* [webview_flutter](https://pub.dev/packages/webview_flutter/versions/4.2.2)
* [webview_flutter_android](https://pub.dev/packages/webview_flutter_android/versions/3.8.1)
* [webview_flutter_wkwebview](https://pub.dev/packages/webview_flutter_wkwebview/versions/3.6.1)
* [firebase_core](https://pub.dev/packages/firebase_core/versions/2.15.0)
* [device_info_plus](https://pub.dev/packages/device_info_plus/versions/9.0.1)
* [firebase_messaging](https://pub.dev/packages/firebase_messaging/versions/14.6.5)
* [firebase_crashlytics](https://pub.dev/packages/firebase_crashlytics/versions/3.3.4)
* [flutter_local_notifications](https://pub.dev/packages/flutter_local_notifications/versions/15.1.0+1)
* [firebase_analytics](https://pub.dev/packages/firebase_analytics/versions/10.4.4)
* [image_picker](https://pub.dev/packages/image_picker/versions/1.0.2)
* [country_code_picker](https://pub.dev/packages/country_code_picker/versions/3.0.0)
* [flutter_cache_manager](https://pub.dev/packages/flutter_cache_manager/versions/3.3.1)
* [cached_network_image](https://pub.dev/packages/cached_network_image/versions/3.2.3)
* [flutter_image_compress](https://pub.dev/packages/flutter_image_compress/versions/2.0.4)
* [socket_io_client](https://pub.dev/packages/socket_io_client/versions/2.0.3%2B1)
* [path_provider](https://pub.dev/packages/path_provider/versions/2.1.1)
* [permission_handler](https://pub.dev/packages/permission_handler/versions/11.0.0)
* [connectivity_plus](https://pub.dev/packages/connectivity_plus/versions/4.0.2)
* [flutter_network](https://pub.dev/packages/flutter_network)

</details>


## Developer Notes

### Building the project
* To run the **Flutter project**,open it in your editor, Add your OpenAI token to the environment
* Then run `flutter run` on your terminal.

### Android Release
* To build an app-bundle Android release, run `flutter build appbundle --release`

Note: required Android SDK.

### iOS Release
* To build an IPA iOS release, run `flutter build ipa`

Note: requires MacOS.

### GitHub release
* Create a tag for the current version specified in `pubspec.yaml`
* `git tag <version>`
* Push the tag
* `git push origin <version>`
* Create the release and upload binaries
* https://github.com/Mozammalhossainsobug/chat-bot-flutter/"feature-name"
