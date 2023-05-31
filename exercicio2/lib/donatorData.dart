import 'package:flutter/material.dart';
import 'package:exercicio1/firebase_options.dart';
import 'package:flutter/foundation.dart';

class DonatorData {
  final String email;
  final String nome;
  final String sexo;
  final String idade;
  final String senha;
  final String telefone;

  DonatorData({
    required this.email,
    required this.nome,
    required this.sexo,
    required this.idade,
    required this.senha,
    required this.telefone
  });
}