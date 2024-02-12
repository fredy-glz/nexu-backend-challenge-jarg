CREATE DATABASE IF NOT EXISTS `nexu-backend-challenge`;

USE `nexu-backend-challenge`;

CREATE TABLE brand (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    UNIQUE(name)
);

CREATE TABLE model (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    average_price BIGINT NOT NULL,
    brand_id INT NOT NULL,
    FOREIGN KEY (brand_id) REFERENCES brand(id)
);

INSERT INTO
    brand(id, name)
VALUES
    (1, 'Acura'),
    (2, 'Audi'),
    (3, 'Bentley'),
    (4, 'BMW'),
    (5, 'Buick'),
    (6, 'Cadillac'),
    (7, 'Chevrolet'),
    (8, 'Chrysler'),
    (9, 'Dodge'),
    (10, 'FAW'),
    (11, 'Ferrari'),
    (12, 'Fiat'),
    (13, 'Ford'),
    (14, 'GMC'),
    (15, 'Honda'),
    (16, 'Infiniti'),
    (17, 'Jaguar'),
    (18, 'Jeep'),
    (19, 'Lamborghini'),
    (20, 'Land Rover'),
    (21, 'Lincoln'),
    (22, 'Maserati'),
    (23, 'Mastretta'),
    (24, 'Mazda'),
    (25, 'Mercedes Benz'),
    (26, 'Mitsubishi'),
    (27, 'Nissan'),
    (28, 'Peugeot'),
    (29, 'Porsche'),
    (30, 'RAM'),
    (31, 'Renault'),
    (32, 'Rolls Royce'),
    (33, 'Seat'),
    (34, 'Smart'),
    (35, 'Subaru'),
    (36, 'Suzuki'),
    (37, 'Toyota'),
    (38, 'Volkswagen'),
    (39, 'Volvo'),
    (40, 'Alfa Romeo'),
    (41, 'Hummer'),
    (42, 'Hyundai'),
    (43, 'Isuzu'),
    (44, 'McLaren'),
    (45, 'Mercury'),
    (46, 'Cbo'),
    (47, 'Pontiac'),
    (48, 'Saab'),
    (49, 'Aston Martin'),
    (50, 'Lotus'),
    (51, 'MG'),
    (52, 'Tesla'),
    (53, 'Abarth'),
    (54, 'KIA'),
    (55, 'Mini Cooper'),
    (56, 'Baic'),
    (57, 'JAC'),
    (58, 'HINO'),
    (59, 'International'),
    (60, 'UAZ'),
    (61, 'Zacua');

INSERT INTO
    model (id, name, average_price, brand_id)
VALUES
    (1, 'ILX', 303176, 1),
    (2, 'MDX', 448193, 1),
    (3, 'RDX', 395753, 1),
    (4, 'RLX', 453100, 1),
    (5, 'TL', 247225, 1),
    (6, 'TSX', 232533, 1),
    (7, 'A1', 260696, 2),
    (9, 'A3', 255299, 2),
    (10, 'A4', 299412, 2),
    (11, 'A5', 511069, 2),
    (12, 'A6', 499782, 2),
    (13, 'A7', 1040891, 2),
    (14, 'A8', 1059155, 2),
    (15, 'Q3', 454949, 2),
    (16, 'Q5', 532993, 2),
    (17, 'Q7', 593487, 2),
    (18, 'R8', 1463936, 2),
    (21, 'TT', 498670, 2),
    (24, 'Continental', 0, 3),
    (25, 'Flying Spur', 3968000, 3),
    (26, 'Continental GT', 4498875, 3),
    (27, 'Mulsanne', 3968000, 3),
    (54, 'X6', 898716, 4),
    (60, 'Enclave', 583200, 5),
    (61, 'Encore', 335845, 5),
    (62, 'LaCrosse', 419233, 5),
    (63, 'Regal', 352460, 5),
    (64, 'Verano', 325409, 5),
    (65, 'ATS', 737342, 6),
    (66, 'CTS', 636500, 6),
    (70, 'SRX', 422207, 6),
    (71, 'Aveo', 128557, 7),
    (72, 'Camaro', 507271, 7),
    (74, 'Cheyenne', 345435, 7),
    (75, 'Colorado', 284984, 7),
    (76, 'Cruze', 227283, 7),
    (80, 'Malibu', 238000, 7),
    (81, 'Matiz', 56821, 7),
    (84, 'Sonic', 146029, 7),
    (85, 'Spark', 144415, 7),
    (86, 'Suburban', 572851, 7),
    (87, 'Tahoe', 519019, 7),
    (88, 'Tornado', 152882, 7),
    (89, 'Traverse', 412188, 7),
    (90, 'Trax', 236175, 7),
    (91, 'Chrysler 200', 283907, 8),
    (92, 'Chrysler 300', 366584, 8),
    (93, 'Town', 317192, 8),
    (94, 'Attitude', 121966, 9),
    (95, 'Avenger', 134104, 9),
    (96, 'Challenger', 630386, 9),
    (97, 'Charger', 376721, 9),
    (98, 'Dart', 278366, 9),
    (99, 'Durango', 294664, 9),
    (101, 'Journey', 274681, 9),
    (102, 'GF250 ', 0, 10),
    (103, 'GF6000', 0, 10),
    (104, 'GF70', 112600, 10),
    (105, 'GF7000', 0, 10),
    (106, 'GF8', 103500, 10),
    (107, 'GF900', 0, 10),
    (110, 'California', 0, 11),
    (112, 'FF', 0, 11),
    (113, 'Ducato', 0, 12),
    (114, 'F500', 0, 12),
    (115, 'Palio', 130515, 12),
    (116, 'Palio Adventure', 0, 12),
    (117, 'Punto', 181600, 12),
    (118, 'Palio Strada', 110558, 12),
    (119, 'Strada Adventure', 0, 12),
    (120, 'Uno', 161305, 12),
    (121, 'E-150', 0, 13),
    (122, 'E-350', 0, 13),
    (123, 'Eco Sport', 189465, 13),
    (124, 'Edge', 408952, 13),
    (125, 'Escape', 226759, 13),
    (126, 'Expedition', 436655, 13),
    (127, 'Explorer', 318270, 13),
    (128, 'F-150', 268727, 13),
    (129, 'F-250', 201785, 13),
    (130, 'F-350', 287341, 13),
    (131, 'F-450', 320575, 13),
    (132, 'F-550', 370436, 13),
    (133, 'Fiesta', 138747, 13),
    (134, 'Focus', 189192, 13),
    (135, 'Fusion', 252518, 13),
    (136, 'Ikon hatchback', 0, 13),
    (137, 'Lobo', 363385, 13),
    (138, 'Lobo Raptor', 0, 13),
    (139, 'Mustang', 367921, 13),
    (140, 'Ranger', 210497, 13),
    (141, 'Transit', 278628, 13),
    (142, 'Acadia', 400347, 14),
    (143, 'Sierra', 464248, 14),
    (146, 'Terrain', 444504, 14),
    (147, 'Yukon', 556491, 14),
    (148, 'Accord', 221035, 15),
    (149, 'City', 166870, 15),
    (150, 'Civic', 185562, 15),
    (151, 'CR-V', 247293, 15),
    (152, 'CR-Z', 209033, 15),
    (153, 'Crosstour', 255420, 15),
    (154, 'Fit', 142098, 15),
    (155, 'Odyssey', 343033, 15),
    (156, 'Pilot', 331339, 15),
    (157, 'Ridge Line', 253687, 15),
    (158, 'Q60', 673900, 16),
    (159, 'Q70', 651500, 16),
    (160, 'QX60', 665011, 16),
    (161, 'QX70', 660861, 16),
    (162, 'QX80', 951850, 16),
    (163, 'F', 1484528, 17),
    (164, 'XF', 791032, 17),
    (165, 'XJ', 606150, 17),
    (166, 'XKR', 0, 17),
    (167, 'Cherokee', 456109, 18),
    (168, 'Compass', 263629, 18),
    (169, 'Grand Cherokee', 562944, 18),
    (170, 'Patriot', 185558, 18),
    (171, 'Wrangler', 396757, 18),
    (173, 'Aventador', 0, 19),
    (174, 'Gallardo', 0, 19),
    (175, 'Defender', 923797, 20),
    (176, 'Discovery', 1019830, 20),
    (177, 'LR2', 482077, 20),
    (178, 'Range Rover', 1762459, 20),
    (179, 'Mark LT', 318420, 21),
    (180, 'MKS', 309425, 21),
    (181, 'MKX', 429064, 21),
    (182, 'MKZ', 417642, 21),
    (183, 'Navigator', 578993, 21),
    (184, 'Gran Cabrio', 0, 22),
    (185, 'Gran Turismo', 2810925, 22),
    (186, 'Quattroporte', 2263000, 22),
    (187, 'MXT', 0, 23),
    (188, 'Mazda 2', 183824, 24),
    (189, 'Mazda 3', 192010, 24),
    (191, 'Mazda 5', 135327, 24),
    (192, 'Mazda 6', 194683, 24),
    (194, 'CX9', 383370, 24),
    (195, 'MX5', 261504, 24),
    (196, 'Clase A', 463191, 25),
    (197, 'Clase B', 239151, 25),
    (198, 'Clase C', 672744, 25),
    (199, 'Clase CLA', 488793, 25),
    (200, 'Clase CLS', 767931, 25),
    (201, 'Clase E', 727529, 25),
    (202, 'Clase G', 2193198, 25),
    (203, 'Clase GL', 696475, 25),
    (204, 'Clase GLK', 351929, 25),
    (205, 'Clase ML', 0, 25),
    (206, 'Clase S', 2556844, 25),
    (207, 'Clase SL', 1584684, 25),
    (208, 'Clase SLK', 530838, 25),
    (209, 'Clase SLS AMG', 0, 25),
    (210, 'Viano', 433878, 25),
    (220, 'ASX', 209442, 26),
    (221, 'L200', 215532, 26),
    (222, 'Lancer', 153796, 26),
    (223, 'Montero', 350767, 26),
    (224, 'Outlander', 236435, 26),
    (225, '370Z', 440869, 27),
    (226, 'Altima', 184092, 27),
    (227, 'Armada', 340681, 27),
    (228, 'Frontier LE', 0, 27),
    (229, 'Frontier XE', 0, 27),
    (230, 'Juke', 226880, 27),
    (231, 'March', 130214, 27),
    (232, 'Maxima', 295525, 27),
    (233, 'Murano', 262091, 27),
    (234, 'Note', 184206, 27),
    (235, 'NP300', 0, 27),
    (236, 'Pathfinder', 342334, 27),
    (237, 'Rogue', 175936, 27),
    (238, 'Sentra', 157613, 27),
    (239, 'Titan', 251044, 27),
    (240, 'Tsuru', 78120, 27),
    (241, 'Urvan', 239288, 27),
    (242, 'Versa', 159324, 27),
    (243, 'X Trail', 260731, 27),
    (245, '207 CC', 0, 28),
    (246, '208', 201530, 28),
    (249, '3008', 336527, 28),
    (250, '301', 184431, 28),
    (251, '308', 245043, 28),
    (252, '308 CC', 0, 28),
    (253, '508', 314191, 28),
    (254, 'Manager', 342506, 28),
    (257, 'RCZ', 404630, 28),
    (258, '911', 1371633, 29),
    (267, 'Boxster', 745149, 29),
    (269, 'Cayenne', 941314, 29),
    (270, 'Cayman', 743222, 29),
    (272, 'Panamera', 1500840, 29),
    (278, 'Bighorn', 0, 30),
    (279, 'Crew Cab', 0, 30),
    (281, 'Hemi Sport', 0, 30),
    (282, 'Power Wagon', 0, 30),
    (283, 'Regular Cab R/T', 0, 30),
    (284, 'Regular Cab SLT', 0, 30),
    (285, 'ST', 0, 30),
    (286, 'Duster', 209145, 31),
    (287, 'Fluence', 169802, 31),
    (288, 'Kangoo', 60585, 31),
    (289, 'Koleos', 257672, 31),
    (290, 'Safrane', 181925, 31),
    (291, 'Sandero', 126814, 31),
    (292, 'Stepway', 167890, 31),
    (294, 'Ghost', 0, 32),
    (295, 'Phantom', 0, 32),
    (296, 'Altea', 141055, 33),
    (297, 'Freetrack', 164408, 33),
    (298, 'Ibiza', 156859, 33),
    (299, 'Leon', 234543, 33),
    (301, 'Toledo', 191512, 33),
    (302, 'Brabus', 0, 34),
    (303, 'Fortwo', 0, 34),
    (304, 'Forester', 307996, 35),
    (305, 'Impreza', 232322, 35),
    (306, 'Legacy', 231704, 35),
    (307, 'Outback', 294950, 35),
    (308, 'WRX', 344748, 35),
    (309, 'XV', 310570, 35),
    (310, 'Grand Vitara', 197100, 36),
    (311, 'Kizashi', 241536, 36),
    (312, 'S-Cross', 235612, 36),
    (313, 'Swift', 171901, 36),
    (314, 'SX 4 Crossover', 0, 36),
    (316, 'SX 4 Sedan ', 0, 36),
    (317, 'Avanza', 161502, 37),
    (318, 'Camry', 260490, 37),
    (319, 'Corolla', 180456, 37),
    (320, 'FJ Cruiser', 301680, 37),
    (321, 'Hiace', 226078, 37),
    (322, 'Highlander', 375704, 37),
    (323, 'Hilux', 209308, 37),
    (324, 'Land Cruiser', 700584, 37),
    (325, 'Prius', 281072, 37),
    (326, 'Rav4', 254634, 37),
    (327, 'Sequoia', 490790, 37),
    (328, 'Sienna', 329930, 37),
    (329, 'Tacoma', 352954, 37),
    (330, 'Tundra', 402731, 37),
    (333, 'Amarok', 341421, 38),
    (334, 'Beetle', 174920, 38),
    (335, 'CC', 299380, 38),
    (336, 'Clasico', 0, 38),
    (337, 'CrossFox', 158882, 38),
    (338, 'Gol', 115926, 38),
    (339, 'Gol Sedan', 0, 38),
    (340, 'Jetta Clasico', 100096, 38),
    (341, 'Passat', 216005, 38),
    (342, 'Polo', 165026, 38),
    (343, 'Saveiro', 199246, 38),
    (344, 'Tiguan', 317202, 38),
    (345, 'Touareg', 483431, 38),
    (346, 'Vento', 175146, 38),
    (347, 'S60', 372106, 39),
    (348, 'S80', 256982, 39),
    (349, 'V40', 332068, 39),
    (351, 'V60', 460872, 39),
    (352, 'XC60', 498311, 39),
    (353, 'XC90', 587919, 39),
    (354, 'RL', 239050, 1),
    (355, 'ZDX', 405550, 1),
    (356, '147', 0, 40),
    (357, '166', 0, 40),
    (358, '4C', 1081850, 40),
    (359, 'Giulietta', 457240, 40),
    (360, 'MiTo', 345862, 40),
    (366, 'i3', 671180, 4),
    (367, 'i8', 2195133, 4),
    (373, 'Serie 1', 277295, 4),
    (374, 'Serie 2', 584746, 4),
    (375, 'Serie 3', 415477, 4),
    (376, 'Serie 4', 758820, 4),
    (377, 'Serie 5', 553739, 4),
    (378, 'Serie 6', 891559, 4),
    (379, 'Serie 7', 1132673, 4),
    (380, 'Serie 8', 2179900, 4),
    (381, 'X1', 373718, 4),
    (382, 'X3', 398124, 4),
    (383, 'X4', 730075, 4),
    (384, 'X5', 796909, 4),
    (386, 'Z', 479845, 4),
    (387, 'LeSabre', 0, 5),
    (388, 'Rendezvous', 0, 5),
    (389, 'Terraza', 0, 5),
    (391, 'BLS', 113350, 6),
    (392, 'DTS', 0, 6),
    (394, 'STS', 192210, 6),
    (395, '3500', 253193, 7),
    (397, 'Astra', 79910, 7),
    (398, 'Avalanche', 289500, 7),
    (399, 'Blazer', 697900, 7),
    (403, 'Captiva', 204955, 7),
    (408, 'Chevy', 61489, 7),
    (410, 'Cobalt', 0, 7),
    (411, 'Corsa', 61780, 7),
    (412, 'Corvette', 811984, 7),
    (415, 'Epica', 93033, 7),
    (416, 'Equinox', 340491, 7),
    (417, 'Express', 0, 7),
    (418, 'HHR', 94141, 7),
    (419, 'Impala', 0, 7),
    (420, 'Meriva', 62754, 7),
    (422, 'Optra', 78281, 7),
    (423, 'S10', 306100, 7),
    (424, 'SS R', 0, 7),
    (426, 'Sonora', 104450, 7),
    (427, 'Tracker', 91066, 7),
    (428, 'Trailblazer', 101966, 7),
    (429, 'Uplander', 113130, 7),
    (431, 'Vectra', 90933, 7),
    (432, 'Venture', 0, 7),
    (433, 'Zafira', 90400, 7),
    (434, 'Aspen', 174762, 8),
    (435, 'Avenger', 135956, 8),
    (436, 'Cirrus', 126755, 8),
    (438, 'Crossfire', 149550, 8),
    (439, 'Dart', 220718, 8),
    (441, 'Grand Voyager', 0, 8),
    (443, 'PT Cruiser', 83738, 8),
    (444, 'Pacifica', 521537, 8),
    (445, 'Sebring', 0, 8),
    (448, 'Voyager', 113932, 8),
    (449, 'Atos', 61385, 9),
    (450, 'Caliber', 113914, 9),
    (453, 'Dakota', 143623, 9),
    (454, 'Grand Caravan', 497464, 9),
    (455, 'H 100', 173933, 9),
    (456, 'i10', 85793, 9),
    (457, 'Intrepid', 0, 9),
    (458, 'Magnum', 0, 9),
    (460, 'Neon', 254521, 9),
    (461, 'Nitro', 157452, 9),
    (462, 'RAM', 0, 9),
    (468, 'Stratus', 60283, 9),
    (469, 'Van 1000', 97850, 9),
    (470, 'Verna', 50766, 9),
    (471, 'Viper', 890387, 9),
    (475, '430', 0, 11),
    (476, '458', 0, 11),
    (477, '599', 0, 11),
    (478, '612', 0, 11),
    (479, 'F12', 0, 11),
    (480, 'La Ferrari', 0, 11),
    (481, '500', 221640, 12),
    (482, 'Albea', 75400, 12),
    (483, 'Bravo', 117000, 12),
    (484, 'Grande Punto', 76657, 12),
    (485, 'Linea', 118000, 12),
    (486, 'Panda', 77908, 12),
    (487, 'Stilo', 97800, 12),
    (488, 'Bronco', 0, 13),
    (489, 'Club Wagon', 0, 13),
    (493, 'Econoline', 171225, 13),
    (494, 'Escort', 0, 13),
    (495, 'Excursion', 0, 13),
    (496, 'F-100', 0, 13),
    (499, 'Five Hundred', 82700, 13),
    (500, 'Freestar', 100350, 13),
    (502, 'Ikon', 98350, 13),
    (503, 'Interceptor', 338475, 13),
    (504, 'Ka', 45233, 13),
    (506, 'Mondeo', 69310, 13),
    (508, 'Taurus', 0, 13),
    (510, 'Windstar', 0, 13),
    (511, 'Canyon', 182000, 14),
    (515, 'Savana', 0, 14),
    (517, 'Element', 0, 15),
    (518, 'Passport', 0, 15),
    (519, 'H1', 0, 41),
    (520, 'H2', 0, 41),
    (521, 'H3', 0, 41),
    (522, 'Atos', 0, 42),
    (523, 'Attitude', 0, 42),
    (524, 'Elantra', 224769, 42),
    (525, 'Grand i10', 136722, 42),
    (527, 'H100', 0, 42),
    (528, 'ix35', 200520, 42),
    (529, 'Sonata', 300443, 42),
    (530, 'Verna', 0, 42),
    (531, 'FX', 500350, 16),
    (532, 'FX 50', 0, 16),
    (533, 'G', 357625, 16),
    (534, 'I30', 0, 16),
    (535, 'JX', 430200, 16),
    (536, 'Q 45', 0, 16),
    (537, 'Q50', 519076, 16),
    (538, 'QX', 0, 16),
    (539, 'Rodeo', 0, 43),
    (540, 'S-Type', 150450, 17),
    (541, 'X-Type', 122725, 17),
    (542, 'XK', 615857, 17),
    (543, 'CJ5', 0, 18),
    (544, 'Commander', 157492, 18),
    (545, 'Grand Wagoneer', 0, 18),
    (546, 'Liberty', 188641, 18),
    (547, 'Asterion', 0, 19),
    (548, 'Huracan', 0, 19),
    (549, 'Veneno', 0, 19),
    (550, 'Evoque', 690500, 20),
    (551, 'Freelander', 108600, 20),
    (552, 'LR3', 209962, 20),
    (553, 'LR4', 505630, 20),
    (554, 'Aviator', 0, 21),
    (555, 'LS', 97000, 21),
    (556, 'MKC', 499270, 21),
    (557, 'Town Car', 122750, 21),
    (558, 'Zephyr', 113700, 21),
    (559, 'CX7', 179026, 24),
    (560, 'Tribute', 0, 24),
    (561, 'MP4-12C', 0, 44),
    (566, 'Clase CL', 937917, 25),
    (567, 'Clase CLK', 263046, 25),
    (568, 'Clase M', 578767, 25),
    (569, 'Clase R', 316430, 25),
    (570, 'Sprinter', 476619, 25),
    (571, 'Vito', 219848, 25),
    (572, 'Grand Marquis', 0, 45),
    (573, 'Mariner', 0, 45),
    (574, 'Milan', 0, 45),
    (576, 'Mountaineer', 0, 45),
    (578, 'CBO', 125775, 46),
    (580, 'Eclipse', 142225, 26),
    (581, 'Endeavor', 146240, 26),
    (582, 'Galant', 79163, 26),
    (583, 'Grandis', 125200, 26),
    (584, '240SX', 0, 27),
    (585, '350Z', 189600, 27),
    (586, 'Aprio', 69450, 27),
    (587, 'Cabstar', 294305, 27),
    (588, 'Estacas', 169790, 27),
    (589, 'NV2500', 303385, 27),
    (590, 'Platina', 58266, 27),
    (591, 'Quest', 128606, 27),
    (592, 'Tiida', 111954, 27),
    (593, 'Xterra', 0, 27),
    (595, '206', 63464, 28),
    (596, '307', 81807, 28),
    (597, '406', 0, 28),
    (598, '407', 93361, 28),
    (599, '607', 103000, 28),
    (600, 'Grand Raid', 89709, 28),
    (601, 'Partner', 172626, 28),
    (605, 'G-3', 70855, 47),
    (606, 'G-4', 66766, 47),
    (607, 'G-5', 88000, 47),
    (608, 'G-6', 95266, 47),
    (609, 'Grand Am', 0, 47),
    (610, 'Grand Prix', 0, 47),
    (611, 'Matiz', 44885, 47),
    (612, 'Montana', 107887, 47),
    (613, 'Solstice', 144780, 47),
    (614, 'Sunfire', 0, 47),
    (615, 'Torrent', 111772, 47),
    (621, '918 Spyder', 0, 29),
    (624, 'Clio', 108000, 31),
    (625, 'Euroclio', 0, 31),
    (627, 'Laguna', 66600, 31),
    (628, 'Megane', 80572, 31),
    (630, 'Scala', 94237, 31),
    (631, 'Scenic', 73400, 31),
    (632, 'Trafic Panel', 171911, 31),
    (633, 'Wraith', 0, 32),
    (634, '9-2', 0, 48),
    (635, '9-3', 0, 48),
    (636, '90', 0, 48),
    (639, 'Alhambra', 101700, 33),
    (640, 'Cordoba', 82635, 33),
    (641, 'Exeo', 211150, 33),
    (642, 'Forfour', 219000, 34),
    (643, 'B9 Tribeca', 0, 35),
    (644, 'Tribeca', 235850, 35),
    (645, 'Aerio', 62600, 36),
    (646, 'SX4', 134540, 36),
    (647, 'Vitara', 289756, 36),
    (648, 'XL7', 137360, 36),
    (649, '4Runner', 155264, 37),
    (650, 'Matrix', 109200, 37),
    (651, 'Rush', 113750, 37),
    (652, 'Solara', 113700, 37),
    (653, 'Tercel', 0, 37),
    (654, 'Yaris', 143268, 37),
    (655, 'Bora', 124253, 38),
    (656, 'Derby', 63075, 38),
    (657, 'Cabrio', 0, 38),
    (658, 'Caribe', 0, 38),
    (659, 'Golf', 252992, 38),
    (665, 'TLX', 478290, 1),
    (666, 'Spider', 0, 40),
    (667, 'Mirage', 167900, 26),
    (668, 'C30', 171037, 39),
    (672, 'DBS', 0, 49),
    (673, 'DB9', 3859500, 49),
    (674, 'Lagonda', 0, 49),
    (675, 'Vantage', 2720250, 49),
    (676, 'Vanquish', 5580000, 49),
    (677, 'Rapide', 3906000, 49),
    (678, 'Elise', 0, 50),
    (679, 'Exige', 0, 50),
    (680, 'Evora', 0, 50),
    (681, 'MG3', 0, 51),
    (682, 'MG6', 0, 51),
    (683, 'S', 2137587, 52),
    (684, 'X', 2326825, 52),
    (685, '500', 0, 53),
    (686, 'Forte', 270506, 54),
    (687, 'Sorento', 440080, 54),
    (688, 'Sportage', 368219, 54),
    (689, 'Logan', 174524, 31),
    (692, 'Macan', 1010744, 29),
    (693, 'Escalade', 689650, 6),
    (694, 'Silverado', 178660, 7),
    (695, 'Mini', 343512, 55),
    (696, 'Mini S', 323112, 55),
    (697, 'Coupe', 301593, 55),
    (698, 'Convertible', 290934, 55),
    (699, 'Roadster', 313133, 55),
    (700, 'Countryman', 331884, 55),
    (701, 'Paceman', 349017, 55),
    (702, 'John Cooper Works', 0, 55),
    (703, '207', 109263, 28),
    (704, '2008', 286114, 28),
    (705, 'V50', 126000, 39),
    (706, 'C70', 304557, 39),
    (707, 'S40', 149377, 39),
    (708, '488', 0, 11),
    (709, 'Tucson', 343817, 42),
    (710, 'CX5', 321758, 24),
    (711, 'HR-V', 311173, 15),
    (712, 'CX3', 295390, 24),
    (713, 'Clase GLA', 485557, 25),
    (714, 'Clase GLC', 723551, 25),
    (715, 'Clase GLE', 1368918, 25),
    (716, 'AMG GT', 2718345, 25),
    (717, 'Aero', 0, 48),
    (718, 'Ciaz', 216360, 36),
    (719, 'Clase V', 844904, 25),
    (722, 'Up', 163962, 38),
    (723, 'Optima', 360900, 54),
    (724, 'Rio', 223032, 54),
    (725, 'Leaf', 531990, 27),
    (726, 'S3', 0, 2),
    (727, '3', 0, 52),
    (728, 'Twizy', 0, 31),
    (729, 'Soul', 275188, 54),
    (730, 'Volt', 658880, 7),
    (731, 'Figo', 171262, 13),
    (732, 'D20', 169088, 56),
    (733, 'X25', 237345, 56),
    (734, 'Ignis', 197956, 36),
    (735, 'Creta', 189895, 42),
    (737, 'SEI2', 383714, 57),
    (738, 'SEI3', 346922, 57),
    (802, 'Serie 500', 1142796, 58),
    (1264, 'NSX', 3818225, 1),
    (1265, 'Q2', 541153, 2),
    (1266, 'BJ40', 520166, 56),
    (1267, 'Bentayga', 4278000, 3),
    (1268, 'Serie Z', 555130, 4),
    (1269, 'Envision', 597200, 5),
    (1270, 'XT5', 775655, 6),
    (1271, 'CBO', 173000, 46),
    (1272, 'Transit Van', 498596, 13),
    (1273, 'Beat', 167757, 7),
    (1274, 'Bolt EV', 695333, 7),
    (1275, 'Cargo Van', 361027, 7),
    (1276, 'Cavalier', 272971, 7),
    (1277, 'Express Cutaway', 326457, 7),
    (1278, 'Express Van', 439228, 7),
    (1279, 'S-10', 270122, 7),
    (1280, 'Sierra', 580652, 7),
    (1281, 'Silverado 1500', 363866, 7),
    (1282, 'Silverado 2500', 404665, 7),
    (1283, 'Silverado 3500', 402850, 7),
    (1284, 'ACCENT', 240760, 42),
    (1285, 'SANTA FE', 533277, 42),
    (1286, 'QX30', 632983, 16),
    (1287, 'CITYSTAR', 717030, 59),
    (1288, 'F Pace', 1300675, 17),
    (1289, 'XE', 970270, 17),
    (1290, 'NIRO', 452475, 54),
    (1291, 'Discovery Sport', 772785, 20),
    (1292, 'Range Rover Sport', 1326131, 20),
    (1293, 'Continental', 1196750, 21),
    (1294, 'Ghibli', 1320600, 22),
    (1295, 'Cargo Van', 504323, 25),
    (1296, 'Chasis Cabina', 367440, 25),
    (1297, 'Clase GLS', 1801912, 25),
    (1298, 'Clase SLC', 835650, 25),
    (1299, 'Clase SLS', 3415950, 25),
    (1300, 'Crew Cab', 429587, 25),
    (1301, 'Chasis Cabina', 185095, 27),
    (1302, 'Doble Cabina', 223808, 27),
    (1303, 'Frontier', 347004, 27),
    (1304, 'GT-R', 2180600, 27),
    (1305, 'Kicks', 311277, 27),
    (1306, 'Pick Up', 214570, 27),
    (1307, 'Partner Maxi', 221392, 28),
    (1308, 'Captur', 307844, 31),
    (1309, 'Kangoo Express', 175550, 31),
    (1310, 'Twitzy Z.E.', 250300, 31),
    (1311, 'ATECA', 406112, 33),
    (1312, 'BRZ', 470283, 35),
    (1313, 'Hunter', 542000, 60),
    (1314, 'Caddy', 237534, 38),
    (1315, 'Crafter', 426691, 38),
    (1316, 'Crafter Pasajeros', 549187, 38),
    (1317, 'Cross Golf', 277150, 38),
    (1318, 'Jetta Nuevo', 214175, 38),
    (1319, 'Transporter', 332755, 38),
    (1320, 'S90', 1042940, 39),
    (1321, 'Ducato Van', 285908, 12),
    (1322, 'Mobi', 165188, 12),
    (1523, 'Stinger', 647283, 54),
    (1524, 'Ioniq', 438900, 42),
    (1525, 'C-HR', 367400, 37),
    (1526, 'Renegade', 396920, 18),
    (1527, 'Starex', 416400, 42),
    (1528, 'Sedona', 654650, 54),
    (1536, 'Arona', 345150, 33),
    (1537, 'Ram 1500', 453421, 30),
    (1538, 'Ram 2500', 439179, 30),
    (1539, 'Ram 4000', 379308, 30),
    (1540, 'H 100 Wagon', 223850, 9),
    (1541, 'Econoline Wagon', 291950, 13),
    (1542, 'ELF 200', 380933, 43),
    (1543, 'ELF 400', 481755, 43),
    (1544, 'ELF 300', 426500, 43),
    (1545, 'Clubman', 361742, 55),
    (1546, 'GTS', 151950, 9),
    (1547, 'Ram Promaster', 389350, 30),
    (1548, 'Cabrio', 212563, 34),
    (1549, 'Coupé', 181446, 34),
    (1550, 'Vision', 156660, 9),
    (1551, 'Ram 700', 220046, 30),
    (1552, 'ELF 100', 299800, 43),
    (1553, 'GF60', 152850, 10),
    (1554, 'Giulia', 1187400, 40),
    (1555, 'X65', 343880, 56),
    (1556, 'Expert', 403700, 28),
    (1557, 'Expert Van', 469750, 28),
    (1558, 'Traveller', 682200, 28),
    (1559, 'XC40', 684950, 39),
    (1560, 'Stelvio', 1456666, 40),
    (1561, 'Q8', 1449900, 2),
    (1562, 'X35', 288900, 56),
    (1563, 'X2', 652400, 4),
    (1564, 'X7', 1769900, 4),
    (1565, 'XT4', 746500, 6),
    (1566, 'Serie 300', 811452, 58),
    (1567, 'BRV', 333900, 15),
    (1568, 'Insight', 549900, 15),
    (1569, 'QX50', 821233, 16),
    (1570, 'Frison', 364000, 57),
    (1571, 'J4', 214000, 57),
    (1572, 'SEI7', 506500, 57),
    (1573, 'E Pace', 1111564, 17),
    (1574, 'I Pace', 2250375, 17),
    (1575, 'Velar', 1252681, 20),
    (1576, 'Nautilus', 951600, 21),
    (1577, 'Eclipse Cross', 429950, 26),
    (1578, '5008', 661566, 28),
    (1579, 'Rifter', 339900, 28),
    (1580, 'Oroch', 310900, 31),
    (1581, 'Ertiga', 288323, 36),
    (1582, 'Teramont', 788398, 38),
    (1583, 'Kwid', 181566, 31),
    (1734, 'Virtus', 321600, 38),
    (1735, 'MX2', 0, 61),
    (1736, 'MX3', 0, 61),
    (1737, 'CX30', 439900, 24),
    (1738, 'Seltos', 0, 54),
    (1739, 'Onix', 270500, 7),
    (1740, 'T-Cross', 0, 38);