
INSERT INTO shopping.products (id, name, description, key_word, price, counts, url, type) VALUES (1, 'skinny suit in grey', 'skinny suit in grey', 'suit;', 499, 2000, 'suit1(1)', 1);
INSERT INTO shopping.products (id, name, description, key_word, price, counts, url, type) VALUES (2, 'Pure Cotton T-Shirt in White', 'Pure Cotton T-Shirt in White', 'pure cotton;t-shirt;', 59, 3999, 'T恤1(1)', 1);
INSERT INTO shopping.products (id, name, description, key_word, price, counts, url, type) VALUES (3, 'jeans in blue', 'jeans in blue', 'jeans;', 189, 4000, '牛仔裤(1)', 1);
INSERT INTO shopping.products (id, name, description, key_word, price, counts, url, type) VALUES (4, 'black leather jacket', 'black leather jacket', 'jacket;', 599, 1000, '夹克(1)', 1);
INSERT INTO shopping.products (id, name, description, key_word, price, counts, url, type) VALUES (5, 'shorts', 'shorts', 'shorts;', 49, 6000, '短裤(1)', 1);
INSERT INTO shopping.products (id, name, description, key_word, price, counts, url, type) VALUES (6, 'camera', 'camera', 'camera;', 3999, 2000, '相机(1)', 2);
INSERT INTO shopping.products (id, name, description, key_word, price, counts, url, type) VALUES (7, 'Huawei mate40', 'Huawei mate40', 'huawei;', 3999, 2000, '华为(1)', 2);
INSERT INTO shopping.products (id, name, description, key_word, price, counts, url, type) VALUES (8, 'Macbook', 'i7 16G 256G', 'Macbook;', 6999, 3000, '苹果(1)', 2);
INSERT INTO shopping.products (id, name, description, key_word, price, counts, url, type) VALUES (9, 'ipad', '4G 128G', 'ipad', 3599, 3000, 'ipad(1)', 2);
INSERT INTO shopping.products (id, name, description, key_word, price, counts, url, type) VALUES (10, 'introduction of algorithm', 'introduction of algorithm', 'algorithm;', 69, 4000, '算法导论(1)', 3);
INSERT INTO shopping.products (id, name, description, key_word, price, counts, url, type) VALUES (11, 'Modern operating system', 'Modern operating system', 'operating system;', 69, 6000, '操作系统(1)', 3);
INSERT INTO shopping.products (id, name, description, key_word, price, counts, url, type) VALUES (12, 'The C Programming Language', 'The C Programming Language', 'C;', 75, 6000, 'c(1)', 3);
INSERT INTO shopping.products (id, name, description, key_word, price, counts, url, type) VALUES (13, 'introduction of Java programming', 'introduction of Java programming', 'java;', 69, 4000, 'java(1)', 3);
INSERT INTO shopping.products (id, name, description, key_word, price, counts, url, type) VALUES (14, 'Mario', 'Mario', 'Mario;', 699, 5, '马里奥(1)', 4);
INSERT INTO shopping.products (id, name, description, key_word, price, counts, url, type) VALUES (15, 'iron man', 'iron man', 'iron man;', 6999, 5, '钢铁侠(1)', 4);
INSERT INTO shopping.products (id, name, description, key_word, price, counts, url, type) VALUES (16, 'XBOX gamepad', 'XBOX gamepad', 'XBOX,gamepad', 700, 200, 'tag5x-d71kt', 4);
INSERT INTO shopping.products (id, name, description, key_word, price, counts, url, type) VALUES (17, 'ceramic cup', 'ceramic cup', 'ceramic cup', 50, 9999, 'ti7vx-lzk3e', 5);
INSERT INTO shopping.products (id, name, description, key_word, price, counts, url, type) VALUES (18, 'lipstick', 'lipstick', 'lipstick', 399, 9999, 'tmcf5-xzrzz', 6);
INSERT INTO shopping.products (id, name, description, key_word, price, counts, url, type) VALUES (19, 'table tennis bats', 'table tennis bats', 'table tennis，bats', 30, 1000, 'tkmjp-2ukoy', 7);
INSERT INTO shopping.products (id, name, description, key_word, price, counts, url, type) VALUES (20, 'XIAOMI SU7', 'XIAOMI SU7', 'XIAOMI SU7', 299999, 1, 'trq2d-q5sa1', 7);

INSERT INTO `user_main`(`id`, `name`, `email`, `nick_name`, `role`) VALUES (1, 'admin', 'admin@abc.com', 'admin', 1);
INSERT INTO `user_main`(`id`, `name`, `email`, `nick_name`, `role`) VALUES (2, 'user1', 'user1@abc.com', 'user1', 0);

INSERT INTO `user_detail`(`id`, `password`, `phone_number`, `sex`, `birthday`, `post_number`, `address`, `register_time`) VALUES (1, 'admin', '12345677654', 0, '2000/01/01', '000000', '地球', '2020-01-01 00:00:00');
INSERT INTO `user_detail`(`id`, `password`, `phone_number`, `sex`, `birthday`, `post_number`, `address`, `register_time`) VALUES (2, '123', '11111111111', 0, '2000/01/01', '000000', '地球', '2020-01-01 00:00:00');



INSERT INTO message (sender, text, times, receiver) VALUES ('admin', 'Hello, how are you?', '2024-05-17 10:00:00', 'user1');
INSERT INTO message (sender, text, times, receiver) VALUES ('user1', 'Hi Alice, I am doing well, thank you!', '2024-05-17 10:05:00', 'admin');
INSERT INTO message (sender, text, times, receiver) VALUES ('admin', 'That is great to hear!', '2024-05-17 10:10:00', 'user1');
