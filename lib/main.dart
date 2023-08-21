// ignore_for_file: unused_field, library_private_types_in_public_api, prefer_final_fields

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const RegistrationForm(),
    );
  }
}

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({Key? key}) : super(key: key);

  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _institution = '';
  String _course = '';
  String _fullName = '';
  String _email = '';
  String _studentId = '';
  DateTime? _birthdate;
  String _educationLevel = '';
  String _cif = '';
  String _rg = '';
  String _issuingAuthority = '';
  String _phone = '';
  String _password = '';
  String _confirmPassword = '';
  String _address = '';
  String _complement = '';
  String _number = '';
  String _district = '';
  String _city = '';

  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário de Registro'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _buildField('Instituição de Ensino', (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira a instituição de ensino';
                }
                return null;
              }, (value) {
                _institution = value!;
              }),
              const SizedBox(height: 16.0),
              _buildField('Curso', (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira o curso';
                }
                return null;
              }, (value) {
                _course = value!;
              }),
              const SizedBox(height: 5.0),
              _buildField('Nome Completo', (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira o nome completo';
                }
                return null;
              }, (value) {
                _fullName = value!;
              }),
              const SizedBox(height: 5.0),
              _buildField('Email', (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira o email';
                }
                return null;
              }, (value) {
                _email = value!;
              }),
              const SizedBox(height: 5.0),
              _buildField('Matrícula', (value) {
                // Add validation logic for matrícula
                return null; // Remove this line when adding validation
              }, (value) {
                _studentId = value!;
              }),
              const SizedBox(height: 5.0),
              _buildDatePickerField('Data de Nascimento'),
              const SizedBox(height: 5.0),
              _buildDropdownField(
                'Escolaridade',
                ['Ensino Médio', 'Graduação', 'Pós-Graduação'],
                (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, selecione a escolaridade';
                  }
                  return null;
                },
                (value) {
                  _educationLevel = value ?? ''; // Handle nullable value
                },
              ),
              const SizedBox(height: 5.0),
              _buildField('Número de Telefone', (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira o número de telefone';
                }
                return null;
              }, (value) {
                _phone = value!;
              }),
              const SizedBox(height: 5.0),
              _buildField('Endereço', (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira o endereço';
                }
                return null;
              }, (value) {
                _address = value!;
              }),
              const SizedBox(height: 16.0),
              _buildField('Senha', (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira a senha';
                }
                return null;
              }, (value) {
                _password = value!;
              }, controller: _passwordController),
              const SizedBox(height: 16.0),
              _buildField('Confirmar Senha', (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, confirme a senha';
                }
                if (value != _passwordController.text) {
                  return 'As senhas não coincidem';
                }
                return null;
              }, (value) {
                _confirmPassword = value!;
              }, controller: _confirmPasswordController),
              const SizedBox(height: 5.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Perform registration logic here
                  }
                },
                child: const Text('Registrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildField(String label, String? Function(String?)? validator,
      void Function(String?) onSaved,
      {TextEditingController? controller}) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(14.0),
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          contentPadding: const EdgeInsets.all(16.0),
          border: InputBorder.none,
        ),
        validator: validator,
        onSaved: onSaved,
      ),
    );
  }

  Widget _buildDatePickerField(String label) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: TextFormField(
        readOnly: true, // Impede a edição direta do campo
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: _birthdate ?? DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime.now(),
          );

          if (pickedDate != null) {
            setState(() {
              _birthdate = pickedDate;
            });
          }
        },
        decoration: InputDecoration(
          labelText: label,
          contentPadding: const EdgeInsets.all(16.0),
          border: InputBorder.none,
          suffixIcon: const Icon(Icons.calendar_today),
        ),
        controller: TextEditingController(
          text: _birthdate != null
              ? '${_birthdate!.day}/${_birthdate!.month}/${_birthdate!.year}'
              : '',
        ),
      ),
    );
  }

  Widget _buildDropdownField(
    String label,
    List<String> options,
    String? Function(String?)? validator,
    void Function(String?) onSaved,
  ) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: label,
          contentPadding: const EdgeInsets.all(16.0),
          border: InputBorder.none,
        ),
        items: options.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        validator: validator,
        onChanged: (value) {
          onSaved(value);
        },
      ),
    );
  }
}
