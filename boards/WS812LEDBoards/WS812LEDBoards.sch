EESchema Schematic File Version 4
EELAYER 29 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 1 1
Title "WS2812B LED Board"
Date "2019-06-27"
Rev "1.0"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L LEDBoardLibrary:WS2812B D1
U 1 1 5D16259F
P 5650 4100
F 0 "D1" H 5994 4146 50  0000 L CNN
F 1 "WS2812B" H 5994 4055 50  0000 L CNN
F 2 "LEDBoardFootprints:LED_WS2812B_PLCC4_5.0x5.0mm_P3.2mm" H 5700 3800 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/datasheets/WS2812B.pdf" H 5750 3725 50  0001 L TNN
	1    5650 4100
	1    0    0    -1  
$EndComp
$Comp
L LEDBoardLibrary:Conn_01x03_Male J1
U 1 1 5D162EAC
P 4750 4100
F 0 "J1" H 4858 4381 50  0000 C CNN
F 1 "Conn_01x03_Male" H 4858 4290 50  0000 C CNN
F 2 "LEDBoardFootprints:PinHeader_1x03_P2.54mm_Vertical" H 4750 4100 50  0001 C CNN
F 3 "~" H 4750 4100 50  0001 C CNN
	1    4750 4100
	1    0    0    -1  
$EndComp
$Comp
L LEDBoardLibrary:Conn_01x01_Male J2
U 1 1 5D163351
P 6650 4100
F 0 "J2" H 6622 4032 50  0000 R CNN
F 1 "Conn_01x01_Male" H 6622 4123 50  0000 R CNN
F 2 "LEDBoardFootprints:PinHeader_1x01_P2.54mm_Vertical" H 6650 4100 50  0001 C CNN
F 3 "~" H 6650 4100 50  0001 C CNN
	1    6650 4100
	-1   0    0    1   
$EndComp
$Comp
L LEDBoardLibrary:C C1
U 1 1 5D163CFD
P 4250 4100
F 0 "C1" H 4365 4146 50  0000 L CNN
F 1 "0.1u" H 4365 4055 50  0000 L CNN
F 2 "LEDBoardFootprints:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 4288 3950 50  0001 C CNN
F 3 "~" H 4250 4100 50  0001 C CNN
	1    4250 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4250 3950 4250 3850
Wire Wire Line
	4250 3450 5300 3450
Wire Wire Line
	5650 3450 5650 3800
Wire Wire Line
	4250 4250 4250 4400
Wire Wire Line
	4250 4600 5300 4600
Wire Wire Line
	5650 4600 5650 4400
Wire Wire Line
	4950 4100 5350 4100
Wire Wire Line
	4950 4000 5300 4000
Wire Wire Line
	5300 4000 5300 3450
Connection ~ 5300 3450
Wire Wire Line
	5300 3450 5650 3450
Wire Wire Line
	4950 4200 5300 4200
Wire Wire Line
	5300 4200 5300 4600
Connection ~ 5300 4600
Wire Wire Line
	5300 4600 5650 4600
$Comp
L power:+5V #PWR02
U 1 1 5D164DF8
P 4100 3650
F 0 "#PWR02" H 4100 3500 50  0001 C CNN
F 1 "+5V" V 4115 3778 50  0000 L CNN
F 2 "" H 4100 3650 50  0001 C CNN
F 3 "" H 4100 3650 50  0001 C CNN
	1    4100 3650
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR01
U 1 1 5D16566A
P 4050 4400
F 0 "#PWR01" H 4050 4150 50  0001 C CNN
F 1 "GND" V 4055 4272 50  0000 R CNN
F 2 "" H 4050 4400 50  0001 C CNN
F 3 "" H 4050 4400 50  0001 C CNN
	1    4050 4400
	0    1    1    0   
$EndComp
Wire Wire Line
	4100 3650 4250 3650
Connection ~ 4250 3650
Wire Wire Line
	4250 3650 4250 3450
Wire Wire Line
	4050 4400 4250 4400
Connection ~ 4250 4400
Wire Wire Line
	4250 4400 4250 4600
Text Notes 2000 6000 0    50   ~ 0
NOTES:\n\n-Each LED can draw up to 50 mA. Ensure the power supply can handle this. \n-Be sure to add a ~470 ohm resisstor to the input.\n-If powered from 5V, ensure that the data signal is raised to 5v too.
Wire Wire Line
	5950 4100 6450 4100
$Comp
L power:PWR_FLAG #FLG?
U 1 1 5D168831
P 4100 3850
F 0 "#FLG?" H 4100 3925 50  0001 C CNN
F 1 "PWR_FLAG" V 4100 3977 50  0000 L CNN
F 2 "" H 4100 3850 50  0001 C CNN
F 3 "~" H 4100 3850 50  0001 C CNN
	1    4100 3850
	0    -1   -1   0   
$EndComp
$Comp
L power:PWR_FLAG #FLG?
U 1 1 5D168C94
P 4050 4250
F 0 "#FLG?" H 4050 4325 50  0001 C CNN
F 1 "PWR_FLAG" V 4050 4377 50  0000 L CNN
F 2 "" H 4050 4250 50  0001 C CNN
F 3 "~" H 4050 4250 50  0001 C CNN
	1    4050 4250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4100 3850 4250 3850
Connection ~ 4250 3850
Wire Wire Line
	4250 3850 4250 3650
Wire Wire Line
	4050 4250 4250 4250
Connection ~ 4250 4250
$EndSCHEMATC
