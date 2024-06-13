package com.example.financePorject.like;

public record Like(
        Integer sn,
        String userId,
        String productId,
        String productName,
        double feeRate,
        double price,
        String account,
        Integer quantity,
        double totalFee,
        double totalAmount
){}