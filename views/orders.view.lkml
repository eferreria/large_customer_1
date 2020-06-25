include: "//dev_thecompany/orders.view"

explore: orders {}

explore: lc_orders {}

view: lc_orders {
  extends: [orders]

  dimension: id {
    label: "Order ID"
  }

  measure: total_users {
    type: count_distinct
    sql: ${user_id} ;;
  }


  }

explore: orders_metrics_base {}

view: orders_metrics_base {
  extends: [orders]

  measure: total_users {
    label: "New Total Users"
    type: count_distinct
    sql: ${user_id} ;;
  }

}

view: customer_orders {
  extends: [lc_orders, orders_metrics_base]
}

explore: customer_orders {}
