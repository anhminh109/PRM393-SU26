import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'core_widgets_demo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void _toggleTheme(bool value) {
    setState(() {
      _themeMode = value ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lab 4',
      themeMode: _themeMode,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueAccent,
          brightness: Brightness.dark,
        ),
      ),
      home: HomeScreen(
        isDarkMode: _themeMode == ThemeMode.dark,
        onThemeChanged: _toggleTheme,
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.isDarkMode,
    required this.onThemeChanged,
  });

  final bool isDarkMode;
  final ValueChanged<bool> onThemeChanged;

  @override
  Widget build(BuildContext context) {
    final exercises = [
      const ExerciseItem(
        title: 'Exercise 1 - Core Widgets Demo',
        icon: Icons.widgets,
        screen: CoreWidgetsDemo(),
      ),
      const ExerciseItem(
        title: 'Exercise 2 - Input Controls Demo',
        icon: Icons.tune,
        screen: InputControlsDemo(),
      ),
      const ExerciseItem(
        title: 'Exercise 3 - Layout Demo',
        icon: Icons.dashboard,
        screen: LayoutDemo(),
      ),
      ExerciseItem(
        title: 'Exercise 4 - App Structure & Theme',
        icon: Icons.brightness_6,
        screen: AppStructureThemeDemo(
          isDarkMode: isDarkMode,
          onThemeChanged: onThemeChanged,
        ),
      ),
      const ExerciseItem(
        title: 'Exercise 5 - Common UI Fixes',
        icon: Icons.build,
        screen: CommonUiFixesDemo(),
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Lab 4 - Flutter UI Fundamentals')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: exercises.length,
        separatorBuilder: (_, _) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final item = exercises[index];

          return Card(
            child: ListTile(
              leading: CircleAvatar(child: Icon(item.icon)),
              title: Text(item.title),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => item.screen),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class ExerciseItem {
  const ExerciseItem({
    required this.title,
    required this.icon,
    required this.screen,
  });

  final String title;
  final IconData icon;
  final Widget screen;
}

class InputControlsDemo extends StatefulWidget {
  const InputControlsDemo({super.key});

  @override
  State<InputControlsDemo> createState() => _InputControlsDemoState();
}

class _InputControlsDemoState extends State<InputControlsDemo> {
  double _rating = 50;
  bool _isActive = false;
  String? _genre;
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exercise 2 - Input Controls')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(2, 18, 2, 0),
        children: [
          const Text(
            'Rating (Slider)',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Slider(
            min: 0,
            max: 100,
            divisions: 100,
            value: _rating,
            onChanged: (value) {
              setState(() {
                _rating = value;
              });
            },
          ),
          Text('Current value: ${_rating.round()}'),
          const SizedBox(height: 18),
          const Text(
            'Active (Switch)',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              const SizedBox(width: 14),
              const Expanded(child: Text('Is movie active?')),
              Switch(
                value: _isActive,
                onChanged: (value) {
                  setState(() {
                    _isActive = value;
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            'Genre (RadioListTile)',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          RadioGroup<String>(
            groupValue: _genre,
            onChanged: (value) {
              setState(() {
                _genre = value;
              });
            },
            child: Column(
              children: const [
                RadioListTile<String>(
                  title: Text('Action'),
                  value: 'Action',
                  contentPadding: EdgeInsets.only(left: 4),
                ),
                RadioListTile<String>(
                  title: Text('Comedy'),
                  value: 'Comedy',
                  contentPadding: EdgeInsets.only(left: 4),
                ),
              ],
            ),
          ),
          Text('Selected genre: ${_genre ?? 'None'}'),
          const SizedBox(height: 16),
          OutlinedButton(
            onPressed: _openDatePicker,
            child: const Text('Open Date Picker'),
          ),
          const SizedBox(height: 8),
          Text(
            'Selected date: ${_selectedDate == null ? 'None' : _formatDate(_selectedDate!)}',
          ),
        ],
      ),
    );
  }

  Future<void> _openDatePicker() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate == null) {
      return;
    }

    setState(() {
      _selectedDate = pickedDate;
    });
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}

class LayoutDemo extends StatelessWidget {
  const LayoutDemo({super.key});

  @override
  Widget build(BuildContext context) {
    const movies = ['Avatar', 'Inception', 'Interstellar', 'Joker'];

    return Scaffold(
      appBar: AppBar(title: const Text('Exercise 3 - Layout Demo')),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 22),
            const Text(
              'Now Playing',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                itemCount: movies.length,
                separatorBuilder: (_, _) => const SizedBox(height: 7),
                itemBuilder: (context, index) {
                  final movie = movies[index];

                  return Card(
                    margin: EdgeInsets.zero,
                    color: const Color(0xFFF5F2FA),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(color: Color(0xFFE4DFEA)),
                    ),
                    child: ListTile(
                      minVerticalPadding: 10,
                      leading: CircleAvatar(
                        backgroundColor: const Color(0xFFD9DDFF),
                        foregroundColor: const Color(0xFF4A4D8A),
                        child: Text(movie.characters.first),
                      ),
                      title: Text(movie),
                      subtitle: const Text('Sample description'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CommonUiFixesDemo extends StatelessWidget {
  const CommonUiFixesDemo({super.key});

  @override
  Widget build(BuildContext context) {
    const movies = ['Movie A', 'Movie B', 'Movie C', 'Movie D'];

    return Scaffold(
      appBar: AppBar(title: const Text('Exercise 5 - Common UI Fixes')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(6, 24, 6, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Correct ListView inside Column using\nExpanded',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: movies.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: const Icon(Icons.movie),
                      title: Text(movies[index]),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppStructureThemeDemo extends StatefulWidget {
  const AppStructureThemeDemo({
    super.key,
    required this.isDarkMode,
    required this.onThemeChanged,
  });

  final bool isDarkMode;
  final ValueChanged<bool> onThemeChanged;

  @override
  State<AppStructureThemeDemo> createState() => _AppStructureThemeDemoState();
}

class _AppStructureThemeDemoState extends State<AppStructureThemeDemo> {
  late bool _isDarkMode;

  @override
  void initState() {
    super.initState();
    _isDarkMode = widget.isDarkMode;
  }

  void _toggleTheme(bool value) {
    setState(() {
      _isDarkMode = value;
    });
    widget.onThemeChanged(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise 4 - App Structure'),
        actions: [
          const Text('Dark'),
          Switch(value: _isDarkMode, onChanged: _toggleTheme),
        ],
      ),
      body: const Center(
        child: Text('This is a simple screen with theme toggle.'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
