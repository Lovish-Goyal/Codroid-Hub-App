// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class OrderApiModel {
  final String id;
  final String? entity;
  final int amount;
  final int? amountPaid;
  final int? amountDue;
  final String? currency;
  final String? receipt;
  final String? offerId;
  final String? status;
  final int? attempts;
  final Map<String, dynamic>? notes;
  final int? createdAt;
  OrderApiModel({
    required this.id,
    this.entity,
    required this.amount,
    this.amountPaid,
    this.amountDue,
    this.currency,
    this.receipt,
    this.offerId,
    this.status,
    this.attempts,
    this.notes,
    this.createdAt,
  });

  OrderApiModel copyWith({
    String? id,
    String? entity,
    int? amount,
    int? amountPaid,
    int? amountDue,
    String? currency,
    String? receipt,
    String? offerId,
    String? status,
    int? attempts,
    Map<String, dynamic>? notes,
    int? createdAt,
  }) {
    return OrderApiModel(
      id: id ?? this.id,
      entity: entity ?? this.entity,
      amount: amount ?? this.amount,
      amountPaid: amountPaid ?? this.amountPaid,
      amountDue: amountDue ?? this.amountDue,
      currency: currency ?? this.currency,
      receipt: receipt ?? this.receipt,
      offerId: offerId ?? this.offerId,
      status: status ?? this.status,
      attempts: attempts ?? this.attempts,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'amount': amount,
      'receipt': receipt,
      'notes': notes,
    };
  }

  factory OrderApiModel.fromMap(Map<String, dynamic> map) {
    return OrderApiModel(
      id: map['id'] as String,
      entity: map['entity'] != null ? map['entity'] as String : null,
      amount: map['amount'] as int,
      amountPaid: map['amount_paid'] != null ? map['amount_paid'] as int : null,
      amountDue: map['amount_due'] != null ? map['amount_due'] as int : null,
      currency: map['currency'] != null ? map['currency'] as String : null,
      receipt: map['receipt'] != null ? map['receipt'] as String : null,
      offerId: map['offerId'] != null ? map['offerId'] as String : null,
      status: map['status'] != null ? map['status'] as String : null,
      attempts: map['attempts'] != null ? map['attempts'] as int : null,
      notes: map['notes'] != null
          ? Map<String, dynamic>.from((map['notes'] as Map<String, dynamic>))
          : null,
      createdAt: map['createdAt'] != null ? map['createdAt'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderApiModel.fromJson(String source) =>
      OrderApiModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OrderApiModel(id: $id, entity: $entity, amount: $amount, amount_paid: $amountPaid, amount_due: $amountDue, currency: $currency, receipt: $receipt, offerId: $offerId, status: $status, attempts: $attempts, notes: $notes, createdAt: $createdAt)';
  }

  @override
  bool operator ==(covariant OrderApiModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.entity == entity &&
        other.amount == amount &&
        other.amountPaid == amountPaid &&
        other.amountDue == amountDue &&
        other.currency == currency &&
        other.receipt == receipt &&
        other.offerId == offerId &&
        other.status == status &&
        other.attempts == attempts &&
        mapEquals(other.notes, notes) &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        entity.hashCode ^
        amount.hashCode ^
        amountPaid.hashCode ^
        amountDue.hashCode ^
        currency.hashCode ^
        receipt.hashCode ^
        offerId.hashCode ^
        status.hashCode ^
        attempts.hashCode ^
        notes.hashCode ^
        createdAt.hashCode;
  }
}
