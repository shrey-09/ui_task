## UI_Task
### A task for BlueStacks

This repository contains only the contents of 'lib' folder (when a project is made in flutter this is the folder where the magic happenes) and it's 'pubspec.yaml' file.
You can find even a build version of apk outside the lib folder.

--------------------------------------------------------------------------------

What was the reason for it not working before:
1. There was a dependency which I used which was exclusive for Flutter Web i.e. dart:html , which was later replaced by "universal_html", then after working on it, I removed the usage of the dependency itself. This was forcing a grey screen to be displayed on Splash screen.
2. Not using the stable channel, as I was working on the master channel before.

---------------------------------------------------------------------------------

What is still missing:
1. "Auto Login" feature. Although I have made it very clear where to use Shared Preferences wherever required, and in main.dart file you can also see it's usage in action but it is always showing "null" value.

Reason for it:
  - In order to troubleshoot I found that ADB is not initialized on my computer and in order to overcome that current user should be added to "kvm" but Android Studio can't find "/kvm" and for that I need to toggle Virtualization from BIOS setting. But I can't as I don't have the password for it, I found some solution for it, but they're highly risky and could led to wiping out my whole computer. So I am submitting the task as is. Although if I found any update to it, I will mail again with the solution. 
