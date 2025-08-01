import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const WingApp());
}

class WingApp extends StatelessWidget {
  const WingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wing',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.pink,
      ),
      home: const OnboardingScreen(),
    );
  }
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  String? _gender;
  String? _relationshipType;

  final List<String> genders = ['Male', 'Female', 'Non-binary'];
  final List<String> relationshipTypes = ['Serious', 'Casual', 'Open'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Onboarding')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (v) => v == null || v.isEmpty ? 'Enter your name' : null,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Gender'),
                items: genders
                    .map((g) => DropdownMenuItem(value: g, child: Text(g)))
                    .toList(),
                onChanged: (v) => setState(() => _gender = v),
                validator: (v) => v == null ? 'Select gender' : null,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                decoration:
                    const InputDecoration(labelText: 'Relationship Type'),
                items: relationshipTypes
                    .map((r) => DropdownMenuItem(value: r, child: Text(r)))
                    .toList(),
                onChanged: (v) => setState(() => _relationshipType = v),
                validator: (v) => v == null ? 'Select type' : null,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProfileBuilderScreen(
                          name: _nameController.text,
                          gender: _gender!,
                          relationshipType: _relationshipType!,
                        ),
                      ),
                    );
                  }
                },
                child: const Text('Next'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileBuilderScreen extends StatefulWidget {
  final String name;
  final String gender;
  final String relationshipType;

  const ProfileBuilderScreen({
    super.key,
    required this.name,
    required this.gender,
    required this.relationshipType,
  });

  @override
  State<ProfileBuilderScreen> createState() => _ProfileBuilderScreenState();
}

class _ProfileBuilderScreenState extends State<ProfileBuilderScreen> {
  final ImagePicker _picker = ImagePicker();
  final List<XFile> _photos = [];

  final _formKey = GlobalKey<FormState>();
  final _idealPersonalityController = TextEditingController();
  final _idealLooksController = TextEditingController();

  final _ageController = TextEditingController();
  final _heightController = TextEditingController();
  final _jobController = TextEditingController();
  bool _smoker = false;
  final _personalityTraitsController = TextEditingController();

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _photos.add(image);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Build Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  ..._photos
                      .map((p) => Image.network(
                            p.path,
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ))
                      .toList(),
                  IconButton(
                    icon: const Icon(Icons.add_a_photo),
                    onPressed: _pickImage,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _idealPersonalityController,
                decoration:
                    const InputDecoration(labelText: 'Ideal match personality'),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _idealLooksController,
                decoration: const InputDecoration(labelText: 'Ideal match looks'),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _ageController,
                decoration: const InputDecoration(labelText: 'Age'),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _heightController,
                decoration: const InputDecoration(labelText: 'Height'),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _jobController,
                decoration: const InputDecoration(labelText: 'Job'),
              ),
              const SizedBox(height: 16),
              SwitchListTile(
                title: const Text('Smoker?'),
                value: _smoker,
                onChanged: (v) => setState(() => _smoker = v),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _personalityTraitsController,
                decoration:
                    const InputDecoration(labelText: 'Personality traits'),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SummaryScreen(
                        name: widget.name,
                        gender: widget.gender,
                        relationshipType: widget.relationshipType,
                        photos: _photos,
                        idealPersonality: _idealPersonalityController.text,
                        idealLooks: _idealLooksController.text,
                        age: _ageController.text,
                        height: _heightController.text,
                        job: _jobController.text,
                        smoker: _smoker,
                        personalityTraits: _personalityTraitsController.text,
                      ),
                    ),
                  );
                },
                child: const Text('Finish'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SummaryScreen extends StatelessWidget {
  final String name;
  final String gender;
  final String relationshipType;
  final List<XFile> photos;
  final String idealPersonality;
  final String idealLooks;
  final String age;
  final String height;
  final String job;
  final bool smoker;
  final String personalityTraits;

  const SummaryScreen({
    super.key,
    required this.name,
    required this.gender,
    required this.relationshipType,
    required this.photos,
    required this.idealPersonality,
    required this.idealLooks,
    required this.age,
    required this.height,
    required this.job,
    required this.smoker,
    required this.personalityTraits,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Summary')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Smart Assist coming soon!')),
          );
        },
        child: const Icon(Icons.smart_toy),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                Text('Name: $name'),
                Text('Gender: $gender'),
                Text('Looking for: $relationshipType'),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: photos
                      .map((p) => Image.network(
                            p.path,
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ))
                      .toList(),
                ),
                const SizedBox(height: 8),
                Text('Ideal personality: $idealPersonality'),
                Text('Ideal looks: $idealLooks'),
                const Divider(),
                Text('Age: $age'),
                Text('Height: $height'),
                Text('Job: $job'),
                Text('Smoker: ${smoker ? 'Yes' : 'No'}'),
                Text('Personality: $personalityTraits'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
