ngrok config add-authtoken 33OQXTTTmyIjVh21zBDVmxGY28O_3PhK4sybzSw72Nm2a8Dfy
ngrok http --url=unreceivable-charlsie-superingeniously.ngrok-free.dev 80
# Rollback to last backup
python tools/translate.py rollback translate-regex101-com-site-en.xlf

# Export missing
python tools/translate.py export translate-regex101-com-site-en.xlf

# Open untranslated.csv in Excel, fill in "target" column

# Import back
python tools/translate.py import translate-regex101-com-site-en.xlf untranslated.csv


const supabaseUrl = 'https://gkkxjkbsqluqosrapiru.supabase.co';
const supabaseKey = String.fromEnvironment('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imdra3hqa2JzcWx1cW9zcmFwaXJ1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjA5OTIwMDEsImV4cCI6MjA3NjU2ODAwMX0.fg1xwVS90kDQCx7MC53mltooPBrnVexRZkRM26kgW-U');

Future<void> main() async {
  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseKey);
  runApp(MyApp());
}
