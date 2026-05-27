plugins {
    alias(libs.plugins.android.application)
    alias(libs.plugins.kotlin.android)
}

android {
    namespace = "com.aago.androidauto"
    compileSdk = 34

    defaultConfig {
        applicationId = "com.aago.androidauto"
        minSdk = 21  // Android 5.0 - Minimum for Android Go
        targetSdk = 34
        versionCode = 1
        versionName = "1.0"
        
        // Android Go optimizations
        ndk.abiFilters.add("armeabi-v7a")  // 32-bit ARM for Android Go devices
        
        vectorDrawables.useSupportLibrary = true
    }

    buildTypes {
        release {
            isMinifyEnabled = true
            isShrinkResources = true  // Remove unused resources for Android Go
            proguardFiles(getDefaultProguardFile("proguard-android-optimize.txt"), "proguard-rules.pro")
        }
        debug {
            isMinifyEnabled = false
        }
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11  // Reduced from 17 for better Android Go compatibility
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = "11"
    }

    // Bundle configuration for optimized delivery
    bundle {
        language.enableSplit = true
        density.enableSplit = true
        abi.enableSplit = true
    }

    packagingOptions {
        resources {
            excludes += listOf(
                "META-INF/proguard/androidx-*.pro",
                "META-INF/androidx.*",
                "DebugProbesKt.bin"
            )
        }
    }
}

dependencies {
    // Core Android libraries
    implementation(libs.androidx.core.ktx)
    implementation(libs.androidx.appcompat)

    // Android Auto
    implementation("androidx.car.app:app:1.6.0")
    
    // Android Go specific optimizations
    implementation("androidx.lifecycle:lifecycle-runtime-ktx:2.6.2")
    implementation("androidx.activity:activity-ktx:1.8.1")

    // Keep dependencies minimal for Android Go
    // Consider using AndroidX only, not Material3 unless necessary
}
