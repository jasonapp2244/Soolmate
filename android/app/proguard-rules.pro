# Keep Play Core SplitCompat classes used by Flutter deferred components
-keep class com.google.android.play.core.** { *; }
-dontwarn com.google.android.play.core.**

# Flutter deferred component manager
-keep class io.flutter.embedding.engine.deferredcomponents.** { *; }
-dontwarn io.flutter.embedding.engine.deferredcomponents.**

# Keep FlutterSplitApplication if you're using it
-keep class io.flutter.embedding.android.FlutterPlayStoreSplitApplication { *; }

# Required for Flutter reflection
-keep class io.flutter.** { *; }
-keep class io.flutter.plugins.** { *; }

# AndroidX Window/Sidecar support
-keep class androidx.window.** { *; }
-dontwarn androidx.window.**

-keep class androidx.window.extensions.** { *; }
-dontwarn androidx.window.extensions.**

-keep class androidx.window.sidecar.** { *; }
-dontwarn androidx.window.sidecar.**
