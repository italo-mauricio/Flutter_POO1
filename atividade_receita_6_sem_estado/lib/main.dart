import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.blue),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Entradas"),
          ),
          body: const MyCustomForm(),
          bottomNavigationBar: NewNavBar(icons: const [
            Icons.home,
            Icons.access_alarm,
            Icons.accessibility
          ]),
        ));
  }
}

class NewNavBar extends StatelessWidget {
  final List icons;
  NewNavBar({required this.icons});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        items: icons
            .map((data) =>
                BottomNavigationBarItem(icon: Icon(data), label: "Teste"))
            .toList());
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Creating the input field for the name
          Padding(
            padding: const EdgeInsets.all(16.0), // Add padding here
            child: MyNameInput(),
          ),
          // Creating the input field for the password
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: MyPasswordInput(),
          ),
          // Creating the DropdownButton field
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: MyDropdownInput(),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: MySlideInput(),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('It all works"')),
                  );
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}

class MyNameInput extends StatelessWidget {
  MyNameInput();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        String patttern = r'(^[a-zA-Z ]*$)';
        RegExp regExp = RegExp(patttern);
        if (value == null || value.isEmpty) {
          return "Digite o seu nome";
        } else if (!regExp.hasMatch(value)) {
          return "O nome deve conter caracteres de a-z ou A-Z";
        }
      },
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Digite o texto aqui',
      ),
    );
  }
}

class MyPasswordInput extends StatefulWidget {
  @override
  _MyPasswordInputState createState() => _MyPasswordInputState();
}

class _MyPasswordInputState extends State<MyPasswordInput> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Digite o seu passaporte aqui';
        }
        return null;
      },
      obscureText: !showPassword,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'Digite o seu passaporte aqui',
        hintText: 'Digite o seu passaporte aqui',
        suffixIcon: IconButton(
          icon: Icon(
            showPassword ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () {
            setState(() {
              showPassword = !showPassword;
            });
          },
        ),
      ),
    );
  }
}

class MyDropdownInput extends StatefulWidget {
  @override
  _MyDropdownInputState createState() => _MyDropdownInputState();
}

class _MyDropdownInputState extends State<MyDropdownInput> {
  String? _opcao;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: const InputDecoration(labelText: 'Role'),
      value: _opcao,
      onChanged: (newValue) {
        setState(() {
          _opcao = newValue;
        });
      },
      items: const [
        DropdownMenuItem(
          value: 'Back-End',
          child: Text('Back-End'),
        ),
        DropdownMenuItem(
          value: 'Front-End',
          child: Text('Front-End'),
        ),
      ],
      validator: (value) {
        if (value == null) {
          return 'Por favor, escolha uma opção';
        }
        return null;
      },
    );
  }
}

class MySlideInput extends StatefulWidget {
  @override
  _MySlideInputState createState() => _MySlideInputState();
}

class _MySlideInputState extends State<MySlideInput> {
  double _curentSliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _curentSliderValue,
      max: 100,
      divisions: 5,
      label: _curentSliderValue.round().toString(),
      onChanged: (double newValue) {
        setState(() {
          _curentSliderValue = newValue;
        });
      },
    );
  }
}