// To parse this JSON data, do
//
//     final ticket = ticketFromJson(jsonString);

import 'dart:convert';

Ticket ticketFromJson(String str) => Ticket.fromJson(json.decode(str));

String ticketToJson(Ticket data) => json.encode(data.toJson());

class Ticket {
    Ticket({
        this.data,
        this.totalcount,
        this.getJsonStart,
        this.getJsonEnd,
        this.process1Start,
        this.process1End,
        this.process2Start,
        this.process2End,
        this.process3Start,
        this.process3End,
        this.process4Start,
        this.process4End,
        this.process5Start,
        this.process5End,
        this.process6Start,
        this.process6End,
        this.process7Start,
        this.process7End,
        this.process8Start,
        this.process8End,
        this.process9Start,
        this.process9End,
        this.process10Start,
        this.process10End,
    });

    List<Datum> data;
    int totalcount;
    DateTime getJsonStart;
    DateTime getJsonEnd;
    DateTime process1Start;
    DateTime process1End;
    DateTime process2Start;
    DateTime process2End;
    DateTime process3Start;
    DateTime process3End;
    DateTime process4Start;
    DateTime process4End;
    DateTime process5Start;
    DateTime process5End;
    DateTime process6Start;
    DateTime process6End;
    DateTime process7Start;
    DateTime process7End;
    DateTime process8Start;
    DateTime process8End;
    DateTime process9Start;
    DateTime process9End;
    DateTime process10Start;
    DateTime process10End;

    factory Ticket.fromJson(Map<String, dynamic> json) => Ticket(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        totalcount: json["totalcount"],
        getJsonStart: DateTime.parse(json["get_json_start"]),
        getJsonEnd: DateTime.parse(json["get_json_end"]),
        process1Start: DateTime.parse(json["process_1_start"]),
        process1End: DateTime.parse(json["process_1_end"]),
        process2Start: DateTime.parse(json["process_2_start"]),
        process2End: DateTime.parse(json["process_2_end"]),
        process3Start: DateTime.parse(json["process_3_start"]),
        process3End: DateTime.parse(json["process_3_end"]),
        process4Start: DateTime.parse(json["process_4_start"]),
        process4End: DateTime.parse(json["process_4_end"]),
        process5Start: DateTime.parse(json["process_5_start"]),
        process5End: DateTime.parse(json["process_5_end"]),
        process6Start: DateTime.parse(json["process_6_start"]),
        process6End: DateTime.parse(json["process_6_end"]),
        process7Start: DateTime.parse(json["process_7_start"]),
        process7End: DateTime.parse(json["process_7_end"]),
        process8Start: DateTime.parse(json["process_8_start"]),
        process8End: DateTime.parse(json["process_8_end"]),
        process9Start: DateTime.parse(json["process_9_start"]),
        process9End: DateTime.parse(json["process_9_end"]),
        process10Start: DateTime.parse(json["process_10_start"]),
        process10End: DateTime.parse(json["process10_end"]),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "totalcount": totalcount,
        "get_json_start": getJsonStart.toIso8601String(),
        "get_json_end": getJsonEnd.toIso8601String(),
        "process_1_start": process1Start.toIso8601String(),
        "process_1_end": process1End.toIso8601String(),
        "process_2_start": process2Start.toIso8601String(),
        "process_2_end": process2End.toIso8601String(),
        "process_3_start": process3Start.toIso8601String(),
        "process_3_end": process3End.toIso8601String(),
        "process_4_start": process4Start.toIso8601String(),
        "process_4_end": process4End.toIso8601String(),
        "process_5_start": process5Start.toIso8601String(),
        "process_5_end": process5End.toIso8601String(),
        "process_6_start": process6Start.toIso8601String(),
        "process_6_end": process6End.toIso8601String(),
        "process_7_start": process7Start.toIso8601String(),
        "process_7_end": process7End.toIso8601String(),
        "process_8_start": process8Start.toIso8601String(),
        "process_8_end": process8End.toIso8601String(),
        "process_9_start": process9Start.toIso8601String(),
        "process_9_end": process9End.toIso8601String(),
        "process_10_start": process10Start.toIso8601String(),
        "process10_end": process10End.toIso8601String(),
    };
}

class Datum {
    Datum({
        this.lngTicketId,
        this.ticket,
        this.project,
        this.title,
        this.createdBy,
        this.created,
        this.status,
        this.statusId,
        this.priority,
        this.priorityId,
        this.moduleName,
    });

    int lngTicketId;
    String ticket;
    String project;
    String title;
    String createdBy;
    String created;
    String status;
    int statusId;
    String priority;
    int priorityId;
    String moduleName;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        lngTicketId: json["lng_TicketID"],
        ticket: json["ticket"],
        project: json["project"],
        title: json["title"],
        createdBy: json["created_by"],
        created: json["created"],
        status: json["status"],
        statusId: json["statusID"],
        priority: json["priority"],
        priorityId: json["priorityID"],
        moduleName: json["module_name"],
    );

    Map<String, dynamic> toJson() => {
        "lng_TicketID": lngTicketId,
        "ticket": ticket,
        "project": project,
        "title": title,
        "created_by": createdBy,
        "created": created,
        "status": status,
        "statusID": statusId,
        "priority": priority,
        "priorityID": priorityId,
        "module_name": moduleName,
    };
}
