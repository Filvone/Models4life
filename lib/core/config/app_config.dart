class AppConfig {
  static const String supabaseUrl = String.fromEnvironment(
    'SUPABASE_URL',
    defaultValue: 'https://vkfxnpoaniqegwamhwsy.supabase.co',
  );

  static const String supabaseAnonKey = String.fromEnvironment(
      'SUPABASE_ANON_KEY',
      defaultValue:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZrZnhucG9hbmlxZWd3YW1od3N5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mzg2NDU5MDMsImV4cCI6MjA1NDIyMTkwM30.rbGPV2yGOelmIBWaZKC-EB7m7-r1ZPc7uKRgwDUM8AA');
}
