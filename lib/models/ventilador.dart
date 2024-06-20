// To parse this JSON data, do
//
//     final ventiladores = ventiladoresFromJson(jsonString);

import 'dart:convert';

Ventiladores ventiladoresFromJson(String str) => Ventiladores.fromJson(json.decode(str));

String ventiladoresToJson(Ventiladores data) => json.encode(data.toJson());

class Ventiladores {
    List<Ventiladore> ventiladores;

    Ventiladores({
        required this.ventiladores,
    });

    factory Ventiladores.fromJson(Map<String, dynamic> json) => Ventiladores(
        ventiladores: List<Ventiladore>.from(json["ventiladores"].map((x) => Ventiladore.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "ventiladores": List<dynamic>.from(ventiladores.map((x) => x.toJson())),
    };
}

class Ventiladore {
    String id;
    int state;
    String name;

    Ventiladore({
        required this.id,
        required this.state,
        required this.name,
    });

    factory Ventiladore.fromJson(Map<String, dynamic> json) => Ventiladore(
        id: json["id"],
        state: json["state"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "state": state,
        "name": name,
    };
}
