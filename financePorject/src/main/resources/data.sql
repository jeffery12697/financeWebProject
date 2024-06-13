SELECT insert_product('P001', 'Product A', 100.0, 0.05);
SELECT insert_product('P002', 'Product B', 200.0, 0.10);
SELECT insert_product('P003', 'Product C', 150.0, 0.07);
SELECT insert_product('P004', 'Product D', 300.0, 0.15);
SELECT insert_product('P005', 'Product E', 250.0, 0.12);
SELECT insert_product('P006', 'Product F', 350.0, 0.08);
SELECT insert_product('P007', 'Product G', 400.0, 0.20);
SELECT insert_product('P008', 'Product H', 450.0, 0.25);
SELECT insert_product('P009', 'Product I', 500.0, 0.30);
SELECT insert_product('P010', 'Product J', 550.0, 0.35);

SELECT insert_myuser('U001', 'Alice', 'alice@example.com', '111122223333');
SELECT insert_myuser('U002', 'Bob', 'bob@example.com', '111122223334');
SELECT insert_myuser('U003', 'Charlie', 'charlie@example.com', '111122223335');
SELECT insert_myuser('U004', 'David', 'david@example.com', '111122223336');
SELECT insert_myuser('U005', 'Eve', 'eve@example.com', '111122223337');
SELECT insert_myuser('U006', 'Frank', 'frank@example.com', '111122223338');
SELECT insert_myuser('U007', 'Grace', 'grace@example.com', '111122223339');
SELECT insert_myuser('U008', 'Hank', 'hank@example.com', '111122223340');
SELECT insert_myuser('U009', 'Ivy', 'ivy@example.com', '111122223341');
SELECT insert_myuser('U010', 'Jack', 'jack@example.com', '111122223342');


SELECT insert_likelist('U001', 'P001', 2, '111122223333', 10.0, 200.0);
SELECT insert_likelist('U002', 'P002', 3, '111122223334', 30.0, 600.0);
SELECT insert_likelist('U003', 'P003', 1, '111122223335', 10.5, 150.0);
SELECT insert_likelist('U004', 'P004', 5, '111122223336', 75.0, 1500.0);
SELECT insert_likelist('U005', 'P005', 2, '111122223337', 60.0, 500.0);
SELECT insert_likelist('U006', 'P006', 4, '111122223338', 112.0, 1400.0);
SELECT insert_likelist('U007', 'P007', 1, '111122223339', 80.0, 400.0);
SELECT insert_likelist('U008', 'P008', 3, '111122223340', 337.5, 1350.0);
SELECT insert_likelist('U009', 'P009', 2, '111122223341', 300.0, 1000.0);
SELECT insert_likelist('U010', 'P010', 4, '111122223342', 140.0, 2200.0);