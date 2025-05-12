enum OrderStatus {
  received,
  preparing,
  outForDelivery,
  delivered,
}

int mapStatusToStep(OrderStatus status) {
  switch (status) {
    case OrderStatus.received:
      return 0;
    case OrderStatus.preparing:
      return 1;
    case OrderStatus.outForDelivery:
      return 2;
    case OrderStatus.delivered:
      return 3;
  }
}
