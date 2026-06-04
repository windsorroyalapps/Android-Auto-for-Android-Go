# Android Auto for Android Go - ProGuard Rules

# Keep Android Auto classes
-keep class androidx.car.app.** { *; }
-keep class androidx.car.** { *; }

# Keep application classes
-keep class com.aago.androidauto.** { *; }
-keepclassmembers class com.aago.androidauto.** { *; }

# Keep Android framework classes
-keep class android.** { *; }
-keep interface android.** { *; }

# Keep AndroidX classes
-keep class androidx.** { *; }
-keep interface androidx.** { *; }

# Keep enums
-keepclassmembers enum * {
    public static **[] values();
    public static ** valueOf(java.lang.String);
}

# Keep Kotlin metadata
-keep class kotlin.Metadata { *; }
-keepclassmembers class * {
    ** CREATOR;
}

# Remove logging in production
-assumenosideeffects class android.util.Log {
    public static *** d(...);
    public static *** v(...);
    public static *** i(...);
}
