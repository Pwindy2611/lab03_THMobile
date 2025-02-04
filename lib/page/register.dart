import 'package:flutter/material.dart';
import '../model/user.dart';
import 'detail.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _checkValue_1 = false;
  bool _checkValue_2 = false;
  bool _checkValue_3 = false;
  int _gender = 0;
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                child: const Text(
                  'User Information',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: "Full Name",
                  icon: Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: "Email",
                  icon: Icon(Icons.email),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Password",
                  icon: Icon(Icons.password),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _confirmPasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Confirm Password",
                  icon: Icon(Icons.password),
                ),
              ),
              const SizedBox(height: 16),
              const Text("What is your gender?"),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: ListTile(
                      title: const Text("Male"),
                      leading: Radio<int>(
                        value: 1,
                        groupValue: _gender,
                        onChanged: (value) {
                          setState(() {
                            _gender = value!;
                          });
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      title: const Text("Female"),
                      leading: Radio<int>(
                        value: 2,
                        groupValue: _gender,
                        onChanged: (value) {
                          setState(() {
                            _gender = value!;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text("What is your favorite?"),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: CheckboxListTile(
                      contentPadding: EdgeInsets.all(10),
                      title: const Text("Music"),
                      value: _checkValue_1,
                      onChanged: (value) {
                        setState(() {
                          _checkValue_1 = value!;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: CheckboxListTile(
                      contentPadding: EdgeInsets.all(10),
                      title: const Text("Movie"),
                      value: _checkValue_2,
                      onChanged: (value) {
                        setState(() {
                          _checkValue_2 = value!;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: CheckboxListTile(
                      contentPadding: EdgeInsets.all(10),
                      title: const Text("Book"),
                      value: _checkValue_3,
                      onChanged: (value) {
                        setState(() {
                          _checkValue_3 = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      var fullname = _nameController.text;
                      var email = _emailController.text;
                      var gendername = "None";
                      if (_gender == 1) {
                        gendername = "Male";
                      } else if (_gender == 2) {
                        gendername = "Female";
                      } else {
                        gendername = "Other";
                      }

                      var favorite = "";
                      if (_checkValue_1) {
                        favorite += "Music, ";
                      }
                      if (_checkValue_2) {
                        favorite += "Movie, ";
                      }
                      if (_checkValue_3) {
                        favorite += "Book, ";
                      }

                      if (favorite.isNotEmpty) {
                        favorite = favorite.substring(0, favorite.length - 2);
                      }

                      var objUser = User(
                        fullname: _nameController.text,
                        email: _emailController.text,
                        gender: gendername,
                        favorite: favorite,
                      );

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Detail(user: objUser),
                        ),
                      );
                    },
                    child: const Text("Register"),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const Text("Login"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
