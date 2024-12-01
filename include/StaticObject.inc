// [ Пикапы ]
/* ------------------------- [ Pickup ] ------------------------- */
picAutovokzal[0] = CreatePic(1318, 23, 1792.0505, 1351.4175, 10.6754, 0); // 
picAutovokzal[1] = CreatePic(1318, 23, 780.4370, -321.1627, 1003.2039, 1); // 

// Банк
picBank[0] = CreatePic(1318, 23, 2666.4866, -1606.7810, 1001.9978, -1); // Выход из Банка
picBank[1] = CreatePic(1318, 23, 1835.8016, 2037.7628, 16.9839); // Банк Батырево 
picBank[2] = CreatePic(1318, 23, 2376.6113, -2139.1450, 22.0871); // Банк Южный 

// Паспортный стол
picPass[0] = CreatePic(1318, 23, 2436.5420, -1903.8353, 22.0043, 0); // Вход в Паспортный стол
picPass[1] = CreatePic(1318, 23, 1393.2327, 1552.9470, 139.9732, 10); // Выход из Паспортного стола

// Работа Шахтера
picScahta[0] = CreatePic(1318, 23, 1796.7524, 2291.8381, 15.7158);
picScahta[1] = CreatePic(1318, 23, 2640.9407, 1774.9249, 3425.9968, 5);
//

// Автосалон
picAutoSalon[0] = CreatePic(1318, 23, 2329.2014, -1804.1760, 22.4503); // 
picAutoSalon[1] = CreatePic(1318, 23, 2658.0476, -1920.3359, 2325.0081, 1);
//

/*
picAvtoShkola[0] = CreatePic(1318, 23, 183.9398, 1496.6744, 12.3080);
picAvtoShkola[1] = CreatePic(1318, 23, 211.3831, 1287.7413, 1112.6586, 1);*/

// Парковка для ДПС
picParkingDPS[0] = CreatePic(1318, 23, 199.4923, 1208.4171, 12.0086);
picParkingDPS[1] = CreatePic(1318, 23, 134.0156, 1226.7583, 1000.9933, FRAC_DPS);
//

// Парковка для Армии
picParkingVH[0] = CreatePic(1318, 23, 1776.0192, 1776.4256, 15.3179); // 
picParkingVH[1] = CreatePic(1318, 23, 1783.6821, 1719.5815, 1000.9951, FRAC_VH);
//

// Парковка для ФСБ
picParkingFSB[0] = CreatePic(1318, 23, 1794.6970, 2075.5935, 15.8505); // 
picParkingFSB[1] = CreatePic(1318, 23, 1813.6173, 2061.9607, 1500.9885, FRAC_FSB);
//

/* ------------------------- [ DynamicPickup ] ------------------------- */
// Меню Банка
picBankMenu[0] = CreateDynamicPic(1274, 23, 2672.4060, -1618.8480, 1001.9987);
picBankMenu[1] = CreateDynamicPic(1274, 23, 2668.7700, -1618.8480, 1001.9987);
// 
picPassDoc = CreateDynamicPic(1239, 23, 1381.4387, 1550.6521, 139.9713); // Оформление паспорта

picArendaCar[0] = CreateDynamicPic(1239, 23, 1777.6812, 1328.2765, 9.8410, 0);
picArendaCar[1] = CreateDynamicPic(1239, 23, 2518.0952, -2129.4563, 21.9999, 0);

// Работа Шахтера
picJobMine = CreateDynamicPic(1275, 23, 1763.1213, 2245.7720, 16.1041, 0);
picInfoMine = CreateDynamicPic(1239, 23, 1761.5251, 2248.1284, 16.1055, 0); // Информация о работе
picMineralLoadCar = CreateDynamicPic(854, 23, 1763.6294, 2309.2314, 16.2881, 0); //

// Работа Лесоповал
picJobLesorub = CreateDynamicPic(1275, 23, 2285.0969, 1417.9937, 11.4515, 0); // 
picLesorubInstrument= CreateDynamicPic(341, 23, 2313.7346, 1450.7186, 11.3506, 0); // 
picDerevoSklad= CreateDynamicPic(1463, 23, 2339.5571, 1455.8431, 11.4537, 0);

// Налоги Администрации области
picNaloginAO = CreateDynamicPic(1239, 23, 1313.4730,1177.7131,1701.5000, FRAC_AO); // Налоги
picFamilyAO = CreateDynamicPic(1314, 23, 1337.8157, 1173.2733, 1701.5000, FRAC_AO); // 

// Парковка для ДПС
picParkingCarDPS[0] = CreateDynamicPic(19134, 23, 138.3890, 1219.7859, 1001.2122, FRAC_DPS);
picParkingCarDPS[1] = CreateDynamicPic(19134, 23, 138.3890, 1249.7859, 1001.2122, FRAC_DPS);
picParkingCarDPS[2] = CreateDynamicPic(19134, 23, 195.6048, 1212.6367, 12.2506, 0);
//

// Парковка для Армии
picParkingCarVH[0] = CreateDynamicPic(19134, 23, 1790.6467, 1724.8378, 1001.2410, FRAC_VH);
picParkingCarVH[1] = CreateDynamicPic(19134, 23, 1760.6467, 1724.8378, 1001.2410, FRAC_VH);
picParkingCarVH[2] = CreateDynamicPic(19134, 23, 1772.6388, 1772.2600, 15.5218, 0);
//

// Парковка для ФСБ
picParkingCarFSB[0] = CreateDynamicPic(19134, 23, 1820.6249, 2066.3628, 1501.2100, FRAC_FSB);
picParkingCarFSB[1] = CreateDynamicPic(19134, 23, 1790.1249, 2066.3628, 1501.2100, FRAC_FSB);
picParkingCarFSB[2] = CreateDynamicPic(19134, 23, 1797.9634, 2080.5791, 16.0295, 0);
//

// Автосалон 
picAutoSalonBuy = CreateDynamicPic(1239, 23, 2638.6975, -1909.3057, 2328.1677, 1); // Покупка транспорта
//

picDemorgan[0] = CreatePic(1318, 23, -1765.8430, -2887.5259, 1031.4668, 1); // Выход
picDemorgan[1] = CreateDynamicPic(1239, 23, -1767.1617, -2869.5530, 1031.4751, 1); // Инфа
			

// ================================ [ Объекты ] ========================================= //

// Мост и Шлакбаумы
//Most[0] = CreateObject(2168,2747.34448242,-1142.90002441,21.60000038,0.0,0.0,180.0); // Мост сторона №1
//Most[1] = CreateObject(2168,2747.30004883,-1262.00000000,21.60000038,0.0,0.0,0.0); // Мост сторона №2

Shlak[0] = CreateObject(968, 2754.6743, -1381.1575, 23.3802, 0.0, -0.0, 0.0); // Шлакбаум на мосту №1
Shlak[1] = CreateObject(968, 2740.0195, -1023.6168, 23.4042, 0.0, 0.0, 0.0); // Шлакбаум на мосту №2

GateScahta = CreateObject(976, 1766.3990, 2243.7041, 15.0242, 0.0, -90.0, 180.0);
//

ShlakBank_B = CreateObject(968, 1850.7980, 2034.5994, 15.7245, 0.0, 90.0, 0.0); // Шлакбаум Батырево
ShlakAS = CreateObject(968, 193.0664, 1463.8977, 11.7851, 0.0, -90.0, -102.0); // Шлакбаум Автошколы Арзамас

ShlakAdminZone = CreateObject(968, 2352.4412, -1434.6554, 80.4771, 0.0, -90.0, 90.0); // Админ-зона
GateAdminHouse = CreateObject(980, 2455.5928, -1452.0453, 82.3704, 0.0, 0.0, 90.0); // Ворота Админ дома Толи
/*
ShlakAutoSkola[0] = CreateObject(968, 2282.2363, 1365.6582, 11.2587, 0.0, -90.0, 180.0); // Въезд в Автошколу
ShlakAutoSkola[1] = CreateObject(968, 2284.3655, 1390.3346, 11.2791, 0.0, -90.0, 180.0); // Автодром Автошколы

GateMyHouse = CreateObject(980, -5.9183, -2874.3394, 35.3386, 0.0, 0.0, 0.0); // Ворота моего дома

GateVH = CreateObject(971, 1891.1162, 1720.9730, 18.2651,   0.0, 0.0, -90.0); // Ворота в ВЧ
*/

/* ------------------------- [ DynamicObject ] ------------------------- */

// [ Ворота и шлакбаумы ]
GateZavod = CreateDynamicObject(980, -1063.8147, 2178.3989, 39.8456, 0.0, 0.0, -90.0); // 
SetDynamicObjectMaterial(GateZavod, 0, 7000, "AS_trackpan_tex", "as_track_cylinder", 0x00000000);
SetDynamicObjectMaterial(GateZavod, 1, 7000, "AS_trackpan_tex", "as_track_cylinder", 0x00000000);
SetDynamicObjectMaterial(GateZavod, 3, 7000, "AS_trackpan_tex", "as_track_cylinder", 0x00000000);
SetDynamicObjectMaterial(GateZavod, 5, 7000, "AS_trackpan_tex", "as_track_cylinder", 0x00000000);


ShlakMechanic = CreateDynamicObject(968, 2410.7341, -740.6060, 12.1157, 0.0, -90.0, 180.0); // Шлакбаум для въезда на Штраф-стоянку
GateMechanic[0] = CreateDynamicObject(980, 2476.2942, -763.6030, 14.0767, 0.0, 0.0, 180.0); // Ворота для въезда на Штраф-стоянку
GateMechanic[1] = CreateDynamicObject(980, 2476.1941, -740.2364, 14.0767, 0.0, 0.0, 180.0); // Ворота для сотрудников работы Механики

// Работа шахтера
ShlakScahta = CreateObject(968, 1744.4830, 2274.2385, 15.6521, 0.0, 90.0, 90.0); // Шлакбаум для шахты
/*
DoorsLiftUp[0] = CreateDynamicObject(18757, 2643.3054, 1774.9408, 3502.8611, 0.0, 0.0, 0.0, 5, 5, -1, 300.0, 300.0); // Двери лифта на шахте левая сторона вврех
// 2643.3054, 1776.5728, 3502.8611 // Открытая левая вдерь
DoorsLiftUp[1] = CreateDynamicObject(18756, 2643.3054, 1774.9407, 3502.8611, 0.0, 0.0, 0.0, 5, 5, -1, 300.0, 300.0); // Двери лифта на шахте правая сторона вврех
// 2643.3054, 1773.3087, 3502.8611 // Открытая правая вдерь
DoorsLiftDown[0] = CreateDynamicObject(18757, 2643.3054, 1774.9408, 3426.8533, 0.0, 0.0, 0.0, 5, 5, -1, 300.0, 300.0); // Двери лифта на шахте левая сторона низ
// 2643.3054, 1776.5728, 3426.8533 // Открытая левая вдерь
DoorsLiftDown[1] = CreateDynamicObject(18756, 2643.3054, 1774.9407, 3426.8533, 0.0, 0.0, 0.0, 5, 5, -1, 300.0, 300.0); // Двери лифта на шахте правая сторона низ
// 2643.3054, 1773.3087, 3426.8533 // Открытая правая вдерь
LiftCabin = CreateDynamicObject(18755, 2643.3535, 1774.9407, 3502.8911, 0.0, 0.0, 0.0, 5, 5, -1, 300.0, 300.0); // Кабина лифта 
// 2643.3535, 1774.9407, 3502.8911 // Кабина лифта сверху 
// 2643.3535, 1774.9407, 3426.8882 // Кабина лифта снизу
DoorsLiftAttach[0] = CreateDynamicObject(18757, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 5, 5, -1, 300.0, 300.0);
DoorsLiftAttach[1] = CreateDynamicObject(18756, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 5, 5, -1, 300.0, 300.0);
*/ 

/* ============================================== [ Организации ] ============================================== */
// 1 - АО
// 2 - ППС
ShlakPPS = CreateObject(968, 2579.8154, -2438.6951, 21.6222, 0.0, -90.0, -90.0); // 
// 3 - ДПС
ShlakDPS = CreateObject(968, 127.0617, 1254.6843, 11.8142, 0.0, -90.0, 258.500); // 
GateDPS = CreateObject(975, 158.3769, 1210.2625, 12.6767, 0.0, 0.0, 78.500); //
// 4 - ФСБ
ShlakFSB[0] = CreateObject(968, 1876.8981, 2106.5049, 15.6724, 0.0, -90.0, -90.0); // Парковка для граждан
ShlakFSB[1] = CreateObject(968, 1876.4420, 2126.0066, 15.6724, 0.0, -90.0, -90.0); // Въезд на парковку сотрудников ФСБ
GateFSB = CreateDynamicObject(980, 1827.1215, 2129.5105, 17.6036, 0.0, 0.0, -90.0, 0, 0, -1, 300.0, 300.0); // Ворота на парковку сотрудников ФСБ
SetDynamicObjectMaterial(GateFSB, 0, 7000, "AS_trackpan_tex", "as_track_cylinder", 0x00000000);
SetDynamicObjectMaterial(GateFSB, 1, 7000, "AS_trackpan_tex", "as_track_cylinder", 0x00000000);
SetDynamicObjectMaterial(GateFSB, 3, 7000, "AS_trackpan_tex", "as_track_cylinder", 0x00000000);
SetDynamicObjectMaterial(GateFSB, 5, 7000, "AS_trackpan_tex", "as_track_cylinder", 0x00000000);
// 5 - ВЧ
ShlakSkladVH = CreateObject(968, 1710.0144, 1676.9567, 15.0787, 0.0, -90.0, 180.0); // Вагон на шахте
GateVH[0] = CreateDynamicObject(980, 1891.1333, 1722.0508, 17.4127, 0.0, 0.0, 90.0, 0, 0, -1, 300.0, 300.0); // Ворота
SetDynamicObjectMaterial(GateVH[0], 0, 7000, "AS_trackpan_tex", "as_track_cylinder", 0x00000000);
SetDynamicObjectMaterial(GateVH[0], 1, 7000, "AS_trackpan_tex", "as_track_cylinder", 0x00000000);
SetDynamicObjectMaterial(GateVH[0], 3, 7000, "AS_trackpan_tex", "as_track_cylinder", 0x00000000);
SetDynamicObjectMaterial(GateVH[0], 5, 7000, "AS_trackpan_tex", "as_track_cylinder", 0x00000000);
GateVH[1] = CreateDynamicObject(980, 1653.7750, 1682.6362, 17.1327, 0.0, 0.0, -90.0, 0, 0, -1, 300.0, 300.0); // Ворота 
SetDynamicObjectMaterial(GateVH[1], 0, 7000, "AS_trackpan_tex", "as_track_cylinder", 0x00000000);
SetDynamicObjectMaterial(GateVH[1], 1, 7000, "AS_trackpan_tex", "as_track_cylinder", 0x00000000);
SetDynamicObjectMaterial(GateVH[1], 3, 7000, "AS_trackpan_tex", "as_track_cylinder", 0x00000000);
SetDynamicObjectMaterial(GateVH[1], 5, 7000, "AS_trackpan_tex", "as_track_cylinder", 0x00000000);
DoorVH[0] = CreateDynamicObject(1495, 1892.6487, 1698.9954, 14.7633, 0.0, 0.0, 90.0, 0, 0, -1, 300.0, 300.0); //
DoorVH[1] = CreateDynamicObject(1495, 1664.4875, 1702.4840, 14.3351, 0.0, 0.0, -90.0, 0, 0, -1, 300.0, 300.0); //
// Входв КПП
DoorVH[2] = CreateDynamicObject(1535, 1911.4810, 1716.0179, 15.7321, 0.0, 0.0, -180.0, 0, 0, -1, 300.0, 300.0); //
DoorVH[3] = CreateDynamicObject(1535, 1911.5090, 1710.3090, 15.7321, 0.0, 0.0, 180.0, 0, 0, -1, 300.0, 300.0); //
// 6 - СМП
// 7 - СМИ
// 8 - ОПГ-Б
// 9 - ОПГ-Ю
// 10 - Ч-Мафия
// 11 - Р-Мафия
/* ============================================================================================================= */