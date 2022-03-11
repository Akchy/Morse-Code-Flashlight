# Project Name
Morse Code Flasher is a Flutter app to convert your text into morse coded flash light. Its a light weight app and it can also be used to decode the morse code.
## Team members
1. Akarsh Ashok [https://github.com/akchy]
2. Jayashankar JP [https://github.com/sci-copath]
## Team Id
Flutter 15
## Link to product walkthrough
You can view the demo with explantion here [https://drive.google.com/file/d/1Imf4Fo1R_JDK3RQqi7W5mbdHklE_7RtT/view?usp=sharing]
## How it Works ?
1. From the user's input, it will extract the text and convert it to Morse Code
2. Then with the morse code, flashlight is enabled and disabled accordingly
3. In case of decode, the input . and _ is there, and when space bar is pressed, the morse code is converted to text
## Libraries used
shared_preferences - 2.0.13
clipboard - 0.1.3
fluttertoast - 8.0.8
torch_light - 0.4.0
## How to configure
In Android Folder, open local.properties, then write the following
> flutter.minSdkVersion = 21

Then in build.grade of app, change the minSdkVersion to the following
> minSdkVersion localProperties.getProperty('flutter.minSdkVersion').toInteger()
## How to Run
Connect your android device and type the following
> flutter run