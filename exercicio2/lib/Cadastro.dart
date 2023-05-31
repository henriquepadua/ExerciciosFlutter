import 'package:exercicio1/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'libs.dart';
import 'package:exercicio1/donatorData.dart';

class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  bool _isPasswordVisible = false;
  final email = TextEditingController();
  final nome = TextEditingController();
  final sexo = TextEditingController();
  final idade = TextEditingController();
  final senha = TextEditingController();
  final confirmarsenha = TextEditingController();
  final telefone = TextEditingController();
  bool elegivel = false;
  bool _isCheckedF = false;
  bool _isCheckedM = true;

  TextField padrao(TextEditingController controlador, String templateField) {
    return TextField(
      controller: controlador,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Cadastrar",
        home: Scaffold(
          appBar: AppBar(
            title: Text("Tela Cadastro"),
          ),
          body:
          SingleChildScrollView(
            child: Column(children: <Widget>[
              DefaultTextFields.getTextField('E-mail', email),
              Container(
                //Campo para registrar o nome
                margin: const EdgeInsets.fromLTRB(50, 0, 50, 25),
                color: Colors.white,
                child: TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    labelText: "Nome",
                  ),
                  maxLength: 50,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                  controller: nome,
                ),
              ),
              Container(
                //Campo para registrar a senha
                margin: const EdgeInsets.fromLTRB(50, 0, 50, 25),
                child: TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    labelText: "Senha",
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                      child: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  maxLength: 50,
                  obscureText: !_isPasswordVisible,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                  controller: senha,
                ),
              ),
              Container(
                //Campo para confirmar a senha
                margin: const EdgeInsets.fromLTRB(50, 0, 50, 25),
                child: TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    labelText: "Confirmar Senha",
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                      child: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  maxLength: 50,
                  obscureText: !_isPasswordVisible,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                  controller: confirmarsenha,
                  onTapOutside: (val) {
                    checarSenha(senha, confirmarsenha, context, elegivel);
                  },
                ),

              ),
              RadioListTile(
                title: Text("Masculino"),
                value: false,
                groupValue: _isCheckedM,
                onChanged: (value) {
                  setState(() {
                    _isCheckedM = value!;
                    _isCheckedF = value;
                  });
                  checarSexo(_isCheckedM, _isCheckedF, sexo);
                },
              ),
              RadioListTile(
                title: Text("Feminino"),
                value: true,
                groupValue: _isCheckedF,
                onChanged: (value) {
                  setState(() {
                    _isCheckedF = value!;
                    _isCheckedM = value;
                  });
                  checarSexo(_isCheckedM, _isCheckedF, sexo);
                },
              ),
              Container(
                //Campo para registrar a idade
                margin: const EdgeInsets.fromLTRB(50, 0, 50, 25),
                child: TextField(
                  keyboardType: TextInputType.datetime,
                  inputFormatters: [
                    //FilteringTextInputFormatter.,
                  ],
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    labelText: "Data de Nascimento",
                  ),
                  maxLength: 11,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                  controller: idade,
                ),
              ),
              Container(
                //Campo para registrar o telefone
                margin: const EdgeInsets.fromLTRB(50, 0, 50, 25),
                child: TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    //FilteringTextInputFormatter.digitsOnly,
                    //CpfInputFormatter(), // Classe de formatação personalizada para o CPF
                  ],
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    labelText: "Telefone",
                  ),
                  maxLength: 15,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                  controller: telefone,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 10, 100, 0),
                    child: ElevatedButton(
                      child: const Text('Voltar', textAlign: TextAlign.center),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: ElevatedButton(
                      child:
                      const Text('Cadastrar', textAlign: TextAlign.center),
                      onPressed: () {
                        DonatorData donatorData = DonatorData(
                          email: email.text,
                          nome: nome.text,
                          sexo: sexo.text,
                          idade: idade.text,
                          senha: senha.text,
                          telefone: telefone.text,
                        );
                       // saveUserDonatorData(donatorData, context);
                      },
                    ),
                  ),
                ],
              ),
            ]),
          ),
        )
    );
  }
}

void checarSexo(bool inputM, bool inputF, TextEditingController sexo) {
  if (inputM = true) {
    sexo.text = "masculino";
  } else if (inputF = true) {
    sexo.text = "feminino";
  }
}

void checarSenha(TextEditingController senha, TextEditingController confirmarsenha, BuildContext context, bool elegivel) {

  if (senha.text != confirmarsenha.text) {
    elegivel = false;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Senhas não correspondem'),
          content: Text(
              'As senhas digitadas não correspondem. Por favor, tente novamente.'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(); // Fechar o diálogo
              },
            ),
          ],
        );
      },
    );
  }
  else
  {
    elegivel = true;
  }
}

class CpfInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    String formattedText = newValue.text;

    if (formattedText.length >= 4 && formattedText[3] != '.') {
      formattedText = formattedText.substring(0, 3) +
          '.' +
          formattedText.substring(3, formattedText.length);
    }

    if (formattedText.length >= 8 && formattedText[7] != '.') {
      formattedText = formattedText.substring(0, 7) +
          '.' +
          formattedText.substring(7, formattedText.length);
    }

    if (formattedText.length >= 12 && formattedText[11] != '-') {
      formattedText = formattedText.substring(0, 11) +
          '-' +
          formattedText.substring(11, formattedText.length);
    }

    return newValue.copyWith(text: formattedText, selection: _updateCursorPosition(formattedText));
  }

  TextSelection _updateCursorPosition(String value) {
    final cursorPosition = value.length;
    return TextSelection.fromPosition(TextPosition(offset: cursorPosition));
  }
}

class CnpjInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    String formattedText = newValue.text;

    if (formattedText.length >= 3 && formattedText[2] != '.') {
      formattedText = formattedText.substring(0, 2) +
          '.' +
          formattedText.substring(2, formattedText.length);
    }

    if (formattedText.length >= 7 && formattedText[6] != '.') {
      formattedText = formattedText.substring(0, 6) +
          '.' +
          formattedText.substring(6, formattedText.length);
    }

    if (formattedText.length >= 11 && formattedText[10] != '/') {
      formattedText = formattedText.substring(0, 10) +
          '/' +
          formattedText.substring(10, formattedText.length);
    }

    if (formattedText.length >= 16 && formattedText[15] != '-') {
      formattedText = formattedText.substring(0, 15) +
          '-' +
          formattedText.substring(15, formattedText.length);
    }

    return newValue.copyWith(
      text: formattedText,
      selection: _updateCursorPosition(formattedText),
    );
  }

  TextSelection _updateCursorPosition(String value) {
    final cursorPosition = value.length;
    return TextSelection.fromPosition(TextPosition(offset: cursorPosition));
  }
}


class WeightInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String cleanedText = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');
    int textLength = cleanedText.length;

    if (textLength <= 3) {
      return TextEditingValue(
        text: cleanedText,
        selection: TextSelection.collapsed(offset: textLength),
      );
    }

    int decimalIndex = textLength - 2;
    String formattedText =
        cleanedText.substring(0, decimalIndex) + ',' + cleanedText.substring(decimalIndex);

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}
