import 'package:flutter/material.dart';
import 'package:exercicio1/firebase_options.dart';
import 'package:flutter/foundation.dart';

class DonatorData {
  final String email;
  final String nome;
  final String sexo;
  final String idade;
  final String senha;
  final String endereco;
  final String cpf;
  final String peso;
  final String tipoSangue;
  final String substancias;

  DonatorData({
    required this.email,
    required this.nome,
    required this.sexo,
    required this.idade,
    required this.senha,
    required this.endereco,
    required this.cpf,
    required this.peso,
    required this.tipoSangue,
    required this.substancias,
  });
}