def parse_csv_line(line: str):
    parts = line.split(",")

    if parts[0] == "order_id":
        return None

    quantity = int(parts[3])
    price = float(parts[4])

    return {
        "order_id": parts[0],
        "product_name": parts[1],
        "category": parts[2],
        "quantity": quantity,
        "price": price,
        "total_amount": quantity * price
    }
