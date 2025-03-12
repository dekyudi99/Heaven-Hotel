import 'package:flutter/material.dart';

class Forminput extends StatefulWidget {
  @override
  _FormInput createState() => _FormInput();
}

class _FormInput extends State<Forminput> {
  // TextField Controllers untuk mengambil nilai input
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _commentsController = TextEditingController();

  // Radio Button: Gender Selection
  String? _selectedGender = "Male"; // Nilai default
  List<String> genderOptions = ["Male", "Female"];

  // Dropdown (Select Box): Pilihan pekerjaan
  String? _selectedJob;
  List<String> jobList = ["Programmer", "Designer", "Manager", "Student"];

  // Checkbox: Hobi
  bool _isReading = false;
  bool _isGaming = false;
  bool _isTraveling = false;

  // Simpan Form Input
  void _saveForm() {
    String name = _nameController.text;
    String email = _emailController.text;
    String comments = _commentsController.text;
    String gender = _selectedGender ?? "Unknown";
    String job = _selectedJob ?? "No Job Selected";
    List<String> hobbies = [];

    if (_isReading) hobbies.add("Reading");
    if (_isGaming) hobbies.add("Gaming");
    if (_isTraveling) hobbies.add("Traveling");

    // Menampilkan hasil input di terminal
    print("Name: $name");
    print("Email: $email");
    print("Gender: $gender");
    print("Job: $job");
    print("Hobbies: ${hobbies.join(", ")}");
    print("Comments: $comments");

    // Menampilkan hasil dengan Snackbar
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Form Submitted Successfully!"),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profil")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Input Nama
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: "Name"),
            ),

            // Input Email
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: "Email"),
              keyboardType: TextInputType.emailAddress,
            ),

            SizedBox(height: 20),

            // Radio Button (Gender Selection)
            Text("Gender:", style: TextStyle(fontWeight: FontWeight.bold)),
            Column(
              children: genderOptions.map((gender) {
                return RadioListTile<String>(
                  title: Text(gender),
                  value: gender,
                  groupValue: _selectedGender,
                  onChanged: (value) {
                    setState(() {
                      _selectedGender = value;
                    });
                  },
                );
              }).toList(),
            ),

            SizedBox(height: 20),

            // Dropdown (Select Box) untuk memilih pekerjaan
            Text("Select Job:", style: TextStyle(fontWeight: FontWeight.bold)),
            DropdownButton<String>(
              value: _selectedJob,
              hint: Text("Select a Job"),
              isExpanded: true,
              items: jobList.map((String job) {
                return DropdownMenuItem<String>(
                  value: job,
                  child: Text(job),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedJob = value;
                });
              },
            ),

            SizedBox(height: 20),

            // Checkbox (Hobi)
            Text("Hobbies:", style: TextStyle(fontWeight: FontWeight.bold)),
            CheckboxListTile(
              title: Text("Reading"),
              value: _isReading,
              onChanged: (value) {
                setState(() {
                  _isReading = value!;
                });
              },
            ),
            CheckboxListTile(
              title: Text("Gaming"),
              value: _isGaming,
              onChanged: (value) {
                setState(() {
                  _isGaming = value!;
                });
              },
            ),
            CheckboxListTile(
              title: Text("Traveling"),
              value: _isTraveling,
              onChanged: (value) {
                setState(() {
                  _isTraveling = value!;
                });
              },
            ),

            SizedBox(height: 20),

            // TextArea (Multiline TextField)
            Text("Deskripsi:", style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(
              controller: _commentsController,
              decoration: InputDecoration(
                labelText: "Masukan Deskripsi Anda",
                border: OutlineInputBorder(),
              ),
              maxLines: 3, //  Membuat input menjadi multiline
            ),

            SizedBox(height: 20),

            //  Tombol Submit
            ElevatedButton(
              onPressed: _saveForm,
              child: Text("Submit Form"),
            ),
          ],
        ),
      ),
    );
  }
}