create table OrderProduct(
	
	OrderId not null,
	SupID NUMBER not null,
	OrdQty NUMBER not null,
	primary key(OrderId),
	foreign key(OrderId) references OrderInfo(OrderId),
	foreign key(SupID) references supplement(SupID)

);