
INSERT INTO shopping.products (id, name, description, key_word, price, counts, url, type) VALUES (1, '酒吞童子', 'SSR！全新的SSR！', '阴阳师;游戏;网易', 199, 200000, '1', 4);
INSERT INTO shopping.products (id, name, description, key_word, price, counts, url, type) VALUES (2, '古剑奇谭二', '国产单机游戏，阿阮我的！', '单机游戏;国产;古剑', 69, 100000, '2', 4);
INSERT INTO shopping.products (id, name, description, key_word, price, counts, url, type) VALUES (3, 'BJD娃娃', '每一个娃娃都是天使，娃妈娃爹就是天使长！', 'BJD;娃娃', 19999, 300000, '3', 4);
INSERT INTO shopping.products (id, name, description, key_word, price, counts, url, type) VALUES (4, '疯狂Android讲义', '这是用来看的嘛？不，这是用来砸人的！装备后攻击+100，防御-100，体力-100，幸运-10，知识+100，固有技能：Android Studio！', '李刚;疯狂系列;Android;安卓', 129, 300000, '4', 3);
INSERT INTO shopping.products (id, name, description, key_word, price, counts, url, type) VALUES (5, '小米MIX', '全面屏！正面都是屏幕！', '小米;全面屏;手机', 3999, 20000, '5', 2);
INSERT INTO shopping.products (id, name, description, key_word, price, counts, url, type) VALUES (6, '雪中飞羽绒服', '少年，穿上这件衣服，下雪你就可以飞了！', '羽绒服;保暖', 799, 10000, '6', 1);
INSERT INTO shopping.products (id, name, description, key_word, price, counts, url, type) VALUES (7, '苹果笔记本', '办公必备', '苹果;笔记本', 19999, 100000, '7', 2);
INSERT INTO shopping.products (id, name, description, key_word, price, counts, url, type) VALUES (8, '化妆品', '比ps好用，你信不', '化妆品', 1999, 10000, '8', 6);
INSERT INTO shopping.products (id, name, description, key_word, price, counts, url, type) VALUES (9, '足球', '圆圆的，白白的，会滚，一斤三块？要不，来两斤？', '足球;运动', 199, 100000, '9', 7);
INSERT INTO shopping.products (id, name, description, key_word, price, counts, url, type) VALUES (19, 'skinny suit in grey', 'skinny suit in grey', 'suit;', 499, 2000, 'suit1(1)', 1);
INSERT INTO shopping.products (id, name, description, key_word, price, counts, url, type) VALUES (20, 'Pure Cotton T-Shirt in White', 'Pure Cotton T-Shirt in White', 'pure cotton;t-shirt;', 59, 4000, 'T恤1(1)', 1);
INSERT INTO shopping.products (id, name, description, key_word, price, counts, url, type) VALUES (21, 'jeans in blue', 'jeans in blue', 'jeans;', 189, 4000, '牛仔裤(1)', 1);
INSERT INTO shopping.products (id, name, description, key_word, price, counts, url, type) VALUES (22, 'black leather jacket', 'black leather jacket', 'jacket;', 599, 1000, '夹克(1)', 1);
INSERT INTO shopping.products (id, name, description, key_word, price, counts, url, type) VALUES (23, 'shorts', 'shorts', 'shorts;', 49, 6000, '短裤(1)', 1);
INSERT INTO shopping.products (id, name, description, key_word, price, counts, url, type) VALUES (24, 'camera', 'camera', 'camera;', 3999, 2000, '相机(1)', 2);
INSERT INTO shopping.products (id, name, description, key_word, price, counts, url, type) VALUES (25, 'Huawei mate40', 'Huawei mate40', 'huawei;', 3999, 2000, '华为(1)', 2);
INSERT INTO shopping.products (id, name, description, key_word, price, counts, url, type) VALUES (26, 'Macbook', 'i7 16G 256G', 'Macbook;', 6999, 3000, '苹果(1)', 2);
INSERT INTO shopping.products (id, name, description, key_word, price, counts, url, type) VALUES (27, 'ipad', '4G 128G', 'ipad', 3599, 3000, 'ipad(1)', 2);
INSERT INTO shopping.products (id, name, description, key_word, price, counts, url, type) VALUES (28, 'introduction of algorithm', 'introduction of algorithm', 'algorithm;', 69, 4000, '算法导论(1)', 3);
INSERT INTO shopping.products (id, name, description, key_word, price, counts, url, type) VALUES (29, 'Modern operating system', 'Modern operating system', 'operating system;', 69, 6000, '操作系统(1)', 3);
INSERT INTO shopping.products (id, name, description, key_word, price, counts, url, type) VALUES (30, 'The C Programming Language', 'The C Programming Language', 'C;', 75, 6000, 'c(1)', 3);
INSERT INTO shopping.products (id, name, description, key_word, price, counts, url, type) VALUES (31, 'introduction of Java programming', 'introduction of Java programming', 'java;', 69, 4000, 'java(1)', 3);
INSERT INTO shopping.products (id, name, description, key_word, price, counts, url, type) VALUES (32, 'Mario', 'Mario', 'Mario;', 699, 5, '马里奥(1)', 4);
INSERT INTO shopping.products (id, name, description, key_word, price, counts, url, type) VALUES (33, 'iron man', 'iron man', 'iron man;', 6999, 5, '钢铁侠(1)', 4);

INSERT INTO `user_main`(`id`, `name`, `email`, `nick_name`, `role`) VALUES (1, 'admin', 'admin@abc.com', 'admin', 1);
INSERT INTO `user_main`(`id`, `name`, `email`, `nick_name`, `role`) VALUES (2, 'user1', 'user1@abc.com', 'user1', 0);

INSERT INTO `user_detail`(`id`, `password`, `phone_number`, `sex`, `birthday`, `post_number`, `address`, `register_time`) VALUES (1, 'admin', '12345677654', 0, '2000/01/01', '000000', '地球', '2020-01-01 00:00:00');
INSERT INTO `user_detail`(`id`, `password`, `phone_number`, `sex`, `birthday`, `post_number`, `address`, `register_time`) VALUES (2, '123', '11111111111', 0, '2000/01/01', '000000', '地球', '2020-01-01 00:00:00');