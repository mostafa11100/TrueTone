# Keep Supabase classes
-keep class io.supabase.** { *; }

# Keep constructors for all classes
-keepclassmembers class ** {
    public <init>(...);
}
