package com.ARF21.pack.shop.controller.request;

import lombok.*;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@AllArgsConstructor
@RequiredArgsConstructor
@ToString
@Getter
@Setter
public class OrderResponse {

    private Long orderId;
    private LocalDateTime orderTime;
    private double orderPrice;
    private List<OrderItemResponse> orderItems;




}
