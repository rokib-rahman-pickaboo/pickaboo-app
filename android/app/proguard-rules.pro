# Flutter Wrapper & Plugins
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.util.** { *; }
-keep class io.flutter.view.** { *; }
-keep class io.flutter.** { *; }
-keep class io.flutter.plugins.** { *; }
-dontwarn io.flutter.**

# AndroidX & Jetpack
-keep class androidx.lifecycle.** { *; }
-keep class androidx.activity.** { *; }
-keep class androidx.core.** { *; }
-dontwarn androidx.**

# Google & Firebase Services
-keep class com.google.firebase.** { *; }
-dontwarn com.google.firebase.**
-keep class com.google.android.gms.** { *; }
-dontwarn com.google.android.gms.**
-keep class com.google.android.recaptcha.** { *; }
-dontwarn com.google.android.recaptcha.**

# Facebook SDK
-keep class com.facebook.** { *; }
-dontwarn com.facebook.**

# MapLibre GL
-keep class org.maplibre.android.** { *; }
-dontwarn org.maplibre.android.**

# uCrop / Image cropper
-keep class com.yalantis.ucrop.** { *; }
-dontwarn com.yalantis.ucrop.**

# Pickaboo App & Native Channels
-keep class com.pickaboo.app.** { *; }

# OkHttp & Okio (common network layers)
-dontwarn okhttp3.**
-dontwarn okio.**
-dontwarn javax.annotation.**

# Desugaring
-dontwarn j$.**

# General Attributes
-keepattributes *Annotation*,Signature,InnerClasses,EnclosingMethod,SourceFile,LineNumberTable
-keepclassmembers enum * { *; }
