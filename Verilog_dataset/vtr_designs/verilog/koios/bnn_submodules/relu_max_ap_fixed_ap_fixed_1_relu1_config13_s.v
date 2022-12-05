
module relu_max_ap_fixed_ap_fixed_1_relu1_config13_s (
        ap_ready,
        data_0_V_read,
        data_1_V_read,
        data_2_V_read,
        data_3_V_read,
        data_4_V_read,
        data_5_V_read,
        data_6_V_read,
        data_7_V_read,
        data_8_V_read,
        data_9_V_read,
        data_10_V_read,
        data_11_V_read,
        data_12_V_read,
        data_13_V_read,
        data_14_V_read,
        data_15_V_read,
        data_16_V_read,
        data_17_V_read,
        data_18_V_read,
        data_19_V_read,
        data_20_V_read,
        data_21_V_read,
        data_22_V_read,
        data_23_V_read,
        data_24_V_read,
        data_25_V_read,
        data_26_V_read,
        data_27_V_read,
        data_28_V_read,
        data_29_V_read,
        data_30_V_read,
        data_31_V_read,
        ap_return_0,
        ap_return_1,
        ap_return_2,
        ap_return_3,
        ap_return_4,
        ap_return_5,
        ap_return_6,
        ap_return_7,
        ap_return_8,
        ap_return_9,
        ap_return_10,
        ap_return_11,
        ap_return_12,
        ap_return_13,
        ap_return_14,
        ap_return_15,
        ap_return_16,
        ap_return_17,
        ap_return_18,
        ap_return_19,
        ap_return_20,
        ap_return_21,
        ap_return_22,
        ap_return_23,
        ap_return_24,
        ap_return_25,
        ap_return_26,
        ap_return_27,
        ap_return_28,
        ap_return_29,
        ap_return_30,
        ap_return_31
);


output   ap_ready;
input  [15:0] data_0_V_read;
input  [15:0] data_1_V_read;
input  [15:0] data_2_V_read;
input  [15:0] data_3_V_read;
input  [15:0] data_4_V_read;
input  [15:0] data_5_V_read;
input  [15:0] data_6_V_read;
input  [15:0] data_7_V_read;
input  [15:0] data_8_V_read;
input  [15:0] data_9_V_read;
input  [15:0] data_10_V_read;
input  [15:0] data_11_V_read;
input  [15:0] data_12_V_read;
input  [15:0] data_13_V_read;
input  [15:0] data_14_V_read;
input  [15:0] data_15_V_read;
input  [15:0] data_16_V_read;
input  [15:0] data_17_V_read;
input  [15:0] data_18_V_read;
input  [15:0] data_19_V_read;
input  [15:0] data_20_V_read;
input  [15:0] data_21_V_read;
input  [15:0] data_22_V_read;
input  [15:0] data_23_V_read;
input  [15:0] data_24_V_read;
input  [15:0] data_25_V_read;
input  [15:0] data_26_V_read;
input  [15:0] data_27_V_read;
input  [15:0] data_28_V_read;
input  [15:0] data_29_V_read;
input  [15:0] data_30_V_read;
input  [15:0] data_31_V_read;
output  [15:0] ap_return_0;
output  [15:0] ap_return_1;
output  [15:0] ap_return_2;
output  [15:0] ap_return_3;
output  [15:0] ap_return_4;
output  [15:0] ap_return_5;
output  [15:0] ap_return_6;
output  [15:0] ap_return_7;
output  [15:0] ap_return_8;
output  [15:0] ap_return_9;
output  [15:0] ap_return_10;
output  [15:0] ap_return_11;
output  [15:0] ap_return_12;
output  [15:0] ap_return_13;
output  [15:0] ap_return_14;
output  [15:0] ap_return_15;
output  [15:0] ap_return_16;
output  [15:0] ap_return_17;
output  [15:0] ap_return_18;
output  [15:0] ap_return_19;
output  [15:0] ap_return_20;
output  [15:0] ap_return_21;
output  [15:0] ap_return_22;
output  [15:0] ap_return_23;
output  [15:0] ap_return_24;
output  [15:0] ap_return_25;
output  [15:0] ap_return_26;
output  [15:0] ap_return_27;
output  [15:0] ap_return_28;
output  [15:0] ap_return_29;
output  [15:0] ap_return_30;
output  [15:0] ap_return_31;

wire   [0:0] tmp_290_fu_302_p3;
wire   [0:0] xor_ln1495_fu_310_p2;
wire   [10:0] tmp_291_fu_316_p3;
wire   [0:0] tmp_289_fu_288_p3;
wire   [0:0] icmp_ln1494_fu_296_p2;
wire   [0:0] or_ln1495_fu_328_p2;
wire   [15:0] zext_ln1495_fu_324_p1;
wire   [0:0] tmp_293_fu_356_p3;
wire   [0:0] xor_ln1495_95_fu_364_p2;
wire   [10:0] tmp_294_fu_370_p3;
wire   [0:0] tmp_292_fu_342_p3;
wire   [0:0] icmp_ln1494_1_fu_350_p2;
wire   [0:0] or_ln1495_95_fu_382_p2;
wire   [15:0] zext_ln1495_95_fu_378_p1;
wire   [0:0] tmp_296_fu_410_p3;
wire   [0:0] xor_ln1495_96_fu_418_p2;
wire   [10:0] tmp_297_fu_424_p3;
wire   [0:0] tmp_295_fu_396_p3;
wire   [0:0] icmp_ln1494_2_fu_404_p2;
wire   [0:0] or_ln1495_96_fu_436_p2;
wire   [15:0] zext_ln1495_96_fu_432_p1;
wire   [0:0] tmp_299_fu_464_p3;
wire   [0:0] xor_ln1495_97_fu_472_p2;
wire   [10:0] tmp_300_fu_478_p3;
wire   [0:0] tmp_298_fu_450_p3;
wire   [0:0] icmp_ln1494_3_fu_458_p2;
wire   [0:0] or_ln1495_97_fu_490_p2;
wire   [15:0] zext_ln1495_97_fu_486_p1;
wire   [0:0] tmp_302_fu_518_p3;
wire   [0:0] xor_ln1495_98_fu_526_p2;
wire   [10:0] tmp_303_fu_532_p3;
wire   [0:0] tmp_301_fu_504_p3;
wire   [0:0] icmp_ln1494_4_fu_512_p2;
wire   [0:0] or_ln1495_98_fu_544_p2;
wire   [15:0] zext_ln1495_98_fu_540_p1;
wire   [0:0] tmp_305_fu_572_p3;
wire   [0:0] xor_ln1495_99_fu_580_p2;
wire   [10:0] tmp_306_fu_586_p3;
wire   [0:0] tmp_304_fu_558_p3;
wire   [0:0] icmp_ln1494_5_fu_566_p2;
wire   [0:0] or_ln1495_99_fu_598_p2;
wire   [15:0] zext_ln1495_99_fu_594_p1;
wire   [0:0] tmp_308_fu_626_p3;
wire   [0:0] xor_ln1495_100_fu_634_p2;
wire   [10:0] tmp_309_fu_640_p3;
wire   [0:0] tmp_307_fu_612_p3;
wire   [0:0] icmp_ln1494_6_fu_620_p2;
wire   [0:0] or_ln1495_100_fu_652_p2;
wire   [15:0] zext_ln1495_100_fu_648_p1;
wire   [0:0] tmp_311_fu_680_p3;
wire   [0:0] xor_ln1495_101_fu_688_p2;
wire   [10:0] tmp_312_fu_694_p3;
wire   [0:0] tmp_310_fu_666_p3;
wire   [0:0] icmp_ln1494_7_fu_674_p2;
wire   [0:0] or_ln1495_101_fu_706_p2;
wire   [15:0] zext_ln1495_101_fu_702_p1;
wire   [0:0] tmp_314_fu_734_p3;
wire   [0:0] xor_ln1495_102_fu_742_p2;
wire   [10:0] tmp_315_fu_748_p3;
wire   [0:0] tmp_313_fu_720_p3;
wire   [0:0] icmp_ln1494_8_fu_728_p2;
wire   [0:0] or_ln1495_102_fu_760_p2;
wire   [15:0] zext_ln1495_102_fu_756_p1;
wire   [0:0] tmp_317_fu_788_p3;
wire   [0:0] xor_ln1495_103_fu_796_p2;
wire   [10:0] tmp_318_fu_802_p3;
wire   [0:0] tmp_316_fu_774_p3;
wire   [0:0] icmp_ln1494_9_fu_782_p2;
wire   [0:0] or_ln1495_103_fu_814_p2;
wire   [15:0] zext_ln1495_103_fu_810_p1;
wire   [0:0] tmp_320_fu_842_p3;
wire   [0:0] xor_ln1495_104_fu_850_p2;
wire   [10:0] tmp_321_fu_856_p3;
wire   [0:0] tmp_319_fu_828_p3;
wire   [0:0] icmp_ln1494_10_fu_836_p2;
wire   [0:0] or_ln1495_104_fu_868_p2;
wire   [15:0] zext_ln1495_104_fu_864_p1;
wire   [0:0] tmp_323_fu_896_p3;
wire   [0:0] xor_ln1495_105_fu_904_p2;
wire   [10:0] tmp_324_fu_910_p3;
wire   [0:0] tmp_322_fu_882_p3;
wire   [0:0] icmp_ln1494_11_fu_890_p2;
wire   [0:0] or_ln1495_105_fu_922_p2;
wire   [15:0] zext_ln1495_105_fu_918_p1;
wire   [0:0] tmp_326_fu_950_p3;
wire   [0:0] xor_ln1495_106_fu_958_p2;
wire   [10:0] tmp_327_fu_964_p3;
wire   [0:0] tmp_325_fu_936_p3;
wire   [0:0] icmp_ln1494_12_fu_944_p2;
wire   [0:0] or_ln1495_106_fu_976_p2;
wire   [15:0] zext_ln1495_106_fu_972_p1;
wire   [0:0] tmp_329_fu_1004_p3;
wire   [0:0] xor_ln1495_107_fu_1012_p2;
wire   [10:0] tmp_330_fu_1018_p3;
wire   [0:0] tmp_328_fu_990_p3;
wire   [0:0] icmp_ln1494_13_fu_998_p2;
wire   [0:0] or_ln1495_107_fu_1030_p2;
wire   [15:0] zext_ln1495_107_fu_1026_p1;
wire   [0:0] tmp_332_fu_1058_p3;
wire   [0:0] xor_ln1495_108_fu_1066_p2;
wire   [10:0] tmp_333_fu_1072_p3;
wire   [0:0] tmp_331_fu_1044_p3;
wire   [0:0] icmp_ln1494_14_fu_1052_p2;
wire   [0:0] or_ln1495_108_fu_1084_p2;
wire   [15:0] zext_ln1495_108_fu_1080_p1;
wire   [0:0] tmp_335_fu_1112_p3;
wire   [0:0] xor_ln1495_109_fu_1120_p2;
wire   [10:0] tmp_336_fu_1126_p3;
wire   [0:0] tmp_334_fu_1098_p3;
wire   [0:0] icmp_ln1494_15_fu_1106_p2;
wire   [0:0] or_ln1495_109_fu_1138_p2;
wire   [15:0] zext_ln1495_109_fu_1134_p1;
wire   [0:0] tmp_338_fu_1166_p3;
wire   [0:0] xor_ln1495_110_fu_1174_p2;
wire   [10:0] tmp_339_fu_1180_p3;
wire   [0:0] tmp_337_fu_1152_p3;
wire   [0:0] icmp_ln1494_16_fu_1160_p2;
wire   [0:0] or_ln1495_110_fu_1192_p2;
wire   [15:0] zext_ln1495_110_fu_1188_p1;
wire   [0:0] tmp_341_fu_1220_p3;
wire   [0:0] xor_ln1495_111_fu_1228_p2;
wire   [10:0] tmp_342_fu_1234_p3;
wire   [0:0] tmp_340_fu_1206_p3;
wire   [0:0] icmp_ln1494_17_fu_1214_p2;
wire   [0:0] or_ln1495_111_fu_1246_p2;
wire   [15:0] zext_ln1495_111_fu_1242_p1;
wire   [0:0] tmp_344_fu_1274_p3;
wire   [0:0] xor_ln1495_112_fu_1282_p2;
wire   [10:0] tmp_345_fu_1288_p3;
wire   [0:0] tmp_343_fu_1260_p3;
wire   [0:0] icmp_ln1494_18_fu_1268_p2;
wire   [0:0] or_ln1495_112_fu_1300_p2;
wire   [15:0] zext_ln1495_112_fu_1296_p1;
wire   [0:0] tmp_347_fu_1328_p3;
wire   [0:0] xor_ln1495_113_fu_1336_p2;
wire   [10:0] tmp_348_fu_1342_p3;
wire   [0:0] tmp_346_fu_1314_p3;
wire   [0:0] icmp_ln1494_19_fu_1322_p2;
wire   [0:0] or_ln1495_113_fu_1354_p2;
wire   [15:0] zext_ln1495_113_fu_1350_p1;
wire   [0:0] tmp_350_fu_1382_p3;
wire   [0:0] xor_ln1495_114_fu_1390_p2;
wire   [10:0] tmp_351_fu_1396_p3;
wire   [0:0] tmp_349_fu_1368_p3;
wire   [0:0] icmp_ln1494_20_fu_1376_p2;
wire   [0:0] or_ln1495_114_fu_1408_p2;
wire   [15:0] zext_ln1495_114_fu_1404_p1;
wire   [0:0] tmp_353_fu_1436_p3;
wire   [0:0] xor_ln1495_115_fu_1444_p2;
wire   [10:0] tmp_354_fu_1450_p3;
wire   [0:0] tmp_352_fu_1422_p3;
wire   [0:0] icmp_ln1494_21_fu_1430_p2;
wire   [0:0] or_ln1495_115_fu_1462_p2;
wire   [15:0] zext_ln1495_115_fu_1458_p1;
wire   [0:0] tmp_356_fu_1490_p3;
wire   [0:0] xor_ln1495_116_fu_1498_p2;
wire   [10:0] tmp_357_fu_1504_p3;
wire   [0:0] tmp_355_fu_1476_p3;
wire   [0:0] icmp_ln1494_22_fu_1484_p2;
wire   [0:0] or_ln1495_116_fu_1516_p2;
wire   [15:0] zext_ln1495_116_fu_1512_p1;
wire   [0:0] tmp_359_fu_1544_p3;
wire   [0:0] xor_ln1495_117_fu_1552_p2;
wire   [10:0] tmp_360_fu_1558_p3;
wire   [0:0] tmp_358_fu_1530_p3;
wire   [0:0] icmp_ln1494_23_fu_1538_p2;
wire   [0:0] or_ln1495_117_fu_1570_p2;
wire   [15:0] zext_ln1495_117_fu_1566_p1;
wire   [0:0] tmp_362_fu_1598_p3;
wire   [0:0] xor_ln1495_118_fu_1606_p2;
wire   [10:0] tmp_363_fu_1612_p3;
wire   [0:0] tmp_361_fu_1584_p3;
wire   [0:0] icmp_ln1494_24_fu_1592_p2;
wire   [0:0] or_ln1495_118_fu_1624_p2;
wire   [15:0] zext_ln1495_118_fu_1620_p1;
wire   [0:0] tmp_365_fu_1652_p3;
wire   [0:0] xor_ln1495_119_fu_1660_p2;
wire   [10:0] tmp_366_fu_1666_p3;
wire   [0:0] tmp_364_fu_1638_p3;
wire   [0:0] icmp_ln1494_25_fu_1646_p2;
wire   [0:0] or_ln1495_119_fu_1678_p2;
wire   [15:0] zext_ln1495_119_fu_1674_p1;
wire   [0:0] tmp_368_fu_1706_p3;
wire   [0:0] xor_ln1495_120_fu_1714_p2;
wire   [10:0] tmp_369_fu_1720_p3;
wire   [0:0] tmp_367_fu_1692_p3;
wire   [0:0] icmp_ln1494_26_fu_1700_p2;
wire   [0:0] or_ln1495_120_fu_1732_p2;
wire   [15:0] zext_ln1495_120_fu_1728_p1;
wire   [0:0] tmp_371_fu_1760_p3;
wire   [0:0] xor_ln1495_121_fu_1768_p2;
wire   [10:0] tmp_372_fu_1774_p3;
wire   [0:0] tmp_370_fu_1746_p3;
wire   [0:0] icmp_ln1494_27_fu_1754_p2;
wire   [0:0] or_ln1495_121_fu_1786_p2;
wire   [15:0] zext_ln1495_121_fu_1782_p1;
wire   [0:0] tmp_374_fu_1814_p3;
wire   [0:0] xor_ln1495_122_fu_1822_p2;
wire   [10:0] tmp_375_fu_1828_p3;
wire   [0:0] tmp_373_fu_1800_p3;
wire   [0:0] icmp_ln1494_28_fu_1808_p2;
wire   [0:0] or_ln1495_122_fu_1840_p2;
wire   [15:0] zext_ln1495_122_fu_1836_p1;
wire   [0:0] tmp_377_fu_1868_p3;
wire   [0:0] xor_ln1495_123_fu_1876_p2;
wire   [10:0] tmp_378_fu_1882_p3;
wire   [0:0] tmp_376_fu_1854_p3;
wire   [0:0] icmp_ln1494_29_fu_1862_p2;
wire   [0:0] or_ln1495_123_fu_1894_p2;
wire   [15:0] zext_ln1495_123_fu_1890_p1;
wire   [0:0] tmp_380_fu_1922_p3;
wire   [0:0] xor_ln1495_124_fu_1930_p2;
wire   [10:0] tmp_381_fu_1936_p3;
wire   [0:0] tmp_379_fu_1908_p3;
wire   [0:0] icmp_ln1494_30_fu_1916_p2;
wire   [0:0] or_ln1495_124_fu_1948_p2;
wire   [15:0] zext_ln1495_124_fu_1944_p1;
wire   [0:0] tmp_383_fu_1976_p3;
wire   [0:0] xor_ln1495_125_fu_1984_p2;
wire   [10:0] tmp_384_fu_1990_p3;
wire   [0:0] tmp_382_fu_1962_p3;
wire   [0:0] icmp_ln1494_31_fu_1970_p2;
wire   [0:0] or_ln1495_125_fu_2002_p2;
wire   [15:0] zext_ln1495_125_fu_1998_p1;
wire   [15:0] select_ln1495_fu_334_p3;
wire   [15:0] select_ln1495_95_fu_388_p3;
wire   [15:0] select_ln1495_96_fu_442_p3;
wire   [15:0] select_ln1495_97_fu_496_p3;
wire   [15:0] select_ln1495_98_fu_550_p3;
wire   [15:0] select_ln1495_99_fu_604_p3;
wire   [15:0] select_ln1495_100_fu_658_p3;
wire   [15:0] select_ln1495_101_fu_712_p3;
wire   [15:0] select_ln1495_102_fu_766_p3;
wire   [15:0] select_ln1495_103_fu_820_p3;
wire   [15:0] select_ln1495_104_fu_874_p3;
wire   [15:0] select_ln1495_105_fu_928_p3;
wire   [15:0] select_ln1495_106_fu_982_p3;
wire   [15:0] select_ln1495_107_fu_1036_p3;
wire   [15:0] select_ln1495_108_fu_1090_p3;
wire   [15:0] select_ln1495_109_fu_1144_p3;
wire   [15:0] select_ln1495_110_fu_1198_p3;
wire   [15:0] select_ln1495_111_fu_1252_p3;
wire   [15:0] select_ln1495_112_fu_1306_p3;
wire   [15:0] select_ln1495_113_fu_1360_p3;
wire   [15:0] select_ln1495_114_fu_1414_p3;
wire   [15:0] select_ln1495_115_fu_1468_p3;
wire   [15:0] select_ln1495_116_fu_1522_p3;
wire   [15:0] select_ln1495_117_fu_1576_p3;
wire   [15:0] select_ln1495_118_fu_1630_p3;
wire   [15:0] select_ln1495_119_fu_1684_p3;
wire   [15:0] select_ln1495_120_fu_1738_p3;
wire   [15:0] select_ln1495_121_fu_1792_p3;
wire   [15:0] select_ln1495_122_fu_1846_p3;
wire   [15:0] select_ln1495_123_fu_1900_p3;
wire   [15:0] select_ln1495_124_fu_1954_p3;
wire   [15:0] select_ln1495_125_fu_2008_p3;

assign ap_ready = 1'b1;

assign ap_return_0 = select_ln1495_fu_334_p3;

assign ap_return_1 = select_ln1495_95_fu_388_p3;

assign ap_return_10 = select_ln1495_104_fu_874_p3;

assign ap_return_11 = select_ln1495_105_fu_928_p3;

assign ap_return_12 = select_ln1495_106_fu_982_p3;

assign ap_return_13 = select_ln1495_107_fu_1036_p3;

assign ap_return_14 = select_ln1495_108_fu_1090_p3;

assign ap_return_15 = select_ln1495_109_fu_1144_p3;

assign ap_return_16 = select_ln1495_110_fu_1198_p3;

assign ap_return_17 = select_ln1495_111_fu_1252_p3;

assign ap_return_18 = select_ln1495_112_fu_1306_p3;

assign ap_return_19 = select_ln1495_113_fu_1360_p3;

assign ap_return_2 = select_ln1495_96_fu_442_p3;

assign ap_return_20 = select_ln1495_114_fu_1414_p3;

assign ap_return_21 = select_ln1495_115_fu_1468_p3;

assign ap_return_22 = select_ln1495_116_fu_1522_p3;

assign ap_return_23 = select_ln1495_117_fu_1576_p3;

assign ap_return_24 = select_ln1495_118_fu_1630_p3;

assign ap_return_25 = select_ln1495_119_fu_1684_p3;

assign ap_return_26 = select_ln1495_120_fu_1738_p3;

assign ap_return_27 = select_ln1495_121_fu_1792_p3;

assign ap_return_28 = select_ln1495_122_fu_1846_p3;

assign ap_return_29 = select_ln1495_123_fu_1900_p3;

assign ap_return_3 = select_ln1495_97_fu_496_p3;

assign ap_return_30 = select_ln1495_124_fu_1954_p3;

assign ap_return_31 = select_ln1495_125_fu_2008_p3;

assign ap_return_4 = select_ln1495_98_fu_550_p3;

assign ap_return_5 = select_ln1495_99_fu_604_p3;

assign ap_return_6 = select_ln1495_100_fu_658_p3;

assign ap_return_7 = select_ln1495_101_fu_712_p3;

assign ap_return_8 = select_ln1495_102_fu_766_p3;

assign ap_return_9 = select_ln1495_103_fu_820_p3;

assign icmp_ln1494_10_fu_836_p2 = (((data_10_V_read) > (16'd1024)) ? 1'b1 : 1'b0);

assign icmp_ln1494_11_fu_890_p2 = (((data_11_V_read) > (16'd1024)) ? 1'b1 : 1'b0);

assign icmp_ln1494_12_fu_944_p2 = (((data_12_V_read) > (16'd1024)) ? 1'b1 : 1'b0);

assign icmp_ln1494_13_fu_998_p2 = (((data_13_V_read) > (16'd1024)) ? 1'b1 : 1'b0);

assign icmp_ln1494_14_fu_1052_p2 = (((data_14_V_read) > (16'd1024)) ? 1'b1 : 1'b0);

assign icmp_ln1494_15_fu_1106_p2 = (((data_15_V_read) > (16'd1024)) ? 1'b1 : 1'b0);

assign icmp_ln1494_16_fu_1160_p2 = (((data_16_V_read) > (16'd1024)) ? 1'b1 : 1'b0);

assign icmp_ln1494_17_fu_1214_p2 = (((data_17_V_read) > (16'd1024)) ? 1'b1 : 1'b0);

assign icmp_ln1494_18_fu_1268_p2 = (((data_18_V_read) > (16'd1024)) ? 1'b1 : 1'b0);

assign icmp_ln1494_19_fu_1322_p2 = (((data_19_V_read) > (16'd1024)) ? 1'b1 : 1'b0);

assign icmp_ln1494_1_fu_350_p2 = (((data_1_V_read) > (16'd1024)) ? 1'b1 : 1'b0);

assign icmp_ln1494_20_fu_1376_p2 = (((data_20_V_read) > (16'd1024)) ? 1'b1 : 1'b0);

assign icmp_ln1494_21_fu_1430_p2 = (((data_21_V_read) > (16'd1024)) ? 1'b1 : 1'b0);

assign icmp_ln1494_22_fu_1484_p2 = (((data_22_V_read) > (16'd1024)) ? 1'b1 : 1'b0);

assign icmp_ln1494_23_fu_1538_p2 = (((data_23_V_read) > (16'd1024)) ? 1'b1 : 1'b0);

assign icmp_ln1494_24_fu_1592_p2 = (((data_24_V_read) > (16'd1024)) ? 1'b1 : 1'b0);

assign icmp_ln1494_25_fu_1646_p2 = (((data_25_V_read) > (16'd1024)) ? 1'b1 : 1'b0);

assign icmp_ln1494_26_fu_1700_p2 = (((data_26_V_read) > (16'd1024)) ? 1'b1 : 1'b0);

assign icmp_ln1494_27_fu_1754_p2 = (((data_27_V_read) > (16'd1024)) ? 1'b1 : 1'b0);

assign icmp_ln1494_28_fu_1808_p2 = (((data_28_V_read) > (16'd1024)) ? 1'b1 : 1'b0);

assign icmp_ln1494_29_fu_1862_p2 = (((data_29_V_read) > (16'd1024)) ? 1'b1 : 1'b0);

assign icmp_ln1494_2_fu_404_p2 = (((data_2_V_read) > (16'd1024)) ? 1'b1 : 1'b0);

assign icmp_ln1494_30_fu_1916_p2 = (((data_30_V_read) > (16'd1024)) ? 1'b1 : 1'b0);

assign icmp_ln1494_31_fu_1970_p2 = (((data_31_V_read) > (16'd1024)) ? 1'b1 : 1'b0);

assign icmp_ln1494_3_fu_458_p2 = (((data_3_V_read) > (16'd1024)) ? 1'b1 : 1'b0);

assign icmp_ln1494_4_fu_512_p2 = (((data_4_V_read) > (16'd1024)) ? 1'b1 : 1'b0);

assign icmp_ln1494_5_fu_566_p2 = (((data_5_V_read) > (16'd1024)) ? 1'b1 : 1'b0);

assign icmp_ln1494_6_fu_620_p2 = (((data_6_V_read) > (16'd1024)) ? 1'b1 : 1'b0);

assign icmp_ln1494_7_fu_674_p2 = (((data_7_V_read) > (16'd1024)) ? 1'b1 : 1'b0);

assign icmp_ln1494_8_fu_728_p2 = (((data_8_V_read) > (16'd1024)) ? 1'b1 : 1'b0);

assign icmp_ln1494_9_fu_782_p2 = (((data_9_V_read) > (16'd1024)) ? 1'b1 : 1'b0);

assign icmp_ln1494_fu_296_p2 = (((data_0_V_read) > (16'd1024)) ? 1'b1 : 1'b0);

assign or_ln1495_100_fu_652_p2 = (tmp_307_fu_612_p3 | icmp_ln1494_6_fu_620_p2);

assign or_ln1495_101_fu_706_p2 = (tmp_310_fu_666_p3 | icmp_ln1494_7_fu_674_p2);

assign or_ln1495_102_fu_760_p2 = (tmp_313_fu_720_p3 | icmp_ln1494_8_fu_728_p2);

assign or_ln1495_103_fu_814_p2 = (tmp_316_fu_774_p3 | icmp_ln1494_9_fu_782_p2);

assign or_ln1495_104_fu_868_p2 = (tmp_319_fu_828_p3 | icmp_ln1494_10_fu_836_p2);

assign or_ln1495_105_fu_922_p2 = (tmp_322_fu_882_p3 | icmp_ln1494_11_fu_890_p2);

assign or_ln1495_106_fu_976_p2 = (tmp_325_fu_936_p3 | icmp_ln1494_12_fu_944_p2);

assign or_ln1495_107_fu_1030_p2 = (tmp_328_fu_990_p3 | icmp_ln1494_13_fu_998_p2);

assign or_ln1495_108_fu_1084_p2 = (tmp_331_fu_1044_p3 | icmp_ln1494_14_fu_1052_p2);

assign or_ln1495_109_fu_1138_p2 = (tmp_334_fu_1098_p3 | icmp_ln1494_15_fu_1106_p2);

assign or_ln1495_110_fu_1192_p2 = (tmp_337_fu_1152_p3 | icmp_ln1494_16_fu_1160_p2);

assign or_ln1495_111_fu_1246_p2 = (tmp_340_fu_1206_p3 | icmp_ln1494_17_fu_1214_p2);

assign or_ln1495_112_fu_1300_p2 = (tmp_343_fu_1260_p3 | icmp_ln1494_18_fu_1268_p2);

assign or_ln1495_113_fu_1354_p2 = (tmp_346_fu_1314_p3 | icmp_ln1494_19_fu_1322_p2);

assign or_ln1495_114_fu_1408_p2 = (tmp_349_fu_1368_p3 | icmp_ln1494_20_fu_1376_p2);

assign or_ln1495_115_fu_1462_p2 = (tmp_352_fu_1422_p3 | icmp_ln1494_21_fu_1430_p2);

assign or_ln1495_116_fu_1516_p2 = (tmp_355_fu_1476_p3 | icmp_ln1494_22_fu_1484_p2);

assign or_ln1495_117_fu_1570_p2 = (tmp_358_fu_1530_p3 | icmp_ln1494_23_fu_1538_p2);

assign or_ln1495_118_fu_1624_p2 = (tmp_361_fu_1584_p3 | icmp_ln1494_24_fu_1592_p2);

assign or_ln1495_119_fu_1678_p2 = (tmp_364_fu_1638_p3 | icmp_ln1494_25_fu_1646_p2);

assign or_ln1495_120_fu_1732_p2 = (tmp_367_fu_1692_p3 | icmp_ln1494_26_fu_1700_p2);

assign or_ln1495_121_fu_1786_p2 = (tmp_370_fu_1746_p3 | icmp_ln1494_27_fu_1754_p2);

assign or_ln1495_122_fu_1840_p2 = (tmp_373_fu_1800_p3 | icmp_ln1494_28_fu_1808_p2);

assign or_ln1495_123_fu_1894_p2 = (tmp_376_fu_1854_p3 | icmp_ln1494_29_fu_1862_p2);

assign or_ln1495_124_fu_1948_p2 = (tmp_379_fu_1908_p3 | icmp_ln1494_30_fu_1916_p2);

assign or_ln1495_125_fu_2002_p2 = (tmp_382_fu_1962_p3 | icmp_ln1494_31_fu_1970_p2);

assign or_ln1495_95_fu_382_p2 = (tmp_292_fu_342_p3 | icmp_ln1494_1_fu_350_p2);

assign or_ln1495_96_fu_436_p2 = (tmp_295_fu_396_p3 | icmp_ln1494_2_fu_404_p2);

assign or_ln1495_97_fu_490_p2 = (tmp_298_fu_450_p3 | icmp_ln1494_3_fu_458_p2);

assign or_ln1495_98_fu_544_p2 = (tmp_301_fu_504_p3 | icmp_ln1494_4_fu_512_p2);

assign or_ln1495_99_fu_598_p2 = (tmp_304_fu_558_p3 | icmp_ln1494_5_fu_566_p2);

assign or_ln1495_fu_328_p2 = (tmp_289_fu_288_p3 | icmp_ln1494_fu_296_p2);

assign select_ln1495_100_fu_658_p3 = ((or_ln1495_100_fu_652_p2[0:0] == 1'b1) ? zext_ln1495_100_fu_648_p1 : data_6_V_read);

assign select_ln1495_101_fu_712_p3 = ((or_ln1495_101_fu_706_p2[0:0] == 1'b1) ? zext_ln1495_101_fu_702_p1 : data_7_V_read);

assign select_ln1495_102_fu_766_p3 = ((or_ln1495_102_fu_760_p2[0:0] == 1'b1) ? zext_ln1495_102_fu_756_p1 : data_8_V_read);

assign select_ln1495_103_fu_820_p3 = ((or_ln1495_103_fu_814_p2[0:0] == 1'b1) ? zext_ln1495_103_fu_810_p1 : data_9_V_read);

assign select_ln1495_104_fu_874_p3 = ((or_ln1495_104_fu_868_p2[0:0] == 1'b1) ? zext_ln1495_104_fu_864_p1 : data_10_V_read);

assign select_ln1495_105_fu_928_p3 = ((or_ln1495_105_fu_922_p2[0:0] == 1'b1) ? zext_ln1495_105_fu_918_p1 : data_11_V_read);

assign select_ln1495_106_fu_982_p3 = ((or_ln1495_106_fu_976_p2[0:0] == 1'b1) ? zext_ln1495_106_fu_972_p1 : data_12_V_read);

assign select_ln1495_107_fu_1036_p3 = ((or_ln1495_107_fu_1030_p2[0:0] == 1'b1) ? zext_ln1495_107_fu_1026_p1 : data_13_V_read);

assign select_ln1495_108_fu_1090_p3 = ((or_ln1495_108_fu_1084_p2[0:0] == 1'b1) ? zext_ln1495_108_fu_1080_p1 : data_14_V_read);

assign select_ln1495_109_fu_1144_p3 = ((or_ln1495_109_fu_1138_p2[0:0] == 1'b1) ? zext_ln1495_109_fu_1134_p1 : data_15_V_read);

assign select_ln1495_110_fu_1198_p3 = ((or_ln1495_110_fu_1192_p2[0:0] == 1'b1) ? zext_ln1495_110_fu_1188_p1 : data_16_V_read);

assign select_ln1495_111_fu_1252_p3 = ((or_ln1495_111_fu_1246_p2[0:0] == 1'b1) ? zext_ln1495_111_fu_1242_p1 : data_17_V_read);

assign select_ln1495_112_fu_1306_p3 = ((or_ln1495_112_fu_1300_p2[0:0] == 1'b1) ? zext_ln1495_112_fu_1296_p1 : data_18_V_read);

assign select_ln1495_113_fu_1360_p3 = ((or_ln1495_113_fu_1354_p2[0:0] == 1'b1) ? zext_ln1495_113_fu_1350_p1 : data_19_V_read);

assign select_ln1495_114_fu_1414_p3 = ((or_ln1495_114_fu_1408_p2[0:0] == 1'b1) ? zext_ln1495_114_fu_1404_p1 : data_20_V_read);

assign select_ln1495_115_fu_1468_p3 = ((or_ln1495_115_fu_1462_p2[0:0] == 1'b1) ? zext_ln1495_115_fu_1458_p1 : data_21_V_read);

assign select_ln1495_116_fu_1522_p3 = ((or_ln1495_116_fu_1516_p2[0:0] == 1'b1) ? zext_ln1495_116_fu_1512_p1 : data_22_V_read);

assign select_ln1495_117_fu_1576_p3 = ((or_ln1495_117_fu_1570_p2[0:0] == 1'b1) ? zext_ln1495_117_fu_1566_p1 : data_23_V_read);

assign select_ln1495_118_fu_1630_p3 = ((or_ln1495_118_fu_1624_p2[0:0] == 1'b1) ? zext_ln1495_118_fu_1620_p1 : data_24_V_read);

assign select_ln1495_119_fu_1684_p3 = ((or_ln1495_119_fu_1678_p2[0:0] == 1'b1) ? zext_ln1495_119_fu_1674_p1 : data_25_V_read);

assign select_ln1495_120_fu_1738_p3 = ((or_ln1495_120_fu_1732_p2[0:0] == 1'b1) ? zext_ln1495_120_fu_1728_p1 : data_26_V_read);

assign select_ln1495_121_fu_1792_p3 = ((or_ln1495_121_fu_1786_p2[0:0] == 1'b1) ? zext_ln1495_121_fu_1782_p1 : data_27_V_read);

assign select_ln1495_122_fu_1846_p3 = ((or_ln1495_122_fu_1840_p2[0:0] == 1'b1) ? zext_ln1495_122_fu_1836_p1 : data_28_V_read);

assign select_ln1495_123_fu_1900_p3 = ((or_ln1495_123_fu_1894_p2[0:0] == 1'b1) ? zext_ln1495_123_fu_1890_p1 : data_29_V_read);

assign select_ln1495_124_fu_1954_p3 = ((or_ln1495_124_fu_1948_p2[0:0] == 1'b1) ? zext_ln1495_124_fu_1944_p1 : data_30_V_read);

assign select_ln1495_125_fu_2008_p3 = ((or_ln1495_125_fu_2002_p2[0:0] == 1'b1) ? zext_ln1495_125_fu_1998_p1 : data_31_V_read);

assign select_ln1495_95_fu_388_p3 = ((or_ln1495_95_fu_382_p2[0:0] == 1'b1) ? zext_ln1495_95_fu_378_p1 : data_1_V_read);

assign select_ln1495_96_fu_442_p3 = ((or_ln1495_96_fu_436_p2[0:0] == 1'b1) ? zext_ln1495_96_fu_432_p1 : data_2_V_read);

assign select_ln1495_97_fu_496_p3 = ((or_ln1495_97_fu_490_p2[0:0] == 1'b1) ? zext_ln1495_97_fu_486_p1 : data_3_V_read);

assign select_ln1495_98_fu_550_p3 = ((or_ln1495_98_fu_544_p2[0:0] == 1'b1) ? zext_ln1495_98_fu_540_p1 : data_4_V_read);

assign select_ln1495_99_fu_604_p3 = ((or_ln1495_99_fu_598_p2[0:0] == 1'b1) ? zext_ln1495_99_fu_594_p1 : data_5_V_read);

assign select_ln1495_fu_334_p3 = ((or_ln1495_fu_328_p2[0:0] == 1'b1) ? zext_ln1495_fu_324_p1 : data_0_V_read);

assign tmp_289_fu_288_p3 = data_0_V_read[32'd15];

assign tmp_290_fu_302_p3 = data_0_V_read[32'd15];

assign tmp_291_fu_316_p3 = {{xor_ln1495_fu_310_p2}, {10'd0}};

assign tmp_292_fu_342_p3 = data_1_V_read[32'd15];

assign tmp_293_fu_356_p3 = data_1_V_read[32'd15];

assign tmp_294_fu_370_p3 = {{xor_ln1495_95_fu_364_p2}, {10'd0}};

assign tmp_295_fu_396_p3 = data_2_V_read[32'd15];

assign tmp_296_fu_410_p3 = data_2_V_read[32'd15];

assign tmp_297_fu_424_p3 = {{xor_ln1495_96_fu_418_p2}, {10'd0}};

assign tmp_298_fu_450_p3 = data_3_V_read[32'd15];

assign tmp_299_fu_464_p3 = data_3_V_read[32'd15];

assign tmp_300_fu_478_p3 = {{xor_ln1495_97_fu_472_p2}, {10'd0}};

assign tmp_301_fu_504_p3 = data_4_V_read[32'd15];

assign tmp_302_fu_518_p3 = data_4_V_read[32'd15];

assign tmp_303_fu_532_p3 = {{xor_ln1495_98_fu_526_p2}, {10'd0}};

assign tmp_304_fu_558_p3 = data_5_V_read[32'd15];

assign tmp_305_fu_572_p3 = data_5_V_read[32'd15];

assign tmp_306_fu_586_p3 = {{xor_ln1495_99_fu_580_p2}, {10'd0}};

assign tmp_307_fu_612_p3 = data_6_V_read[32'd15];

assign tmp_308_fu_626_p3 = data_6_V_read[32'd15];

assign tmp_309_fu_640_p3 = {{xor_ln1495_100_fu_634_p2}, {10'd0}};

assign tmp_310_fu_666_p3 = data_7_V_read[32'd15];

assign tmp_311_fu_680_p3 = data_7_V_read[32'd15];

assign tmp_312_fu_694_p3 = {{xor_ln1495_101_fu_688_p2}, {10'd0}};

assign tmp_313_fu_720_p3 = data_8_V_read[32'd15];

assign tmp_314_fu_734_p3 = data_8_V_read[32'd15];

assign tmp_315_fu_748_p3 = {{xor_ln1495_102_fu_742_p2}, {10'd0}};

assign tmp_316_fu_774_p3 = data_9_V_read[32'd15];

assign tmp_317_fu_788_p3 = data_9_V_read[32'd15];

assign tmp_318_fu_802_p3 = {{xor_ln1495_103_fu_796_p2}, {10'd0}};

assign tmp_319_fu_828_p3 = data_10_V_read[32'd15];

assign tmp_320_fu_842_p3 = data_10_V_read[32'd15];

assign tmp_321_fu_856_p3 = {{xor_ln1495_104_fu_850_p2}, {10'd0}};

assign tmp_322_fu_882_p3 = data_11_V_read[32'd15];

assign tmp_323_fu_896_p3 = data_11_V_read[32'd15];

assign tmp_324_fu_910_p3 = {{xor_ln1495_105_fu_904_p2}, {10'd0}};

assign tmp_325_fu_936_p3 = data_12_V_read[32'd15];

assign tmp_326_fu_950_p3 = data_12_V_read[32'd15];

assign tmp_327_fu_964_p3 = {{xor_ln1495_106_fu_958_p2}, {10'd0}};

assign tmp_328_fu_990_p3 = data_13_V_read[32'd15];

assign tmp_329_fu_1004_p3 = data_13_V_read[32'd15];

assign tmp_330_fu_1018_p3 = {{xor_ln1495_107_fu_1012_p2}, {10'd0}};

assign tmp_331_fu_1044_p3 = data_14_V_read[32'd15];

assign tmp_332_fu_1058_p3 = data_14_V_read[32'd15];

assign tmp_333_fu_1072_p3 = {{xor_ln1495_108_fu_1066_p2}, {10'd0}};

assign tmp_334_fu_1098_p3 = data_15_V_read[32'd15];

assign tmp_335_fu_1112_p3 = data_15_V_read[32'd15];

assign tmp_336_fu_1126_p3 = {{xor_ln1495_109_fu_1120_p2}, {10'd0}};

assign tmp_337_fu_1152_p3 = data_16_V_read[32'd15];

assign tmp_338_fu_1166_p3 = data_16_V_read[32'd15];

assign tmp_339_fu_1180_p3 = {{xor_ln1495_110_fu_1174_p2}, {10'd0}};

assign tmp_340_fu_1206_p3 = data_17_V_read[32'd15];

assign tmp_341_fu_1220_p3 = data_17_V_read[32'd15];

assign tmp_342_fu_1234_p3 = {{xor_ln1495_111_fu_1228_p2}, {10'd0}};

assign tmp_343_fu_1260_p3 = data_18_V_read[32'd15];

assign tmp_344_fu_1274_p3 = data_18_V_read[32'd15];

assign tmp_345_fu_1288_p3 = {{xor_ln1495_112_fu_1282_p2}, {10'd0}};

assign tmp_346_fu_1314_p3 = data_19_V_read[32'd15];

assign tmp_347_fu_1328_p3 = data_19_V_read[32'd15];

assign tmp_348_fu_1342_p3 = {{xor_ln1495_113_fu_1336_p2}, {10'd0}};

assign tmp_349_fu_1368_p3 = data_20_V_read[32'd15];

assign tmp_350_fu_1382_p3 = data_20_V_read[32'd15];

assign tmp_351_fu_1396_p3 = {{xor_ln1495_114_fu_1390_p2}, {10'd0}};

assign tmp_352_fu_1422_p3 = data_21_V_read[32'd15];

assign tmp_353_fu_1436_p3 = data_21_V_read[32'd15];

assign tmp_354_fu_1450_p3 = {{xor_ln1495_115_fu_1444_p2}, {10'd0}};

assign tmp_355_fu_1476_p3 = data_22_V_read[32'd15];

assign tmp_356_fu_1490_p3 = data_22_V_read[32'd15];

assign tmp_357_fu_1504_p3 = {{xor_ln1495_116_fu_1498_p2}, {10'd0}};

assign tmp_358_fu_1530_p3 = data_23_V_read[32'd15];

assign tmp_359_fu_1544_p3 = data_23_V_read[32'd15];

assign tmp_360_fu_1558_p3 = {{xor_ln1495_117_fu_1552_p2}, {10'd0}};

assign tmp_361_fu_1584_p3 = data_24_V_read[32'd15];

assign tmp_362_fu_1598_p3 = data_24_V_read[32'd15];

assign tmp_363_fu_1612_p3 = {{xor_ln1495_118_fu_1606_p2}, {10'd0}};

assign tmp_364_fu_1638_p3 = data_25_V_read[32'd15];

assign tmp_365_fu_1652_p3 = data_25_V_read[32'd15];

assign tmp_366_fu_1666_p3 = {{xor_ln1495_119_fu_1660_p2}, {10'd0}};

assign tmp_367_fu_1692_p3 = data_26_V_read[32'd15];

assign tmp_368_fu_1706_p3 = data_26_V_read[32'd15];

assign tmp_369_fu_1720_p3 = {{xor_ln1495_120_fu_1714_p2}, {10'd0}};

assign tmp_370_fu_1746_p3 = data_27_V_read[32'd15];

assign tmp_371_fu_1760_p3 = data_27_V_read[32'd15];

assign tmp_372_fu_1774_p3 = {{xor_ln1495_121_fu_1768_p2}, {10'd0}};

assign tmp_373_fu_1800_p3 = data_28_V_read[32'd15];

assign tmp_374_fu_1814_p3 = data_28_V_read[32'd15];

assign tmp_375_fu_1828_p3 = {{xor_ln1495_122_fu_1822_p2}, {10'd0}};

assign tmp_376_fu_1854_p3 = data_29_V_read[32'd15];

assign tmp_377_fu_1868_p3 = data_29_V_read[32'd15];

assign tmp_378_fu_1882_p3 = {{xor_ln1495_123_fu_1876_p2}, {10'd0}};

assign tmp_379_fu_1908_p3 = data_30_V_read[32'd15];

assign tmp_380_fu_1922_p3 = data_30_V_read[32'd15];

assign tmp_381_fu_1936_p3 = {{xor_ln1495_124_fu_1930_p2}, {10'd0}};

assign tmp_382_fu_1962_p3 = data_31_V_read[32'd15];

assign tmp_383_fu_1976_p3 = data_31_V_read[32'd15];

assign tmp_384_fu_1990_p3 = {{xor_ln1495_125_fu_1984_p2}, {10'd0}};

assign xor_ln1495_100_fu_634_p2 = (tmp_308_fu_626_p3 ^ 1'd1);

assign xor_ln1495_101_fu_688_p2 = (tmp_311_fu_680_p3 ^ 1'd1);

assign xor_ln1495_102_fu_742_p2 = (tmp_314_fu_734_p3 ^ 1'd1);

assign xor_ln1495_103_fu_796_p2 = (tmp_317_fu_788_p3 ^ 1'd1);

assign xor_ln1495_104_fu_850_p2 = (tmp_320_fu_842_p3 ^ 1'd1);

assign xor_ln1495_105_fu_904_p2 = (tmp_323_fu_896_p3 ^ 1'd1);

assign xor_ln1495_106_fu_958_p2 = (tmp_326_fu_950_p3 ^ 1'd1);

assign xor_ln1495_107_fu_1012_p2 = (tmp_329_fu_1004_p3 ^ 1'd1);

assign xor_ln1495_108_fu_1066_p2 = (tmp_332_fu_1058_p3 ^ 1'd1);

assign xor_ln1495_109_fu_1120_p2 = (tmp_335_fu_1112_p3 ^ 1'd1);

assign xor_ln1495_110_fu_1174_p2 = (tmp_338_fu_1166_p3 ^ 1'd1);

assign xor_ln1495_111_fu_1228_p2 = (tmp_341_fu_1220_p3 ^ 1'd1);

assign xor_ln1495_112_fu_1282_p2 = (tmp_344_fu_1274_p3 ^ 1'd1);

assign xor_ln1495_113_fu_1336_p2 = (tmp_347_fu_1328_p3 ^ 1'd1);

assign xor_ln1495_114_fu_1390_p2 = (tmp_350_fu_1382_p3 ^ 1'd1);

assign xor_ln1495_115_fu_1444_p2 = (tmp_353_fu_1436_p3 ^ 1'd1);

assign xor_ln1495_116_fu_1498_p2 = (tmp_356_fu_1490_p3 ^ 1'd1);

assign xor_ln1495_117_fu_1552_p2 = (tmp_359_fu_1544_p3 ^ 1'd1);

assign xor_ln1495_118_fu_1606_p2 = (tmp_362_fu_1598_p3 ^ 1'd1);

assign xor_ln1495_119_fu_1660_p2 = (tmp_365_fu_1652_p3 ^ 1'd1);

assign xor_ln1495_120_fu_1714_p2 = (tmp_368_fu_1706_p3 ^ 1'd1);

assign xor_ln1495_121_fu_1768_p2 = (tmp_371_fu_1760_p3 ^ 1'd1);

assign xor_ln1495_122_fu_1822_p2 = (tmp_374_fu_1814_p3 ^ 1'd1);

assign xor_ln1495_123_fu_1876_p2 = (tmp_377_fu_1868_p3 ^ 1'd1);

assign xor_ln1495_124_fu_1930_p2 = (tmp_380_fu_1922_p3 ^ 1'd1);

assign xor_ln1495_125_fu_1984_p2 = (tmp_383_fu_1976_p3 ^ 1'd1);

assign xor_ln1495_95_fu_364_p2 = (tmp_293_fu_356_p3 ^ 1'd1);

assign xor_ln1495_96_fu_418_p2 = (tmp_296_fu_410_p3 ^ 1'd1);

assign xor_ln1495_97_fu_472_p2 = (tmp_299_fu_464_p3 ^ 1'd1);

assign xor_ln1495_98_fu_526_p2 = (tmp_302_fu_518_p3 ^ 1'd1);

assign xor_ln1495_99_fu_580_p2 = (tmp_305_fu_572_p3 ^ 1'd1);

assign xor_ln1495_fu_310_p2 = (tmp_290_fu_302_p3 ^ 1'd1);

assign zext_ln1495_100_fu_648_p1 = tmp_309_fu_640_p3;

assign zext_ln1495_101_fu_702_p1 = tmp_312_fu_694_p3;

assign zext_ln1495_102_fu_756_p1 = tmp_315_fu_748_p3;

assign zext_ln1495_103_fu_810_p1 = tmp_318_fu_802_p3;

assign zext_ln1495_104_fu_864_p1 = tmp_321_fu_856_p3;

assign zext_ln1495_105_fu_918_p1 = tmp_324_fu_910_p3;

assign zext_ln1495_106_fu_972_p1 = tmp_327_fu_964_p3;

assign zext_ln1495_107_fu_1026_p1 = tmp_330_fu_1018_p3;

assign zext_ln1495_108_fu_1080_p1 = tmp_333_fu_1072_p3;

assign zext_ln1495_109_fu_1134_p1 = tmp_336_fu_1126_p3;

assign zext_ln1495_110_fu_1188_p1 = tmp_339_fu_1180_p3;

assign zext_ln1495_111_fu_1242_p1 = tmp_342_fu_1234_p3;

assign zext_ln1495_112_fu_1296_p1 = tmp_345_fu_1288_p3;

assign zext_ln1495_113_fu_1350_p1 = tmp_348_fu_1342_p3;

assign zext_ln1495_114_fu_1404_p1 = tmp_351_fu_1396_p3;

assign zext_ln1495_115_fu_1458_p1 = tmp_354_fu_1450_p3;

assign zext_ln1495_116_fu_1512_p1 = tmp_357_fu_1504_p3;

assign zext_ln1495_117_fu_1566_p1 = tmp_360_fu_1558_p3;

assign zext_ln1495_118_fu_1620_p1 = tmp_363_fu_1612_p3;

assign zext_ln1495_119_fu_1674_p1 = tmp_366_fu_1666_p3;

assign zext_ln1495_120_fu_1728_p1 = tmp_369_fu_1720_p3;

assign zext_ln1495_121_fu_1782_p1 = tmp_372_fu_1774_p3;

assign zext_ln1495_122_fu_1836_p1 = tmp_375_fu_1828_p3;

assign zext_ln1495_123_fu_1890_p1 = tmp_378_fu_1882_p3;

assign zext_ln1495_124_fu_1944_p1 = tmp_381_fu_1936_p3;

assign zext_ln1495_125_fu_1998_p1 = tmp_384_fu_1990_p3;

assign zext_ln1495_95_fu_378_p1 = tmp_294_fu_370_p3;

assign zext_ln1495_96_fu_432_p1 = tmp_297_fu_424_p3;

assign zext_ln1495_97_fu_486_p1 = tmp_300_fu_478_p3;

assign zext_ln1495_98_fu_540_p1 = tmp_303_fu_532_p3;

assign zext_ln1495_99_fu_594_p1 = tmp_306_fu_586_p3;

assign zext_ln1495_fu_324_p1 = tmp_291_fu_316_p3;

endmodule //relu_max_ap_fixed_ap_fixed_1_relu1_config13_s
