import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

int totalFinanca(
  int ganho,
  int gasto,
  int? total,
) {
  total ??= 0;
  return total + ganho - gasto;
}

int meses(DateTime data) {
  return data.month;
}

List<int> graficoMes() {
  final numbers = <int>[01, 02, 03, 04, 05, 06, 07, 08, 09, 10, 11, 12];
  return numbers;
}

List<int>? graficoLinha(List<FinancasRecord> listaDados) {
  final listaFinal = <int>[];
  int? gasto, ganho;
  int jan = 0,
      fev = 0,
      mar = 0,
      abr = 0,
      mai = 0,
      jun = 0,
      jul = 0,
      ago = 0,
      set = 0,
      out = 0,
      nov = 0,
      dez = 0,
      janGanho = 0,
      fevGanho = 0,
      marGanho = 0,
      abrGanho = 0,
      maiGanho = 0,
      junGanho = 0,
      julGanho = 0,
      agoGanho = 0,
      setGanho = 0,
      outGanho = 0,
      novGanho = 0,
      dezGanho = 0,
      janGasto = 0,
      fevGasto = 0,
      marGasto = 0,
      abrGasto = 0,
      maiGasto = 0,
      junGasto = 0,
      julGasto = 0,
      agoGasto = 0,
      setGasto = 0,
      outGasto = 0,
      novGasto = 0,
      dezGasto = 0;
  for (var i = 0; i < listaDados.length; i++) {
    final dado = listaDados.elementAt(i);
    gasto = dado.gasto;
    ganho = dado.ganho;
    if (dado.mes == 01) {
      janGanho += ganho!;
      janGasto += gasto!;
      jan = janGanho - janGasto;
    } else if (dado.mes == 02) {
      fevGanho += ganho!;
      fevGasto += gasto!;
      fev = fevGanho - fevGasto;
    } else if (dado.mes == 03) {
      marGanho += ganho!;
      marGasto += gasto!;
      mar = marGanho - marGasto;
    } else if (dado.mes == 04) {
      abrGanho += ganho!;
      abrGasto += gasto!;
      abr = abrGanho - abrGasto;
    } else if (dado.mes == 05) {
      maiGanho += ganho!;
      maiGasto += gasto!;
      mai = maiGanho - maiGasto;
    } else if (dado.mes == 06) {
      junGanho += ganho!;
      junGasto += gasto!;
      jun = junGanho - junGasto;
    } else if (dado.mes == 07) {
      julGanho += ganho!;
      julGasto += gasto!;
      jul = julGanho - julGasto;
    } else if (dado.mes == 08) {
      agoGanho += ganho!;
      agoGasto += gasto!;
      ago = agoGanho - agoGasto;
    } else if (dado.mes == 09) {
      setGanho += ganho!;
      setGasto += gasto!;
      set = setGanho - setGasto;
    } else if (dado.mes == 10) {
      outGanho += ganho!;
      outGasto += gasto!;
      out = outGanho - outGasto;
    } else if (dado.mes == 11) {
      novGanho += ganho!;
      novGasto += gasto!;
      nov = novGanho - novGasto;
    } else if (dado.mes == 12) {
      dezGanho += ganho!;
      dezGasto += gasto!;
      dez = dezGanho - dezGasto;
    }
  }
  listaFinal
      .addAll([jan, fev, mar, abr, mai, jun, jul, ago, set, out, nov, dez]);

  return listaFinal;
}

List<String>? graficoCirculoNomes() {
  final listaFinal = <String>[];
  listaFinal.addAll(["Ganho", "Gasto"]);
  return listaFinal;
}

List<double> graficoCirculoValores(List<FinancasRecord> listaDados) {
  final listaFinal = <double>[];
  double gasto = 0, ganho = 0;

  for (var i = 0; i < listaDados.length; i++) {
    final dado = listaDados.elementAt(i);
    gasto += dado.gasto!;
    ganho += dado.ganho!;
  }
  listaFinal.addAll([ganho, gasto]);

  return listaFinal;
}

List<String> graficoBarraNomes(List<FinancasRecord> listaDados) {
  final listaFinal = <String>[];
  int existe = 0;

  for (var i = 0; i < listaDados.length; i++) {
    final dado = listaDados.elementAt(i);
    if (i != 0) {
      for (var x = 0; x < listaFinal.length; x++) {
        if (listaFinal[x] == dado.categoria) {
          existe = 1;
        }
      }
      if (existe != 1) {
        listaFinal.add(dado.categoria!);
      } else {
        existe = 0;
      }
    }
  }

  return listaFinal;
}

List<int> graficoBarraValores(List<FinancasRecord> listaDados) {
  final listaFinal = <int>[];
  String categoria = "";
  int valor = 0;

  for (var i = 0; i < listaDados.length; i++) {
    final dado = listaDados.elementAt(i);
    if (i == 0) {
      categoria = dado.categoria!;
    }
    if (categoria == dado.categoria) {
      valor += dado.gasto!;
    } else {
      listaFinal.add(valor);
      categoria = dado.categoria!;
      valor = 0;
      valor += dado.gasto!;
    }
  }
  listaFinal.add(valor);

  return listaFinal;
}

int ifFinanca(FinancasRecord listaDados) {
  int idNovo = 0;
  idNovo = 1 + listaDados.idFinanca!;
  return idNovo;
}
