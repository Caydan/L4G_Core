-- more missing patterns thanks for pointing out @Tykan
-- http://looking4group.eu/hellfire/showthread.php?tid=2979
DELETE FROM `reference_loot_template` WHERE `entry` = 24092 AND `item` IN (31875,31876,31877,31878,31879);
INSERT INTO `reference_loot_template` VALUES (24092, 31875, 0, 1, 1, 1, 0, 0, 0);
INSERT INTO `reference_loot_template` VALUES (24092, 31876, 0, 1, 1, 1, 0, 0, 0);
INSERT INTO `reference_loot_template` VALUES (24092, 31877, 0, 1, 1, 1, 0, 0, 0);
INSERT INTO `reference_loot_template` VALUES (24092, 31878, 0, 1, 1, 1, 0, 0, 0);
INSERT INTO `reference_loot_template` VALUES (24092, 31879, 0, 1, 1, 1, 0, 0, 0);

DELETE FROM `reference_loot_template` WHERE `entry` = 10006 AND `item` IN (31875,31876,31877);
INSERT INTO `reference_loot_template` VALUES (10006, 31875, 0, 1, 1, 1, 0, 0, 0);
INSERT INTO `reference_loot_template` VALUES (10006, 31876, 0, 1, 1, 1, 0, 0, 0);
INSERT INTO `reference_loot_template` VALUES (10006, 31877, 0, 1, 1, 1, 0, 0, 0);
-- INSERT INTO `reference_loot_template` VALUES (10006, 33186, 0, 1, 1, 1, 0, 0, 0); Plans: Adamantite Weapon Chain Readd 2.3

-- Ethereum Nullifier 22822
UPDATE `creature_template` SET `AIName`='EventAI' WHERE `entry` = 22822;
DELETE FROM `creature_ai_scripts` WHERE `entryOrGUID` = 22822;
INSERT INTO `creature_ai_scripts` VALUES
(2282201,22822,2,0,100,1,50,0,10000,15000,11,36513,0,1,0,0,0,0,0,0,0,0,'Ethereum Nullifier - Casts Intangible Presence');
 
-- Ethereum Jailor 23008
UPDATE `creature` SET `spawntimesecs` = 1200 WHERE `id` = 23008;
UPDATE `creature_template` SET `baseattacktime`='1400',`AIName`='EventAI' WHERE `entry` = 23008; -- 2000
DELETE FROM `creature_ai_scripts` WHERE `entryOrGUID` = 23008;
INSERT INTO `creature_ai_scripts` VALUES
(2300801,23008,2,0,100,1,50,0,10000,15000,11,36513,0,1,0,0,0,0,0,0,0,0,'Ethereum Jailor - Casts Intangible Presence'),
(2300802,23008,9,0,50,1,0,3,10000,15000,11,35924,0,1,0,0,0,0,0,0,0,0,'Ethereum Jailor - Casts Energy Flux');

-- add Formula: Enchant Bracer - Greater Dodge to Ethereum Jailor Loottable
DELETE FROM `creature_loot_template` WHERE `entry` = 23008 AND `item` = 22530;
INSERT INTO `creature_loot_template` VALUES 
(23008, 22530, 1.0, 0, 1, 1, 7, 333, 1);

-- Serpentshrine Sporebat 21246
-- 107150, 214300 Leben haben Spore Burst Charge 10-15 secs melee for 3000 on cloth. hacky charge fix
-- By 1313moridin (1,661 – 13·34) on 2007/04/30 (Patch 2.0.12) they only have alittle over 200k hp
-- http://wowwiki.wikia.com/wiki/Serpentshrine_Sporebat?direction=next&oldid=768437 , http://www.wowhead.com/npc=21246/serpentshrine-sporebat#comments
UPDATE `creature_template` SET `speed`='1.48',`mindmg`='3000',`maxdmg`='5000',`baseattacktime`='1000',`mechanic_immune_mask`='0' WHERE `entry` = 21246; -- 1874 3809 2000 -- 2500 3500 7,649 - 9,084
DELETE FROM `creature_ai_scripts` WHERE `entryOrGUID` = 21246;
INSERT INTO `creature_ai_scripts` VALUES
('2124601','21246','9','0','50','2','6','30','0','0','11','38461','1','0','11','40602','1','0','0','0','0','0','Serpentshrine Sporebat - Cast Charge on Aggro'), -- 5 22120 -- 38461
('2124602','21246','9','0','100','3','0','5','15800','24000','11','38924','0','1','0','0','0','0','0','0','0','0','Serpentshrine Sporebat - Cast Spore Burst'),
('2124603','21246','0','0','100','3','10000','15000','10000','15000','11','38461','4','1','11','40602','4','1','0','0','0','0','Serpentshrine Sporebat - Cast Random Charge');

-- Whirling Blade 23369 mob_whirling_blade
UPDATE `creature_template` SET `modelid_A`='16946' WHERE `entry` = 23369;

-- Watcher Moonshade ori GUID + Path
DELETE FROM `creature` WHERE `guid` IN (78695,511368);
INSERT INTO `creature` VALUES (78695, 22386, 530, 1, 0, 0, 3108.07, 6131.54, 136.358, 1.36031, 300, 0, 0, 4800, 0, 0, 2);
SET @GUID := 78695;
UPDATE `creature` SET `MovementType`='2' WHERE `guid` = @GUID;
DELETE FROM `creature_addon` WHERE `guid` = @GUID;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes0`,`bytes1`,`bytes2`,`emote`,`moveflags`,`auras`) VALUES (@GUID,@GUID,0,0,0,4097,0,0,'');
DELETE FROM `waypoint_data` WHERE `id` = @GUID;
INSERT INTO `waypoint_data` VALUES
(78695,1,3109.83,6138.61,136.152,15000,0,0,100,0),
(78695,2,3106.78,6123.73,136.396,0,0,0,100,0),
(78695,3,3103.92,6119.18,134.98,0,0,0,100,0),
(78695,4,3107.08,6115.74,134.479,0,0,0,100,0),
(78695,5,3106.34,6115.29,134.444,20000,0,0,100,0),
(78695,6,3100.41,6119.81,134.724,5000,0,0,100,0),
(78695,7,3108.07,6131.54,136.358,0,0,0,100,0);

DELETE FROM `creature` WHERE `guid` = 77174;
INSERT INTO `creature` VALUES (77174, 22025, 530, 1, 0, 0, -3023.25, 2044.44, 96.9412, 3.63741, 300, 0, 0, 5300, 2991, 0, 2);
SET @GUID := 77174;
UPDATE `creature` SET `MovementType`='2' WHERE `guid` = @GUID;
DELETE FROM `creature_addon` WHERE `guid` = @GUID;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes0`,`bytes1`,`bytes2`,`emote`,`moveflags`,`auras`) VALUES (@GUID,@GUID,0,0,0,4097,0,0,'');
DELETE FROM `waypoint_data` WHERE `id` = @GUID;
INSERT INTO `waypoint_data` VALUES
(77174,1,-3049.04,2036.84,96.7392,0,0,0,100,0),
(77174,2,-3058.74,2037.59,97.0927,0,0,0,100,0),
(77174,3,-3071.71,2031.49,97.8157,0,0,0,100,0),
(77174,4,-3081.47,2022.89,98.1052,0,0,0,100,0),
(77174,5,-3080.4,2018.21,98.423,0,0,0,100,0),
(77174,6,-3068.68,2011.33,99.1066,0,0,0,100,0),
(77174,7,-3063.36,2002.53,99.861,0,0,0,100,0),
(77174,8,-3052.37,1999.89,99.0744,0,0,0,100,0),
(77174,9,-3035,2000.17,98.8673,0,0,0,100,0),
(77174,10,-3018.3,2007.63,96.9703,0,0,0,100,0),
(77174,11,-3016.29,2040.86,97.3995,0,0,0,100,0);

UPDATE `creature` SET `position_x`='-3132.6718', `position_y`='2245.0419', `position_z`='61.3553' WHERE `guid` = 70950;
UPDATE `creature` SET `position_x`='-3069.6955', `position_y`='2177.9125', `position_z`='73.1659' WHERE `guid` = 70951;

DELETE FROM `creature` WHERE `guid` = 86493;
INSERT INTO `creature` VALUES (86493, 22024, 530, 1, 0, 0, -3493.57, 2277.09, 65.3081, 0.030873, 1524, 0, 0, 4531, 2991, 0, 2);
SET @GUID := 86493;
UPDATE `creature` SET `MovementType`='2' WHERE `guid` = @GUID;
DELETE FROM `creature_addon` WHERE `guid` = @GUID;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes0`,`bytes1`,`bytes2`,`emote`,`moveflags`,`auras`) VALUES (@GUID,@GUID,0,0,0,4097,0,0,'');
DELETE FROM `waypoint_data` WHERE `id` = @GUID;
INSERT INTO `waypoint_data` VALUES
(86493,1,-3478.58,2278.88,64.3024,0,0,0,100,0),
(86493,2,-3465.33,2287.22,63.4117,0,0,0,100,0),
(86493,3,-3396.56,2289.24,62.6846,0,0,0,100,0),
(86493,4,-3375.29,2283.54,62.2904,0,0,0,100,0),
(86493,5,-3361.75,2279.95,61.9273,0,0,0,100,0),
(86493,6,-3346.63,2278.56,61.3279,0,0,0,100,0),
(86493,7,-3292.68,2278.75,60.6095,0,0,0,100,0),
(86493,8,-3365.18,2279.23,62.0737,0,0,0,100,0),
(86493,9,-3387.64,2287.59,62.3845,0,0,0,100,0),
(86493,10,-3399.74,2289.47,62.7643,0,0,0,100,0),
(86493,11,-3457.02,2289.38,63.4614,0,0,0,100,0),
(86493,12,-3465.55,2286.99,63.416,0,0,0,100,0),
(86493,13,-3476.52,2280.52,64.1385,0,0,0,100,0),
(86493,14,-3494.46,2277.87,65.362,0,0,0,100,0);

DELETE FROM `creature` WHERE `guid` = 76716;
INSERT INTO `creature` VALUES (76716, 21928, 530, 1, 0, 0, -3780.32, 2669.17, 101.36, 3.25117, 300, 0, 0, 5589, 3155, 0, 2);
SET @GUID := 76716;
UPDATE `creature` SET `MovementType`='2' WHERE `guid` = @GUID;
DELETE FROM `creature_addon` WHERE `guid` = @GUID;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes0`,`bytes1`,`bytes2`,`emote`,`moveflags`,`auras`) VALUES (@GUID,@GUID,0,0,0,4097,0,0,'');
DELETE FROM `waypoint_data` WHERE `id` = @GUID;
INSERT INTO `waypoint_data` VALUES
(76716,1,-3786.7,2670.05,101.234,0,0,0,100,0),
(76716,2,-3780.58,2686.94,101.002,0,0,0,100,0),
(76716,3,-3787.51,2672.69,101.089,0,0,0,100,0),
(76716,4,-3799,2670.99,101.33,0,0,0,100,0),
(76716,5,-3805.09,2676,100.937,0,0,0,100,0),
(76716,6,-3821.13,2697.37,101.103,0,0,0,100,0),
(76716,7,-3802.29,2672.35,101.077,0,0,0,100,0),
(76716,8,-3793.76,2669.05,101.634,0,0,0,100,0),
(76716,9,-3788.45,2672.2,101.092,0,0,0,100,0),
(76716,10,-3778.92,2687.8,101.164,0,0,0,100,0),
(76716,11,-3785.84,2674.82,100.917,0,0,0,100,0),
(76716,12,-3783.46,2669.85,101.156,0,0,0,100,0),
(76716,13,-3770.29,2669.09,100.84,0,0,0,100,0),
(76716,14,-3718.1,2675.63,105.861,0,0,0,100,0),
(76716,15,-3779.27,2669.86,101.105,0,0,0,100,0);

DELETE FROM `creature` WHERE `guid` = 84491;
INSERT INTO `creature` VALUES (84491, 21501, 530, 1, 0, 0, -3242.16, 2977.81, 132.319, 1.83354, 120, 0, 0, 26168, 0, 0, 2);
SET @GUID := 84491;
UPDATE `creature` SET `MovementType`='2' WHERE `guid` = @GUID;
DELETE FROM `creature_addon` WHERE `guid` = @GUID;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes0`,`bytes1`,`bytes2`,`emote`,`moveflags`,`auras`) VALUES (@GUID,@GUID,0,0,0,4097,0,0,'');
DELETE FROM `waypoint_data` WHERE `id` = @GUID;
INSERT INTO `waypoint_data` VALUES
(84491,1,-3247.6,2994.17,135.993,0,0,0,100,0),
(84491,2,-3279.03,3007.97,141.889,0,0,0,100,0),
(84491,3,-3298.27,3015.95,150.866,0,0,0,100,0),
(84491,4,-3305.81,3025.77,154.973,0,0,0,100,0),
(84491,5,-3306.91,3039,150.53,0,0,0,100,0),
(84491,6,-3290.88,3050.58,142.305,0,0,0,100,0),
(84491,7,-3247.36,3076.23,135.868,0,0,0,100,0),
(84491,8,-3226.75,3084.37,131.21,0,0,0,100,0),
(84491,9,-3212.6,3083.74,127.018,0,0,0,100,0),
(84491,10,-3189.07,3053.51,116.723,0,0,0,100,0),
(84491,11,-3163.71,3039.35,109.256,0,0,0,100,0),
(84491,12,-3123.28,2992.12,97.3441,0,0,0,100,0),
(84491,13,-3119.82,2954.27,93.2622,0,0,0,100,0),
(84491,14,-3126.95,2940.52,93.3914,0,0,0,100,0),
(84491,15,-3147.16,2936.34,94.7507,0,0,0,100,0),
(84491,16,-3157.92,2926.54,96.0054,0,0,0,100,0),
(84491,17,-3172.45,2894.14,96.479,0,0,0,100,0),
(84491,18,-3177.28,2877.4,96.6412,0,0,0,100,0),
(84491,19,-3169.7,2843.48,89.1798,0,0,0,100,0),
(84491,20,-3170.42,2824.29,87.7978,0,0,0,100,0),
(84491,21,-3187.37,2806.07,91.5113,0,0,0,100,0),
(84491,22,-3206.98,2791.17,99.2637,0,0,0,100,0),
(84491,23,-3219.35,2790.44,102.432,0,0,0,100,0),
(84491,24,-3238.97,2798.19,116.781,0,0,0,100,0),
(84491,25,-3272.61,2796.84,122.803,0,0,0,100,0),
(84491,26,-3306.26,2800.2,123.104,0,0,0,100,0),
(84491,27,-3323.38,2811.41,123.411,0,0,0,100,0),
(84491,28,-3326.33,2831.94,130.764,0,0,0,100,0),
(84491,29,-3305.22,2857.19,130.839,0,0,0,100,0),
(84491,30,-3293.86,2880.3,131.407,0,0,0,100,0),
(84491,31,-3287.93,2911.6,132.588,0,0,0,100,0),
(84491,32,-3278.15,2933.55,131.801,0,0,0,100,0),
(84491,33,-3256.96,2941.67,128.587,0,0,0,100,0),
(84491,34,-3243.07,2976.45,132.121,0,0,0,100,0);

DELETE FROM `creature` WHERE `guid` = 75406;
INSERT INTO `creature` VALUES (75406, 21499, 530, 1, 0, 0, -3236.58, 2950.32, 126.891, 2.3555, 300, 0, 0, 6761, 0, 0, 2);
SET @GUID := 75406;
UPDATE `creature` SET `MovementType`='2' WHERE `guid` = @GUID;
DELETE FROM `creature_addon` WHERE `guid` = @GUID;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes0`,`bytes1`,`bytes2`,`emote`,`moveflags`,`auras`) VALUES (@GUID,@GUID,0,0,0,4097,0,0,'');
DELETE FROM `waypoint_data` WHERE `id` = @GUID;
INSERT INTO `waypoint_data` VALUES
(75406,1,-3272.84,2971.38,133.97,0,0,0,100,0),
(75406,2,-3278.5,2984.29,136.129,0,0,0,100,0),
(75406,3,-3276.45,2992.78,138.053,0,0,0,100,0),
(75406,4,-3262.68,3003.52,138.648,3000,0,0,100,0),
(75406,5,-3280.27,2984.84,136.464,0,0,0,100,0),
(75406,6,-3277.7,2973.1,134.572,0,0,0,100,0),
(75406,7,-3255.09,2960.49,131.977,0,0,0,100,0),
(75406,8,-3237.69,2951.95,127.202,0,0,0,100,0),
(75406,9,-3228.07,2925.12,127.1,0,0,0,100,0),
(75406,10,-3238.74,2908.37,126.218,0,0,0,100,0),
(75406,11,-3252.44,2900.96,125.35,0,0,0,100,0),
(75406,12,-3260.73,2903.15,126.776,3000,0,0,100,0),
(75406,13,-3251.93,2902.01,125.441,0,0,0,100,0),
(75406,14,-3238.65,2908.15,126.18,0,0,0,100,0),
(75406,15,-3229.86,2917.15,127.228,0,0,0,100,0),
(75406,16,-3229.09,2929.26,126.888,0,0,0,100,0),
(75406,17,-3236.67,2950.03,126.819,0,0,0,100,0);

DELETE FROM `creature` WHERE `guid` = 75405;
INSERT INTO `creature` VALUES (75405, 21497, 530, 1, 0, 0, 3178.03, 7162.76, 198.649, 2.094, 300, 0, 0, 34930, 0, 0, 2);
SET @GUID := 75405;
UPDATE `creature` SET `MovementType`='2' WHERE `guid` = @GUID;
DELETE FROM `creature_addon` WHERE `guid` = @GUID;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes0`,`bytes1`,`bytes2`,`emote`,`moveflags`,`auras`) VALUES (@GUID,@GUID,0,0,0,4097,0,0,'');
DELETE FROM `waypoint_data` WHERE `id` = @GUID;
INSERT INTO `waypoint_data` VALUES
(75405,1,3406.09,7124.06,189.294,0,0,0,100,0),
(75405,2,3406.94,7123.54,189.294,0,0,0,100,0),
(75405,3,3227.07,7124.38,198.293,0,0,0,100,0),
(75405,4,3197.35,7140.33,198.293,0,0,0,100,0),
(75405,5,3174.6,7175.17,198.293,0,0,0,100,0),
(75405,6,3206.27,7208.28,193.488,0,0,0,100,0),
(75405,7,3226.79,7220.99,193.488,0,0,0,100,0),
(75405,8,3255.19,7222.58,193.488,0,0,0,100,0),
(75405,9,3300.44,7212.05,189.294,0,0,0,100,0),
(75405,10,3313.93,7200.43,189.294,0,0,0,100,0),
(75405,11,3343.27,7180.31,189.294,0,0,0,100,0),
(75405,12,3375.99,7142.72,189.294,0,0,0,100,0),
(75405,13,3417.93,7115.4,189.294,0,0,0,100,0),
(75405,14,3443.3,7078.94,189.294,0,0,0,100,0),
(75405,15,3423.43,7041.69,183.628,0,0,0,100,0),
(75405,16,3389.92,7007.88,183.628,0,0,0,100,0),
(75405,17,3346.99,6983.5,183.628,0,0,0,100,0),
(75405,18,3303.02,6983.78,183.628,0,0,0,100,0),
(75405,19,3281.57,7027.43,186.35,0,0,0,100,0),
(75405,20,3283.78,7064.68,186.433,0,0,0,100,0),
(75405,21,3281.75,7085.84,187.989,0,0,0,100,0),
(75405,22,3266.41,7105.88,192.072,0,0,0,100,0),
(75405,23,3242.7,7118.66,196.016,0,0,0,100,0),
(75405,24,3227.07,7124.38,198.293,0,0,0,100,0),
(75405,25,3197.35,7140.33,198.293,0,0,0,100,0);

DELETE FROM `creature` WHERE `guid` = 74614;
INSERT INTO `creature` VALUES (74614, 21309, 530, 1, 0, 0, -3693.65, 2668.37, 107.487, 4.3966, 300, 0, 0, 5589, 3155, 0, 2);
SET @GUID := 74614;
UPDATE `creature` SET `MovementType`='2' WHERE `guid` = @GUID;
DELETE FROM `creature_addon` WHERE `guid` = @GUID;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes0`,`bytes1`,`bytes2`,`emote`,`moveflags`,`auras`) VALUES (@GUID,@GUID,0,0,0,4097,0,0,'');
DELETE FROM `waypoint_data` WHERE `id` = @GUID;
INSERT INTO `waypoint_data` VALUES
(74614,1,-3697.1,2669.77,107.186,0,0,0,100,0),
(74614,2,-3697.68,2673.34,108.569,0,0,0,100,0),
(74614,3,-3692.22,2678.74,108.66,0,0,0,100,0),
(74614,4,-3690.04,2682.79,108.752,0,0,0,100,0),
(74614,5,-3692.89,2684.18,108.485,6000,0,2130901,100,0), 
(74614,6,-3690.92,2682.03,108.744,0,0,0,100,0),
(74614,7,-3694.07,2677.51,108.537,0,0,0,100,0),
(74614,8,-3697.53,2673.77,108.581,0,0,0,100,0),
(74614,9,-3693.46,2668.44,107.174,20000,0,0,100,0);

DELETE FROM `waypoint_scripts` WHERE `id` = 2130901;
INSERT INTO `waypoint_scripts` VALUES (2130901, 1, 15, 36578, 0, 0, 0, 0, 0, 0, 2130901, 'cast 36578 on buddy');
INSERT INTO `waypoint_scripts` VALUES (2130901, 5, 15, 6273, 0, 0, 0, 0, 0, 0, 2130902, 'cast 6273 on X');

DELETE FROM `creature` WHERE `guid` = 72380;
INSERT INTO `creature` VALUES (72380, 20410, 530, 1, 0, 0, 2295.74, 2100.04, 78.143, 1.8877, 300, 0, 0, 7500, 0, 0, 2);
SET @GUID := 72380;
UPDATE `creature` SET `MovementType`='2' WHERE `guid` = @GUID;
DELETE FROM `creature_addon` WHERE `guid` = @GUID;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes0`,`bytes1`,`bytes2`,`emote`,`moveflags`,`auras`) VALUES (@GUID,@GUID,0,0,0,4097,0,0,'');
DELETE FROM `waypoint_data` WHERE `id` = @GUID;
INSERT INTO `waypoint_data` VALUES
(72380,1,2292.12,2100.73,76.9142,0,0,0,100,0),
(72380,2,2284.79,2102.1,69.642,0,0,0,100,0),
(72380,3,2282.07,2087.95,65.2024,0,0,0,100,0),
(72380,4,2277.8,2060.16,65.7808,0,0,0,100,0),
(72380,5,2284.91,2047.64,67.2429,0,0,0,100,0),
(72380,6,2289.74,2052.37,70.4908,0,0,0,100,0),
(72380,7,2299.16,2070.77,74.9437,0,0,0,100,0),
(72380,8,2301.77,2075.56,74.3596,0,0,0,100,0),
(72380,9,2304.54,2080.78,75.7481,0,0,0,100,0),
(72380,10,2304.76,2088.31,76.84,0,0,0,100,0),
(72380,11,2292.5,2100.48,77.0599,0,0,0,100,0);

-- Raging Fire-Soul no ai/script
UPDATE `creature_template` SET `AIName`= NULL WHERE `entry` = 22311;

-- Harbinger Skyriss 20912,21599
-- 50028 was empty, reused and now back to original values
DELETE FROM `creature_loot_template` WHERE `item` IN (50028,50033) AND `entry` = 21599;
INSERT INTO `creature_loot_template` VALUES 
(21599,50033,40,0,-50033,1,0,0,0);

DELETE FROM `reference_loot_template` WHERE `entry` = 50033;
INSERT INTO `reference_loot_template` VALUES (50033, 30581, 0, 1, 1, 1, 0, 0, 0);
INSERT INTO `reference_loot_template` VALUES (50033, 30575, 0, 1, 1, 1, 0, 0, 0);
INSERT INTO `reference_loot_template` VALUES (50033, 30582, 0, 1, 1, 1, 0, 0, 0);

DELETE FROM `reference_loot_template` WHERE `entry` = 50028;
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES ('50028', '31883', '0', '1', '1', '1', '0', '0', '0');
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES ('50028', '31884', '0', '1', '1', '1', '0', '0', '0');
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES ('50028', '31886', '0', '1', '1', '1', '0', '0', '0');
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES ('50028', '31887', '0', '1', '1', '1', '0', '0', '0');
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES ('50028', '31893', '0', '1', '1', '1', '0', '0', '0');
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES ('50028', '31894', '0', '1', '1', '1', '0', '0', '0');
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES ('50028', '31896', '0', '1', '1', '1', '0', '0', '0');
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES ('50028', '31898', '0', '1', '1', '1', '0', '0', '0');
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES ('50028', '31902', '0', '1', '1', '1', '0', '0', '0');
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES ('50028', '31903', '0', '1', '1', '1', '0', '0', '0');
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES ('50028', '31905', '0', '1', '1', '1', '0', '0', '0');
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES ('50028', '31906', '0', '1', '1', '1', '0', '0', '0');
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES ('50028', '31911', '0', '1', '1', '1', '0', '0', '0');
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES ('50028', '31912', '0', '1', '1', '1', '0', '0', '0');
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES ('50028', '31915', '0', '1', '1', '1', '0', '0', '0');
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES ('50028', '31916', '0', '1', '1', '1', '0', '0', '0');

-- Tainted Earthgrab Totem 18176,19897 
UPDATE creature_template SET spell1 = 20654 WHERE entry = 18176; 
UPDATE creature_template SET spell1 = 20654 WHERE entry = 19897; 

-- Tainted Stoneskin Totem 18177,19900 
UPDATE creature_template SET spell1 = 31986 WHERE entry = 18177; 
UPDATE creature_template SET minhealth='5', maxhealth='5', spell1 = 31986 WHERE entry = 19900; 

-- Corrupted Nova Totem 18179,19899 
UPDATE creature_template SET spell1 = 33132 WHERE entry = 18179; 
UPDATE creature_template SET spell1 = 33132 WHERE entry = 19899; 

-- Mennu's Healing Ward 20208,22322 
UPDATE creature_template SET heroic_entry = 22322, spell1 = 34977 WHERE entry = 20208; 
UPDATE creature_template SET spell1 = 38800 WHERE entry = 22322;

-- slight ppm-correction for OoC
UPDATE `spell_proc_event` SET `ppmRate` = 2.5 WHERE `entry` = 16864; -- 2

-- correct respawn timer of potential Chief Engineer Lorthander spawn
UPDATE `creature` SET `spawntimesecs` = 28800 WHERE `id` = 18697;

-- Terocone 181277
UPDATE `gameobject` SET `spawntimesecs` = 1200 WHERE `id` = 181277 AND `map` = 530;

-- MASTER Herbs Shadowmoon Valley zone 3520
UPDATE `pool_template` SET `max_limit`='55' WHERE `entry` = 976; -- 45

-- MASTER Herbs Terokkar Forest zone 3519
UPDATE `pool_template` SET `max_limit`='55' WHERE `entry` = 977; -- 65

-- Solarian
UPDATE `creature_template` SET `speed`= 3 WHERE `entry` = 18805; -- 2

SET @GUID := 69981;
DELETE FROM `creature` WHERE `guid` = @GUID;
INSERT INTO `creature` VALUES (69981, 19853, 530, 1, 0, 0, 2844.67, 3361.5, 138.565, 2.3911, 300, 0, 0, 6326, 0, 0, 2);
DELETE FROM `creature_addon` WHERE `guid` = @GUID;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes0`,`bytes1`,`bytes2`,`emote`,`moveflags`,`auras`) VALUES (@GUID,@GUID,0,0,0,4097,0,0,'');
DELETE FROM `waypoint_data` WHERE `id` = @GUID;
INSERT INTO `waypoint_data` VALUES (69981, 1, 2834.53, 3372.97, 140.59, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (69981, 2, 2790.98, 3386.55, 143.357, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (69981, 3, 2763.78, 3391.45, 147.113, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (69981, 4, 2790.98, 3386.55, 143.357, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (69981, 5, 2834.53, 3372.97, 140.59, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (69981, 6, 2844.67, 3361.5, 138.565, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (69981, 7, 2846.51, 3330.01, 136.462, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (69981, 8, 2847.49, 3293.01, 136.304, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (69981, 9, 2844.52, 3274.39, 136.429, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (69981, 10, 2847.5, 3292.92, 136.304, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (69981, 11, 2846.51, 3330.01, 136.462, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (69981, 12, 2844.67, 3361.5, 138.565, 0, 0, 0, 100, 0);

SET @GUID := 70989;
DELETE FROM `creature` WHERE `guid` = @GUID;
INSERT INTO `creature` VALUES (70989, 19853, 530, 1, 0, 0, 2767.33, 3119.98, 153.694, 2.96296, 300, 0, 0, 6326, 0, 0, 2);
DELETE FROM `creature_addon` WHERE `guid` = @GUID;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes0`,`bytes1`,`bytes2`,`emote`,`moveflags`,`auras`) VALUES (@GUID,@GUID,0,0,0,4097,0,0,'');
DELETE FROM `waypoint_data` WHERE `id` = @GUID;
INSERT INTO `waypoint_data` VALUES (70989, 1, 2760.35, 3133.05, 151.882, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (70989, 2, 2751.24, 3166.75, 147.972, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (70989, 3, 2737.51, 3197.84, 148.597, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (70989, 4, 2729.6, 3240.77, 147.62, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (70989, 5, 2737.51, 3197.84, 148.597, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (70989, 6, 2751.24, 3166.75, 147.972, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (70989, 7, 2760.35, 3133.05, 151.882, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (70989, 8, 2767.33, 3119.98, 153.694, 0, 0, 0, 100, 0);

SET @GUID := 70990;
DELETE FROM `creature` WHERE `guid` = @GUID;
INSERT INTO `creature` VALUES (70990, 19853, 530, 1, 0, 0, 2741.71, 3283.1, 134.827, 0.311563, 300, 0, 0, 6326, 0, 0, 2);
DELETE FROM `creature_addon` WHERE `guid` = @GUID;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes0`,`bytes1`,`bytes2`,`emote`,`moveflags`,`auras`) VALUES (@GUID,@GUID,0,0,0,4097,0,0,'');
DELETE FROM `waypoint_data` WHERE `id` = @GUID;
INSERT INTO `waypoint_data` VALUES (70990, 1, 2776.67, 3296.71, 135.013, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (70990, 2, 2741.71, 3283.1, 134.827, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (70990, 3, 2723.71, 3264.67, 135.12, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (70990, 4, 2701.38, 3251.36, 133.87, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (70990, 5, 2671.79, 3241.82, 136.064, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (70990, 6, 2701.38, 3251.36, 133.87, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (70990, 7, 2723.71, 3264.67, 135.12, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (70990, 8, 2741.71, 3283.1, 134.827, 0, 0, 0, 100, 0);

SET @GUID := 70991;
DELETE FROM `creature` WHERE `guid` = @GUID;
INSERT INTO `creature` VALUES (70991, 19853, 530, 1, 0, 0, 2676.24, 3108.5, 129.766, 2.18517, 300, 0, 0, 6326, 0, 0, 2);
DELETE FROM `creature_addon` WHERE `guid` = @GUID;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes0`,`bytes1`,`bytes2`,`emote`,`moveflags`,`auras`) VALUES (@GUID,@GUID,0,0,0,4097,0,0,'');
DELETE FROM `waypoint_data` WHERE `id` = @GUID;
INSERT INTO `waypoint_data` VALUES (70991, 1, 2695.88, 3152.22, 142.845, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (70991, 2, 2733.63, 3176.7, 147.722, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (70991, 3, 2767.52, 3183.07, 149.017, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (70991, 4, 2783.05, 3200.55, 149.073, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (70991, 5, 2795.11, 3234.78, 147.682, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (70991, 6, 2783.16, 3200.82, 149.073, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (70991, 7, 2767.52, 3183.07, 149.017, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (70991, 8, 2734.09, 3176.92, 147.722, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (70991, 9, 2695.88, 3152.22, 142.845, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (70991, 10, 2676.24, 3108.5, 129.766, 0, 0, 0, 100, 0);

SET @GUID := 70992;
DELETE FROM `creature` WHERE `guid` = @GUID;
INSERT INTO `creature` VALUES (70992, 19853, 530, 1, 0, 0, 2742.47, 3066.7, 127.121, 0.11249, 300, 0, 0, 6326, 0, 0, 2);
DELETE FROM `creature_addon` WHERE `guid` = @GUID;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes0`,`bytes1`,`bytes2`,`emote`,`moveflags`,`auras`) VALUES (@GUID,@GUID,0,0,0,4097,0,0,'');
DELETE FROM `waypoint_data` WHERE `id` = @GUID;
INSERT INTO `waypoint_data` VALUES (70992, 1, 2771.32, 3055.72, 125.388, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (70992, 2, 2742.47, 3066.7, 127.121, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (70992, 3, 2714.79, 3083.18, 125.969, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (70992, 4, 2681.55, 3107.02, 129.766, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (70992, 5, 2666.16, 3128.54, 136.37, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (70992, 6, 2681.55, 3107.02, 129.766, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (70992, 7, 2714.79, 3083.18, 125.969, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (70992, 8, 2742.47, 3066.7, 127.121, 0, 0, 0, 100, 0);

SET @GUID := 70993;
DELETE FROM `creature` WHERE `guid` = @GUID;
INSERT INTO `creature` VALUES (70993, 19853, 530, 1, 0, 0, 2791.83, 3285.33, 147.638, 0.193807, 300, 0, 0, 6326, 0, 0, 2);
DELETE FROM `creature_addon` WHERE `guid` = @GUID;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes0`,`bytes1`,`bytes2`,`emote`,`moveflags`,`auras`) VALUES (@GUID,@GUID,0,0,0,4097,0,0,'');
DELETE FROM `waypoint_data` WHERE `id` = @GUID;
INSERT INTO `waypoint_data` VALUES (70993, 1, 2798.78, 3266.61, 147.682, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (70993, 2, 2799.45, 3234.61, 147.682, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (70993, 3, 2786.39, 3199.4, 147.517, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (70993, 4, 2773.54, 3167.47, 148.142, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (70993, 5, 2786.39, 3199.4, 147.517, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (70993, 6, 2799.45, 3234.61, 147.682, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (70993, 7, 2798.78, 3266.61, 147.682, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (70993, 8, 2791.83, 3285.33, 147.638, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (70993, 9, 2797.74, 3316.09, 147.891, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (70993, 10, 2803.09, 3341.8, 146.354, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (70993, 11, 2797.74, 3316.09, 147.891, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (70993, 12, 2791.83, 3285.33, 147.638, 0, 0, 0, 100, 0);

SET @GUID := 70994;
DELETE FROM `creature` WHERE `guid` = @GUID;
INSERT INTO `creature` VALUES (70994, 19853, 530, 1, 0, 0, 2828.05, 3064.03, 130.303, 1.4601, 300, 0, 0, 6326, 0, 0, 2);
DELETE FROM `creature_addon` WHERE `guid` = @GUID;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes0`,`bytes1`,`bytes2`,`emote`,`moveflags`,`auras`) VALUES (@GUID,@GUID,0,0,0,4097,0,0,'');
DELETE FROM `waypoint_data` WHERE `id` = @GUID;
INSERT INTO `waypoint_data` VALUES (70994, 1, 2825.41, 3085.07, 131.224, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (70994, 2, 2828.71, 3113.54, 132.875, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (70994, 3, 2834.66, 3132.81, 135.161, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (70994, 4, 2820.65, 3168.33, 138.358, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (70994, 5, 2834.66, 3132.81, 135.161, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (70994, 6, 2828.71, 3113.54, 132.875, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (70994, 7, 2825.41, 3085.07, 131.224, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (70994, 8, 2828.05, 3064.03, 130.303, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (70994, 9, 2808.24, 3051.48, 129.178, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (70994, 10, 2789.98, 3059.69, 127.263, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (70994, 11, 2808.24, 3051.48, 129.178, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (70994, 12, 2828.05, 3064.03, 130.303, 0, 0, 0, 100, 0);

-- Felblade Doomguard
DELETE FROM `creature_ai_scripts` WHERE `entryOrGUID` = 19853;
INSERT INTO `creature_ai_scripts` VALUES
('1985301','19853','9','0','100','1','0','5','8000','12000','11','32736','1','0','0','0','0','0','0','0','0','0','Felblade Doomguard - Cast Mortal Strike'),
('1985302','19853','0','0','100','1','7000','12000','15000','18000','11','35238','1','0','0','0','0','0','0','0','0','0','Felblade Doomguard - Cast War Stomp');

-- Artifact Seeker
DELETE FROM `creature_ai_scripts` WHERE `entryOrGUID` = 19852;
INSERT INTO `creature_ai_scripts` VALUES
('1985201','19852','0','0','100','1','5000','9000','12000','15000','11','11981','4','0','0','0','0','0','0','0','0','0','Artifact Seeker - Cast Mana Burn'),
('1985202','19852','9','0','25','1','0','30','10000','15000','11','30849','4','0','0','0','0','0','0','0','0','0','Artifact Seeker - Cast Spell Lock');

UPDATE `creature_loot_template` SET `ChanceOrQuestChance` =  2 WHERE `entry` = 19852 AND `item` = 29740; -- 4  
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 40 WHERE `entry` = 19852 AND `item` = 30809; -- 60

-- ====================================
-- Backport Missing Spell Script Target
-- ====================================
DELETE FROM `spell_script_target` WHERE `entry` = 38966 AND `targetEntry` = 22358;
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES ('38966','1','22358');

UPDATE `creature_template` SET `InhabitType` = 7 WHERE `entry` = 22358;

-- Gan'arg Mekgineer 
DELETE FROM `creature_ai_scripts` WHERE `entryOrGUID` IN (16949,-59073,-59072,-59071,-59068,-59061);
INSERT INTO `creature_ai_scripts` VALUES
('1694901','16949','9','0','100','1','0','5','13000','18000','11','36208','1','0','0','0','0','0','0','0','0','0','Gan\'arg Mekgineer - Cast Steal Weapon'),
('1694902','16949','2','0','100','1','80','0','10000','14000','11','36825','1','1','0','0','0','0','0','0','0','0','Gan\'arg Mekgineer - Cast Drain Life at 80% HP'),
('1694903','-59073','1','0','100','1','10000','10000','0','0','11','38966','0','0','0','0','0','0','0','0','0','0','59073 - Cast Nether Gas Drain OOC'),
('1694904','-59072','1','0','100','1','10000','10000','0','0','11','38966','0','0','0','0','0','0','0','0','0','0','59072 - Cast Nether Gas Drain OOC'),
('1694905','-59071','1','0','100','1','10000','10000','0','0','11','38966','0','0','0','0','0','0','0','0','0','0','59071 - Cast Nether Gas Drain OOC'),
('1694906','-59068','1','0','100','1','10000','10000','0','0','11','38966','0','0','0','0','0','0','0','0','0','0','59071 - Cast Nether Gas Drain OOC'),
('1694907','-59061','1','0','100','1','10000','10000','0','0','11','38966','0','0','0','0','0','0','0','0','0','0','59071 - Cast Nether Gas Drain OOC');

UPDATE `creature` SET `orientation` = 1.5812 WHERE `guid` = 59072;
UPDATE `creature` SET `position_x`='4418.6269', `position_y`='3266.4255', `position_z`='143.5857', `orientation` = 1.0808 WHERE `guid` = 59073;
UPDATE `creature` SET `position_x`='4429.4560', `position_y`='3325.6115', `position_z`='149.8019', `orientation`='4.7385',`spawndist`='0',`movementtype`='0' WHERE `guid` = 59061;
UPDATE `creature` SET `position_x`='4436.5288', `position_y`='3297.8327', `position_z`='147.6649', `orientation`='3.9317',`spawndist`='0',`movementtype`='0' WHERE `guid` = 59068;

-- ========================
-- Fix a Few Teleport Names
-- ========================
UPDATE areatrigger_teleport SET name='Blackfathom Deeps Entrance' WHERE id = 257;
UPDATE areatrigger_teleport SET name='Blackfathom Deeps Instance Start' WHERE id = 259;

-- ========================
-- Fix Incorrect NPC Levels
-- ========================
UPDATE creature_template SET MinLevel=70, MaxLevel=70 WHERE entry IN (23703,23808,24109);

DELETE FROM `creature_ai_scripts` WHERE `entryOrGUID` = 17146;
INSERT INTO `creature_ai_scripts` VALUES
('1714601','17146','4','0','100','0','0','0','0','0','22','1','0','0','0','0','0','0','0','0','0','0','Kil\'sorrow Spellbinder - Set Phase 1 on Aggro'),
('1714602','17146','9','13','100','1','0','40','3800','5200','11','34447','1','0','0','0','0','0','0','0','0','0','Kil\'sorrow Spellbinder - Cast Arcane Missiles (Phase 1)'),
('1714605','17146','0','0','100','1','3000','6000','10000','25000','11','22744','4','32','0','0','0','0','0','0','0','0','Kil\'sorrow Spellbinder - Cast Chains of Ice'),
('1714606','17146','13','0','100','1','15000','25000','0','0','11','31999','6','0','0','0','0','0','0','0','0','0','Kil\'sorrow Spellbinder - Cast Counterspell on Target Casting'),
('1714607','17146','2','0','100','0','15','0','0','0','22','2','0','0','0','0','0','0','0','0','0','0','Kil\'sorrow Spellbinder - Disable Dynamic Movement and Set Phase 2 at 15% HP'),
('1714608','17146','2','3','100','0','15','0','0','0','25','0','0','0','1','-47','0','0','0','0','0','0','Kil\'sorrow Spellbinder - Flee at 15% HP (Phase 2)'),
('1714609','17146','7','0','100','0','0','0','0','0','22','1','0','0','0','0','0','0','0','0','0','0','Kil\'sorrow Spellbinder - Set Phase 1 on Evade');

SET @GUID := 213226;
DELETE FROM `creature` WHERE `guid` = @GUID;
INSERT INTO `creature` VALUES (213226, 17146, 530, 1, 0, 0, -2966.4, 6450.86, 84.9613, 6.02139, 120, 0, 0, 1, 0, 0, 2);
DELETE FROM `creature_addon` WHERE `guid` = @GUID;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes0`,`bytes1`,`bytes2`,`emote`,`moveflags`,`auras`) VALUES (@GUID,@GUID,0,0,0,4097,0,0,'');
DELETE FROM `waypoint_data` WHERE `id` = @GUID;
INSERT INTO `waypoint_data` VALUES (213226, 1, -2966.4, 6450.86, 84.9613, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213226, 2, -2951.37, 6451.25, 84.0627, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213226, 3, -2947, 6458.42, 83.789, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213226, 4, -2933.37, 6459.89, 82.7113, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213226, 5, -2928.82, 6466.73, 82.4588, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213226, 6, -2933.26, 6499.88, 81.9824, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213226, 7, -2932.74, 6517.53, 76.6046, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213226, 8, -2924.63, 6533.38, 69.0531, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213226, 9, -2899.83, 6556.31, 55.6965, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213226, 10, -2878.8, 6570.99, 49.0144, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213226, 11, -2855.89, 6555.95, 40.8154, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213226, 12, -2878.8, 6570.99, 49.0144, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213226, 13, -2899.83, 6556.31, 55.6965, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213226, 14, -2924.47, 6533.66, 69.2228, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213226, 15, -2932.74, 6517.53, 76.6046, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213226, 16, -2933.26, 6499.88, 81.9824, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213226, 17, -2928.82, 6466.73, 82.4588, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213226, 18, -2933.37, 6459.89, 82.7113, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213226, 19, -2947, 6458.42, 83.789, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213226, 20, -2951.37, 6451.25, 84.0627, 0, 0, 0, 100, 0);

SET @GUID := 213228;
DELETE FROM `creature` WHERE `guid` = @GUID;
INSERT INTO `creature` VALUES (213228, 17146, 530, 1, 0, 0, -2886.38, 6580.41, 49.8269, 4.69848, 120, 0, 0, 1, 0, 0, 2);
DELETE FROM `creature_addon` WHERE `guid` = @GUID;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes0`,`bytes1`,`bytes2`,`emote`,`moveflags`,`auras`) VALUES (@GUID,@GUID,0,0,0,4097,0,0,'');
DELETE FROM `waypoint_data` WHERE `id` = @GUID;
INSERT INTO `waypoint_data` VALUES (213228, 1, -2886.38, 6580.41, 49.8269, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213228, 2, -2889.3, 6558.6, 52.2075, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213228, 3, -2875.24, 6533.18, 54.3797, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213228, 4, -2866.9, 6523.68, 56.611, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213228, 5, -2845.4, 6500.21, 62.0201, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213228, 6, -2833.53, 6486.23, 62.8773, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213228, 7, -2822.09, 6466.06, 63.0564, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213228, 8, -2813.89, 6437.62, 63.468, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213228, 9, -2800.38, 6432.74, 62.709, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213228, 10, -2782.43, 6431.98, 61.0414, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213228, 11, -2800.38, 6432.74, 62.709, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213228, 12, -2813.89, 6437.62, 63.468, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213228, 13, -2822.09, 6466.06, 63.0564, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213228, 14, -2833.53, 6486.23, 62.8773, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213228, 15, -2845.4, 6500.21, 62.0201, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213228, 16, -2866.9, 6523.68, 56.611, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213228, 17, -2875.24, 6533.18, 54.3797, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213228, 18, -2889.3, 6558.57, 52.3054, 0, 0, 0, 100, 0);

SET @GUID := 213230;
DELETE FROM `creature` WHERE `guid` = @GUID;
INSERT INTO `creature` VALUES (213230, 17146, 530, 1, 0, 0, -2796.05, 6424.33, 62.2587, 4.57283, 120, 0, 0, 1, 0, 0, 2);
DELETE FROM `creature_addon` WHERE `guid` = @GUID;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes0`,`bytes1`,`bytes2`,`emote`,`moveflags`,`auras`) VALUES (@GUID,@GUID,0,0,0,4097,0,0,'');
DELETE FROM `waypoint_data` WHERE `id` = @GUID;
INSERT INTO `waypoint_data` VALUES (213230, 1, -2796.05, 6424.33, 62.2587, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213230, 2, -2800.32, 6399.67, 62.3427, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213230, 3, -2799.68, 6388.98, 63.1902, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213230, 4, -2792.21, 6366.48, 63.539, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213230, 5, -2800.33, 6352.1, 63.5415, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213230, 6, -2811.06, 6333.32, 63.7155, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213230, 7, -2820.25, 6313.48, 63.6547, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213230, 8, -2833.45, 6304.56, 65.4983, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213230, 9, -2867.44, 6307.76, 77.5428, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213230, 10, -2878.42, 6326.38, 83.0269, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213230, 11, -2867.44, 6307.76, 77.5428, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213230, 12, -2833.45, 6304.56, 65.4983, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213230, 13, -2820.25, 6313.48, 63.6547, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213230, 14, -2811.06, 6333.32, 63.7155, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213230, 15, -2800.33, 6352.1, 63.5415, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213230, 16, -2792.21, 6366.48, 63.539, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213230, 17, -2799.68, 6388.98, 63.1902, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213230, 18, -2800.32, 6399.67, 62.3427, 0, 0, 0, 100, 0);

SET @GUID := 213232;
DELETE FROM `creature` WHERE `guid` = @GUID;
INSERT INTO `creature` VALUES (213232, 17146, 530, 1, 0, 0, -2858.22, 6466.86, 82.7523, 4.78882, 120, 0, 0, 1, 0, 0, 2);
DELETE FROM `creature_addon` WHERE `guid` = @GUID;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes0`,`bytes1`,`bytes2`,`emote`,`moveflags`,`auras`) VALUES (@GUID,@GUID,0,0,0,4097,0,0,'');
DELETE FROM `waypoint_data` WHERE `id` = @GUID;
INSERT INTO `waypoint_data` VALUES (213232, 1, -2858.22, 6466.86, 82.7523, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213232, 2, -2857.82, 6444.06, 82.7555, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213232, 3, -2866.55, 6441.65, 82.7555, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213232, 4, -2879.88, 6432.94, 82.391, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213232, 5, -2899.29, 6416.39, 82.0454, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213232, 6, -2913.05, 6413.21, 82.4074, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213232, 7, -2923.44, 6433.53, 82.4613, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213232, 8, -2929.06, 6459.67, 82.5863, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213232, 9, -2943.93, 6460.14, 83.4324, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213232, 10, -2947.45, 6466.74, 84.1551, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213232, 11, -2972.28, 6499.88, 91.3397, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213232, 12, -2982.89, 6518.87, 96.93, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213232, 13, -2981.05, 6533.41, 97.7926, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213232, 14, -2989.64, 6543.23, 97.7926, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213232, 15, -2999.92, 6546.72, 97.9176, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213232, 16, -2989.64, 6543.23, 97.7926, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213232, 17, -2981.05, 6533.41, 97.7926, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213232, 18, -2982.89, 6518.87, 96.93, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213232, 19, -2972.28, 6499.88, 91.3397, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213232, 20, -2947.45, 6466.74, 84.1551, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213232, 21, -2943.93, 6460.14, 83.4324, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213232, 22, -2929.06, 6459.67, 82.5863, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213232, 23, -2923.44, 6433.53, 82.4613, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213232, 24, -2913.05, 6413.21, 82.4074, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213232, 25, -2899.29, 6416.39, 82.0454, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213232, 26, -2879.88, 6432.94, 82.391, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213232, 27, -2866.55, 6441.65, 82.7555, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213232, 28, -2857.82, 6444.06, 82.7555, 0, 0, 0, 100, 0);

SET @GUID := 213234;
DELETE FROM `creature` WHERE `guid` = @GUID;
INSERT INTO `creature` VALUES (213234, 17146, 530, 1, 0, 0, -2932.35, 6330.25, 88.433, 1.20348, 120, 0, 0, 1, 0, 0, 2);
DELETE FROM `creature_addon` WHERE `guid` = @GUID;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes0`,`bytes1`,`bytes2`,`emote`,`moveflags`,`auras`) VALUES (@GUID,@GUID,0,0,0,4097,0,0,'');
DELETE FROM `waypoint_data` WHERE `id` = @GUID;
INSERT INTO `waypoint_data` VALUES (213234, 1, -2932.35, 6330.25, 88.433, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213234, 2, -2923.53, 6348.93, 88.307, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213234, 3, -2911.74, 6366.64, 86.1228, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213234, 4, -2911.89, 6383.02, 84.7382, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213234, 5, -2900.08, 6384.46, 82.6592, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213234, 6, -2866.76, 6392.46, 80.9828, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213234, 7, -2853.95, 6386.78, 79.655, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213234, 8, -2842.02, 6385.77, 79.3811, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213234, 9, -2857.75, 6387.74, 80.248, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213234, 10, -2857.46, 6398.6, 79.3188, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213234, 11, -2834.58, 6418.43, 71.1324, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213234, 12, -2819.07, 6434.31, 64.0141, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213234, 13, -2834.58, 6418.43, 71.1324, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213234, 14, -2857.46, 6398.6, 79.3188, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213234, 15, -2857.75, 6387.74, 80.248, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213234, 16, -2842.02, 6385.77, 79.3811, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213234, 17, -2853.95, 6386.78, 79.655, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213234, 18, -2866.76, 6392.46, 80.9828, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213234, 19, -2900.08, 6384.46, 82.6592, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213234, 20, -2911.89, 6383.02, 84.7382, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213234, 21, -2911.74, 6366.64, 86.1228, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (213234, 22, -2923.53, 6348.93, 88.307, 0, 0, 0, 100, 0);

DELETE FROM `game_event_creature` WHERE `guid` IN (208280,208293,208306,207967,207993,207993);
INSERT INTO `game_event_creature` VALUES
(208280,18),
(207967,18),
(208293,19),
(208006,19),
(208306,21),
(207993,21);

SET @GUID := 208306;
DELETE FROM `creature` WHERE `guid` = @GUID;
INSERT INTO `creature` VALUES (208306, 22015, 530, 1, 0, 0, 9513.21, -7281.77, 14.0154, 3.16165, 120, 0, 0, 1, 0, 0, 2);
DELETE FROM `creature_addon` WHERE `guid` = @GUID;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes0`,`bytes1`,`bytes2`,`emote`,`moveflags`,`auras`) VALUES (@GUID,@GUID,0,0,0,4097,0,0,'');
DELETE FROM `waypoint_data` WHERE `id` = @GUID;
INSERT INTO `waypoint_data` VALUES (208306, 1, 9513.21, -7281.77, 14.0154, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208306, 2, 9507.63, -7299.16, 14.1154, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208306, 3, 9515.57, -7319.61, 14.1189, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208306, 4, 9542.46, -7320.01, 14.1007, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208306, 5, 9585.5, -7322.02, 14.111, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208306, 6, 9599.2, -7335.31, 14.0965, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208306, 7, 9599.59, -7363.96, 13.4386, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208306, 8, 9618.38, -7369.91, 14.3668, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208306, 9, 9619.29, -7383.71, 14.7318, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208306, 10, 9590.54, -7383.63, 13.4589, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208306, 11, 9589.82, -7400.06, 13.3031, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208306, 12, 9595.09, -7419.61, 13.3051, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208306, 13, 9611.4, -7432.2, 13.3069, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208306, 14, 9647.76, -7431.5, 13.294, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208306, 15, 9662.46, -7434.24, 13.2933, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208306, 16, 9688.15, -7441.58, 13.2933, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208306, 17, 9719.5, -7424.93, 13.2933, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208306, 18, 9768.13, -7424.33, 13.3861, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208306, 19, 9768.68, -7441.7, 14.3929, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208306, 20, 9793.08, -7442.29, 14.3767, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208306, 21, 9794.43, -7424.12, 13.5046, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208306, 22, 9821.16, -7424.12, 13.3038, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208306, 23, 9867.97, -7425.04, 13.2829, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208306, 24, 9884.41, -7422.78, 13.2651, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208306, 25, 9890.15, -7413.51, 13.2649, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208306, 26, 9892.01, -7389.04, 13.5591, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208306, 27, 9895.59, -7384.54, 15.3057, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208306, 28, 9895.6, -7365.38, 20.7113, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208306, 29, 9895.52, -7319.92, 23.2204, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208306, 30, 9874.08, -7314.13, 26.2839, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208306, 31, 9855.79, -7311.02, 26.2989, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208306, 32, 9838.25, -7288.56, 26.3157, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208306, 33, 9815.98, -7278.05, 26.3237, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208306, 34, 9785.61, -7298.04, 25.8062, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208306, 35, 9757.03, -7316.12, 24.411, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208306, 36, 9733.63, -7326.16, 24.4111, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208306, 37, 9704.81, -7331.63, 11.8255, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208306, 38, 9685.28, -7334.18, 12.3784, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208306, 39, 9673.97, -7334.17, 12.3667, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208306, 40, 9671.04, -7311.83, 13.9285, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208306, 41, 9653.96, -7310.7, 14.9551, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208306, 42, 9653.58, -7297.51, 14.9571, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208306, 43, 9672.95, -7296.59, 13.9357, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208306, 44, 9673.49, -7280.96, 14.0506, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208306, 45, 9641.17, -7280.8, 13.9914, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208306, 46, 9600.86, -7280.09, 13.987, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208306, 47, 9575.57, -7279.78, 13.9855, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208306, 48, 9539.29, -7280.51, 13.9941, 0, 0, 0, 100, 0);

SET @GUID := 208293;
DELETE FROM `creature` WHERE `guid` = @GUID;
INSERT INTO `creature` VALUES (208293, 15105, 530, 1, 0, 0, 9513.21, -7281.77, 14.0154, 3.16165, 120, 0, 0, 1, 0, 0, 2);
DELETE FROM `creature_addon` WHERE `guid` = @GUID;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes0`,`bytes1`,`bytes2`,`emote`,`moveflags`,`auras`) VALUES (@GUID,@GUID,0,0,0,4097,0,0,'');
DELETE FROM `waypoint_data` WHERE `id` = @GUID;
INSERT INTO `waypoint_data` VALUES (208293, 1, 9513.21, -7281.77, 14.0154, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208293, 2, 9507.63, -7299.16, 14.1154, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208293, 3, 9515.57, -7319.61, 14.1189, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208293, 4, 9542.46, -7320.01, 14.1007, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208293, 5, 9585.5, -7322.02, 14.111, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208293, 6, 9599.2, -7335.31, 14.0965, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208293, 7, 9599.59, -7363.96, 13.4386, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208293, 8, 9618.38, -7369.91, 14.3668, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208293, 9, 9619.29, -7383.71, 14.7318, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208293, 10, 9590.54, -7383.63, 13.4589, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208293, 11, 9589.82, -7400.06, 13.3031, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208293, 12, 9595.09, -7419.61, 13.3051, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208293, 13, 9611.4, -7432.2, 13.3069, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208293, 14, 9647.76, -7431.5, 13.294, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208293, 15, 9662.46, -7434.24, 13.2933, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208293, 16, 9688.15, -7441.58, 13.2933, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208293, 17, 9719.5, -7424.93, 13.2933, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208293, 18, 9768.13, -7424.33, 13.3861, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208293, 19, 9768.68, -7441.7, 14.3929, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208293, 20, 9793.08, -7442.29, 14.3767, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208293, 21, 9794.43, -7424.12, 13.5046, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208293, 22, 9821.16, -7424.12, 13.3038, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208293, 23, 9867.97, -7425.04, 13.2829, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208293, 24, 9884.41, -7422.78, 13.2651, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208293, 25, 9890.15, -7413.51, 13.2649, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208293, 26, 9892.01, -7389.04, 13.5591, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208293, 27, 9895.59, -7384.54, 15.3057, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208293, 28, 9895.6, -7365.38, 20.7113, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208293, 29, 9895.52, -7319.92, 23.2204, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208293, 30, 9874.08, -7314.13, 26.2839, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208293, 31, 9855.79, -7311.02, 26.2989, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208293, 32, 9838.25, -7288.56, 26.3157, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208293, 33, 9815.98, -7278.05, 26.3237, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208293, 34, 9785.61, -7298.04, 25.8062, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208293, 35, 9757.03, -7316.12, 24.411, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208293, 36, 9733.63, -7326.16, 24.4111, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208293, 37, 9704.81, -7331.63, 11.8255, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208293, 38, 9685.28, -7334.18, 12.3784, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208293, 39, 9673.97, -7334.17, 12.3667, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208293, 40, 9671.04, -7311.83, 13.9285, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208293, 41, 9653.96, -7310.7, 14.9551, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208293, 42, 9653.58, -7297.51, 14.9571, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208293, 43, 9672.95, -7296.59, 13.9357, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208293, 44, 9673.49, -7280.96, 14.0506, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208293, 45, 9641.17, -7280.8, 13.9914, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208293, 46, 9600.86, -7280.09, 13.987, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208293, 47, 9575.57, -7279.78, 13.9855, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208293, 48, 9539.29, -7280.51, 13.9941, 0, 0, 0, 100, 0);

SET @GUID := 208280;
DELETE FROM `creature` WHERE `guid` = @GUID;
INSERT INTO `creature` VALUES (208280, 15106, 530, 1, 0, 0, 9513.21, -7281.77, 14.0154, 3.16165, 120, 0, 0, 1, 0, 0, 2);
DELETE FROM `creature_addon` WHERE `guid` = @GUID;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes0`,`bytes1`,`bytes2`,`emote`,`moveflags`,`auras`) VALUES (@GUID,@GUID,0,0,0,4097,0,0,'');
DELETE FROM `waypoint_data` WHERE `id` = @GUID;
INSERT INTO `waypoint_data` VALUES (208280, 1, 9513.21, -7281.77, 14.0154, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208280, 2, 9507.63, -7299.16, 14.1154, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208280, 3, 9515.57, -7319.61, 14.1189, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208280, 4, 9542.46, -7320.01, 14.1007, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208280, 5, 9585.5, -7322.02, 14.111, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208280, 6, 9599.2, -7335.31, 14.0965, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208280, 7, 9599.59, -7363.96, 13.4386, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208280, 8, 9618.38, -7369.91, 14.3668, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208280, 9, 9619.29, -7383.71, 14.7318, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208280, 10, 9590.54, -7383.63, 13.4589, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208280, 11, 9589.82, -7400.06, 13.3031, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208280, 12, 9595.09, -7419.61, 13.3051, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208280, 13, 9611.4, -7432.2, 13.3069, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208280, 14, 9647.76, -7431.5, 13.294, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208280, 15, 9662.46, -7434.24, 13.2933, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208280, 16, 9688.15, -7441.58, 13.2933, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208280, 17, 9719.5, -7424.93, 13.2933, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208280, 18, 9768.13, -7424.33, 13.3861, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208280, 19, 9768.68, -7441.7, 14.3929, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208280, 20, 9793.08, -7442.29, 14.3767, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208280, 21, 9794.43, -7424.12, 13.5046, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208280, 22, 9821.16, -7424.12, 13.3038, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208280, 23, 9867.97, -7425.04, 13.2829, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208280, 24, 9884.41, -7422.78, 13.2651, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208280, 25, 9890.15, -7413.51, 13.2649, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208280, 26, 9892.01, -7389.04, 13.5591, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208280, 27, 9895.59, -7384.54, 15.3057, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208280, 28, 9895.6, -7365.38, 20.7113, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208280, 29, 9895.52, -7319.92, 23.2204, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208280, 30, 9874.08, -7314.13, 26.2839, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208280, 31, 9855.79, -7311.02, 26.2989, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208280, 32, 9838.25, -7288.56, 26.3157, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208280, 33, 9815.98, -7278.05, 26.3237, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208280, 34, 9785.61, -7298.04, 25.8062, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208280, 35, 9757.03, -7316.12, 24.411, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208280, 36, 9733.63, -7326.16, 24.4111, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208280, 37, 9704.81, -7331.63, 11.8255, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208280, 38, 9685.28, -7334.18, 12.3784, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208280, 39, 9673.97, -7334.17, 12.3667, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208280, 40, 9671.04, -7311.83, 13.9285, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208280, 41, 9653.96, -7310.7, 14.9551, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208280, 42, 9653.58, -7297.51, 14.9571, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208280, 43, 9672.95, -7296.59, 13.9357, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208280, 44, 9673.49, -7280.96, 14.0506, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208280, 45, 9641.17, -7280.8, 13.9914, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208280, 46, 9600.86, -7280.09, 13.987, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208280, 47, 9575.57, -7279.78, 13.9855, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208280, 48, 9539.29, -7280.51, 13.9941, 0, 0, 0, 100, 0);

SET @GUID := 208006;
DELETE FROM `creature` WHERE `guid` = @GUID;
INSERT INTO `creature` VALUES (208006, 15102, 530, 1, 0, 0, -3893.99, -11617.7, -137.819, 4.22421, 120, 0, 0, 1, 0, 0, 2);
DELETE FROM `creature_addon` WHERE `guid` = @GUID;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes0`,`bytes1`,`bytes2`,`emote`,`moveflags`,`auras`) VALUES (@GUID,@GUID,0,0,0,4097,0,0,'');
DELETE FROM `waypoint_data` WHERE `id` = @GUID;
INSERT INTO `waypoint_data` VALUES (208006, 1, -3964.45, -11640.5, -138.885, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208006, 2, -3977.58, -11670.5, -139.101, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208006, 3, -4004.9, -11674.4, -136.258, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208006, 4, -4040.58, -11678.3, -135.551, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208006, 5, -4084.33, -11680.2, -142.4, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208006, 6, -4122.19, -11676.7, -142.825, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208006, 7, -4142.92, -11653, -138.991, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208006, 8, -4148.69, -11618.2, -139.283, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208006, 9, -4138.79, -11590.3, -139.249, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208006, 10, -4119.15, -11546.3, -135.956, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208006, 11, -4085.58, -11518.1, -135.447, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208006, 12, -4068.37, -11500.5, -134.835, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208006, 13, -4056.03, -11488.4, -141.254, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208006, 14, -4018.48, -11464.7, -137.378, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208006, 15, -3976.18, -11439.8, -136.797, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208006, 16, -3928.11, -11436.4, -134.023, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208006, 17, -3892.42, -11433.1, -132.707, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208006, 18, -3848.74, -11450.4, -132.263, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208006, 19, -3826.28, -11455.8, -138.489, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208006, 20, -3819.67, -11478.8, -138.495, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208006, 21, -3833.27, -11513.5, -138.786, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208006, 22, -3846.51, -11539.5, -139.024, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208006, 23, -3865.31, -11561.5, -133.02, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208006, 24, -3883.13, -11597.2, -135.418, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208006, 25, -3895.45, -11620.5, -137.825, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (208006, 26, -3929.28, -11612.4, -138.556, 0, 0, 0, 100, 0);

SET @GUID := 207993;
DELETE FROM `creature` WHERE `guid` = @GUID;
INSERT INTO `creature` VALUES (207993, 22013, 530, 1, 0, 0, -3893.99, -11617.7, -137.819, 4.22421, 120, 0, 0, 1, 0, 0, 2);
DELETE FROM `creature_addon` WHERE `guid` = @GUID;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes0`,`bytes1`,`bytes2`,`emote`,`moveflags`,`auras`) VALUES (@GUID,@GUID,0,0,0,4097,0,0,'');
DELETE FROM `waypoint_data` WHERE `id` = @GUID;
INSERT INTO `waypoint_data` VALUES (207993, 1, -3964.45, -11640.5, -138.885, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (207993, 2, -3977.58, -11670.5, -139.101, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (207993, 3, -4004.9, -11674.4, -136.258, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (207993, 4, -4040.58, -11678.3, -135.551, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (207993, 5, -4084.33, -11680.2, -142.4, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (207993, 6, -4122.19, -11676.7, -142.825, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (207993, 7, -4142.92, -11653, -138.991, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (207993, 8, -4148.69, -11618.2, -139.283, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (207993, 9, -4138.79, -11590.3, -139.249, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (207993, 10, -4119.15, -11546.3, -135.956, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (207993, 11, -4085.58, -11518.1, -135.447, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (207993, 12, -4068.37, -11500.5, -134.835, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (207993, 13, -4056.03, -11488.4, -141.254, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (207993, 14, -4018.48, -11464.7, -137.378, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (207993, 15, -3976.18, -11439.8, -136.797, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (207993, 16, -3928.11, -11436.4, -134.023, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (207993, 17, -3892.42, -11433.1, -132.707, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (207993, 18, -3848.74, -11450.4, -132.263, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (207993, 19, -3826.28, -11455.8, -138.489, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (207993, 20, -3819.67, -11478.8, -138.495, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (207993, 21, -3833.27, -11513.5, -138.786, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (207993, 22, -3846.51, -11539.5, -139.024, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (207993, 23, -3865.31, -11561.5, -133.02, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (207993, 24, -3883.13, -11597.2, -135.418, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (207993, 25, -3895.45, -11620.5, -137.825, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (207993, 26, -3929.28, -11612.4, -138.556, 0, 0, 0, 100, 0);

SET @GUID := 207967;
DELETE FROM `creature` WHERE `guid` = @GUID;
INSERT INTO `creature` VALUES (207967, 15103, 530, 1, 0, 0, -3893.99, -11617.7, -137.819, 4.22421, 120, 0, 0, 1, 0, 0, 2);
DELETE FROM `creature_addon` WHERE `guid` = @GUID;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes0`,`bytes1`,`bytes2`,`emote`,`moveflags`,`auras`) VALUES (@GUID,@GUID,0,0,0,4097,0,0,'');
DELETE FROM `waypoint_data` WHERE `id` = @GUID;
INSERT INTO `waypoint_data` VALUES (207967, 1, -3964.45, -11640.5, -138.885, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (207967, 2, -3977.58, -11670.5, -139.101, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (207967, 3, -4004.9, -11674.4, -136.258, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (207967, 4, -4040.58, -11678.3, -135.551, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (207967, 5, -4084.33, -11680.2, -142.4, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (207967, 6, -4122.19, -11676.7, -142.825, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (207967, 7, -4142.92, -11653, -138.991, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (207967, 8, -4148.69, -11618.2, -139.283, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (207967, 9, -4138.79, -11590.3, -139.249, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (207967, 10, -4119.15, -11546.3, -135.956, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (207967, 11, -4085.58, -11518.1, -135.447, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (207967, 12, -4068.37, -11500.5, -134.835, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (207967, 13, -4056.03, -11488.4, -141.254, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (207967, 14, -4018.48, -11464.7, -137.378, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (207967, 15, -3976.18, -11439.8, -136.797, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (207967, 16, -3928.11, -11436.4, -134.023, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (207967, 17, -3892.42, -11433.1, -132.707, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (207967, 18, -3848.74, -11450.4, -132.263, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (207967, 19, -3826.28, -11455.8, -138.489, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (207967, 20, -3819.67, -11478.8, -138.495, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (207967, 21, -3833.27, -11513.5, -138.786, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (207967, 22, -3846.51, -11539.5, -139.024, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (207967, 23, -3865.31, -11561.5, -133.02, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (207967, 24, -3883.13, -11597.2, -135.418, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (207967, 25, -3895.45, -11620.5, -137.825, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (207967, 26, -3929.28, -11612.4, -138.556, 0, 0, 0, 100, 0);

UPDATE `creature_ai_scripts` SET `event_param4`='30000' WHERE `id` = 1873302;

SET @GUID := 203341;
DELETE FROM `creature` WHERE `guid` = @GUID;
INSERT INTO `creature` VALUES (203341, 18733, 530, 1, 0, 0, -364.287, 2352.71, 44.9963, 4.7173, 120, 0, 0, 104790, 0, 0, 2);
DELETE FROM `creature_addon` WHERE `guid` = @GUID;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes0`,`bytes1`,`bytes2`,`emote`,`moveflags`,`auras`) VALUES (@GUID,@GUID,0,0,0,4097,0,0,'');
DELETE FROM `waypoint_data` WHERE `id` = @GUID;
INSERT INTO `waypoint_data` VALUES (203341, 1, -396.732, 2353.48, 42.8293, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 2, -433.011, 2332.24, 42.2831, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 3, -460.553, 2299.43, 46.267, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 4, -463.005, 2292.11, 47.4307, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 5, -467.389, 2283.12, 46.7574, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 6, -474.756, 2266.35, 49.3549, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 7, -467.641, 2237.31, 55.2768, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 8, -465.881, 2230.17, 58.7365, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 9, -464.401, 2225.98, 60.2459, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 10, -448.92, 2199.05, 67.1293, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 11, -445.207, 2176.25, 72.5264, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 12, -443.687, 2168.23, 78.7543, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 13, -442.261, 2162.27, 82.0928, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 14, -438.777, 2149.81, 85.1234, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 15, -433.845, 2132.33, 86.0215, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 16, -428.927, 2098.56, 89.4473, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 17, -429.907, 2066.63, 92.4416, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 18, -445.972, 2035.4, 92.1427, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 19, -464.185, 2001.29, 89.5375, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 20, -496.362, 1975.11, 85.6567, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 21, -533.417, 1964.81, 81.8386, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 22, -567.365, 1961.81, 83.2272, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 23, -600.236, 1959.2, 81.8364, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 24, -634.51, 1955.99, 68.8353, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 25, -661.756, 1968.62, 56.9629, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 26, -656.163, 2001.09, 59.3262, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 27, -652.909, 2032.13, 58.3262, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 28, -650.557, 2060.02, 55.2743, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 29, -658.025, 2095.6, 47.9485, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 30, -684.689, 2130.01, 35.9625, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 31, -723.516, 2131.91, 25.6156, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 32, -767.263, 2144.27, 18.5405, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 33, -800.515, 2157.22, 13.1139, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 34, -831.426, 2173.86, 10.3916, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 35, -861.357, 2199.43, 8.52931, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 36, -893.119, 2232.19, 7.79939, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 37, -917.94, 2265.43, 2.50661, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 38, -927.768, 2297.97, -1.163, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 39, -965.974, 2330.7, 0.501285, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 40, -1000.88, 2347.8, 6.61391, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 41, -1034.68, 2363.56, 13.4827, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 42, -1067.91, 2382.87, 18.8348, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 43, -1100.19, 2392.05, 22.8642, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 44, -1106.51, 2416.3, 24.2068, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 45, -1109.03, 2424.92, 28.0217, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 46, -1111.97, 2432.59, 29.9311, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 47, -1105.45, 2450.61, 30.3286, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 48, -1101.45, 2462.78, 26.3308, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 49, -1074.16, 2498.22, 18.4042, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 50, -1037.11, 2523.45, 12.1443, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 51, -1012.68, 2533.63, 7.98599, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 52, -987.539, 2554.32, 4.12118, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 53, -982.403, 2558.57, 3.01008, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 54, -980.616, 2564.53, 4.20475, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 55, -972.299, 2600.28, 8.46044, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 56, -972.622, 2631.13, 11.5854, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 57, -980.114, 2664.96, 13.6647, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 58, -990.855, 2697.28, 10.9134, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 59, -991.26, 2732.51, 8.31083, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 60, -996.498, 2765.78, 1.30578, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 61, -999.518, 2800.76, -3.50592, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 62, -996.57, 2833.21, -4.75592, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 63, -1018.02, 2856.44, -7.5543, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 64, -1048.08, 2868.97, -3.45129, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 65, -1085.52, 2886.75, -2.72399, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 66, -1124.94, 2894.54, -4.59645, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 67, -1153.03, 2915.35, -2.22034, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 68, -1187.76, 2933.76, 1.52476, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 69, -1224.35, 2945.39, 3.54799, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 70, -1265.08, 2969.53, 9.65602, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 71, -1280.69, 2998.9, 13.963, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 72, -1260.76, 3032.55, 20.853, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 73, -1223.28, 3049.02, 23.5756, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 74, -1191.54, 3054.65, 23.4803, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 75, -1161.4, 3056.22, 23.9861, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 76, -1130.2, 3067.4, 25.4924, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 77, -1096.27, 3065.61, 23.0976, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 78, -1063.29, 3069.25, 23.2798, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 79, -1029.84, 3092.15, 26.9048, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 80, -999.144, 3127.2, 29.7198, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 81, -966.555, 3132.36, 26.7815, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 82, -932.497, 3117.87, 18.8813, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 83, -907.572, 3103.69, 15.5063, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 84, -903.848, 3067.35, 14.7515, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 85, -913.787, 3034.17, 11.5429, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 86, -914.56, 2998.17, 12.2135, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 87, -900.704, 2963.75, 9.89994, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 88, -870.16, 2939.48, 7.58738, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 89, -854.741, 2936.6, 5.23851, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 90, -842.909, 2935.44, 8.93008, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 91, -834.777, 2934.65, 9.83738, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 92, -798.149, 2944.98, 13.1524, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 93, -766.563, 2949.09, 17.4123, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 94, -732.521, 2967.13, 21.4832, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 95, -766.563, 2949.09, 17.4123, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 96, -798.149, 2944.98, 13.1524, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 97, -834.777, 2934.65, 9.83738, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 98, -842.909, 2935.44, 8.93008, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 99, -854.741, 2936.6, 5.23851, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 100, -870.04, 2939.39, 7.58738, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 101, -900.704, 2963.75, 9.89994, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 102, -914.543, 2998.09, 12.2135, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 103, -913.769, 3034.09, 11.5429, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 104, -903.848, 3067.35, 14.7515, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 105, -907.572, 3103.69, 15.5063, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 106, -932.497, 3117.87, 18.8813, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 107, -966.535, 3132.36, 26.7815, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 108, -999.144, 3127.2, 29.7198, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 109, -1029.84, 3092.15, 26.9048, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 110, -1063.29, 3069.25, 23.2798, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 111, -1096.24, 3065.61, 23.0976, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 112, -1130.2, 3067.4, 25.4924, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 113, -1161.4, 3056.22, 23.9861, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 114, -1191.54, 3054.65, 23.4803, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 115, -1223.28, 3049.02, 23.5756, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 116, -1260.76, 3032.55, 20.853, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 117, -1280.64, 2999, 14.213, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 118, -1265.08, 2969.53, 9.65602, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 119, -1224.35, 2945.39, 3.54799, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 120, -1187.76, 2933.76, 1.52476, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 121, -1153.03, 2915.35, -2.22034, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 122, -1124.94, 2894.54, -4.59645, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 123, -1085.73, 2886.77, -2.72399, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 124, -1048.08, 2868.97, -3.45129, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 125, -1018.02, 2856.44, -7.5543, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 126, -996.57, 2833.21, -4.75592, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 127, -999.518, 2800.76, -3.50592, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 128, -996.498, 2765.78, 1.30578, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 129, -991.26, 2732.51, 8.31083, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 130, -990.855, 2697.28, 10.9134, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 131, -980.098, 2665, 13.6647, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 132, -972.622, 2631.13, 11.5854, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 133, -972.299, 2600.28, 8.46044, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 134, -980.616, 2564.53, 4.20475, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 135, -982.403, 2558.57, 3.01008, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 136, -1012.68, 2533.63, 7.98599, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 137, -1037.11, 2523.45, 12.1443, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 138, -1074.16, 2498.22, 18.4042, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 139, -1101.45, 2462.78, 26.3308, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 140, -1111.97, 2432.59, 29.9311, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 141, -1109.03, 2424.92, 28.0217, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 142, -1106.51, 2416.3, 24.2068, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 143, -1100.19, 2392.05, 22.8642, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 144, -1067.91, 2382.87, 18.8348, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 145, -1034.68, 2363.56, 13.4827, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 146, -1000.88, 2347.8, 6.61391, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 147, -965.974, 2330.7, 0.501285, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 148, -927.816, 2298.15, -1.163, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 149, -917.988, 2265.61, 2.50661, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 150, -893.119, 2232.19, 7.79939, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 151, -861.357, 2199.43, 8.52931, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 152, -831.426, 2173.86, 10.3916, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 153, -800.515, 2157.22, 13.1139, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 154, -767.263, 2144.27, 18.5405, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 155, -723.516, 2131.91, 25.6156, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 156, -684.689, 2130.01, 35.9625, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 157, -658.025, 2095.6, 47.9485, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 158, -650.52, 2060.31, 55.2743, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 159, -652.909, 2032.13, 58.3262, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 160, -656.163, 2001.09, 59.3262, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 161, -661.998, 1968.73, 56.9629, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 162, -634.51, 1955.99, 68.8353, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 163, -600.643, 1959.15, 81.8364, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 164, -567.365, 1961.81, 83.2272, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 165, -533.417, 1964.81, 81.8386, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 166, -496.362, 1975.11, 85.6567, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 167, -464.185, 2001.29, 89.5375, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 168, -445.972, 2035.4, 92.1427, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 169, -429.907, 2066.63, 92.4416, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 170, -428.927, 2098.56, 89.4473, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 171, -433.845, 2132.33, 86.0215, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 172, -438.777, 2149.81, 85.1234, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 173, -442.261, 2162.27, 82.0928, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 174, -443.602, 2168.03, 78.7543, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 175, -445.207, 2176.25, 72.5264, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 176, -448.92, 2199.05, 67.1293, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 177, -464.401, 2225.98, 60.2459, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 178, -465.881, 2230.17, 58.7365, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 179, -467.641, 2237.31, 55.2768, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 180, -474.866, 2266.15, 49.3549, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 181, -467.389, 2283.12, 46.7574, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 182, -463.005, 2292.11, 47.4307, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 183, -460.553, 2299.43, 46.267, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 184, -433.011, 2332.24, 42.2831, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 185, -396.732, 2353.48, 42.8293, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 186, -364.287, 2352.71, 44.9963, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 187, -333.041, 2331.04, 50.2793, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 188, -300.742, 2304.88, 53.2793, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 189, -264.549, 2295.51, 59.5944, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 190, -246.717, 2292.99, 59.5577, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 191, -236.38, 2291.84, 54.4694, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 192, -203.761, 2281.04, 57.7685, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 193, -197.01, 2279.36, 61.9845, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 194, -194.157, 2281.51, 65.3524, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 195, -168.441, 2300.09, 66.9371, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 196, -137.249, 2333.82, 64.5901, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 197, -106.825, 2366.73, 58.4316, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 198, -68.0807, 2391.69, 54.53, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 199, -33.7658, 2410.91, 56.7199, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 200, -1.49414, 2436.21, 52.7178, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 201, 35.6428, 2450.32, 52.1388, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 202, 69.0965, 2447.91, 54.1903, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 203, 101.983, 2444.25, 54.0714, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 204, 134.159, 2445.56, 53.7499, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 205, 165.08, 2432.3, 56.3749, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 206, 203.656, 2408.95, 54.8423, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 207, 229.022, 2392.72, 55.5989, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 208, 236.268, 2387.61, 61.0638, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 209, 242.644, 2383.21, 62.5177, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 210, 276.482, 2374.36, 71.0905, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 211, 299.087, 2355.43, 74.0011, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 212, 307.074, 2322.82, 70.2365, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 213, 300.557, 2283.77, 66.6252, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 214, 283.475, 2246.74, 60.323, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 215, 246.457, 2215.66, 49.9713, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 216, 225.329, 2209.12, 47.5002, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 217, 221.727, 2207.72, 44.0183, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 218, 218.334, 2205.56, 41.8014, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 219, 205.681, 2198.46, 45.5361, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 220, 184.861, 2186.64, 51.0084, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 221, 172.649, 2177, 60.9637, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 222, 157.354, 2158.1, 67.6856, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 223, 160.427, 2127.58, 63.7883, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 224, 162.021, 2093.61, 57.3068, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 225, 152.276, 2052.32, 51.2036, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 226, 123.923, 2027.7, 50.2701, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 227, 118.928, 2024.18, 49.4465, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 228, 106.674, 2015.55, 45.1619, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 229, 96.5347, 2007.72, 48.1387, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 230, 59.6805, 2009.18, 69.3575, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 231, 48.33, 2010.75, 76.4418, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 232, 37.504, 2013.03, 76.5372, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 233, 23.393, 2016.13, 73.2278, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 234, -8.91992, 1981.98, 74.649, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 235, -40.392, 1951.23, 74.8175, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 236, -52.3153, 1918.97, 68.6909, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 237, -50.9455, 1885.91, 67.0823, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 238, -34.8478, 1851.8, 60.2348, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 239, -50.9455, 1885.91, 67.0823, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 240, -52.3153, 1918.97, 68.6909, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 241, -40.392, 1951.23, 74.8175, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 242, -8.91992, 1981.98, 74.649, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 243, 23.393, 2016.13, 73.2278, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 244, 37.504, 2013.03, 76.5372, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 245, 48.33, 2010.75, 76.4418, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 246, 59.6805, 2009.18, 69.3575, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 247, 96.5347, 2007.72, 48.1387, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 248, 106.674, 2015.55, 45.1619, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 249, 118.928, 2024.18, 49.4465, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 250, 123.923, 2027.7, 50.2701, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 251, 152.276, 2052.32, 51.2036, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 252, 162.021, 2093.61, 57.3068, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 253, 160.427, 2127.58, 63.7883, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 254, 157.354, 2158.1, 67.6856, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 255, 172.649, 2177, 60.9637, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 256, 184.861, 2186.64, 51.0084, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 257, 205.681, 2198.46, 45.5361, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 258, 218.334, 2205.56, 41.8014, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 259, 221.727, 2207.72, 44.0183, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 260, 225.329, 2209.12, 47.5002, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 261, 246.457, 2215.66, 49.9713, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 262, 283.475, 2246.74, 60.323, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 263, 300.557, 2283.77, 66.6252, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 264, 307.074, 2322.82, 70.2365, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 265, 299.087, 2355.43, 74.0011, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 266, 276.482, 2374.36, 71.0905, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 267, 242.644, 2383.21, 62.5177, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 268, 236.268, 2387.61, 61.0638, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 269, 229.022, 2392.72, 55.5989, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 270, 203.656, 2408.95, 54.8423, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 271, 165.08, 2432.3, 56.3749, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 272, 134.159, 2445.56, 53.7499, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 273, 101.983, 2444.25, 54.0714, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 274, 69.0965, 2447.91, 54.1903, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 275, 35.6428, 2450.32, 52.1388, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 276, -1.49414, 2436.21, 52.7178, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 277, -33.7658, 2410.91, 56.7199, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 278, -68.0807, 2391.69, 54.53, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 279, -106.825, 2366.73, 58.4316, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 280, -137.249, 2333.82, 64.5901, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 281, -168.441, 2300.09, 66.9371, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 282, -194.157, 2281.51, 65.3524, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 283, -197.01, 2279.36, 61.9845, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 284, -203.761, 2281.04, 57.7685, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 285, -236.38, 2291.84, 54.4694, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 286, -246.717, 2292.99, 59.5577, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 287, -264.549, 2295.51, 59.5944, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 288, -300.742, 2304.88, 53.2793, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 289, -333.041, 2331.04, 50.2793, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (203341, 290, -364.287, 2352.71, 44.9963, 0, 0, 0, 100, 0);

SET @GUID := 86360;
DELETE FROM `creature_addon` WHERE `guid` = @GUID;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes0`,`bytes1`,`bytes2`,`emote`,`moveflags`,`auras`) VALUES (@GUID,@GUID,0,0,0,4097,0,0,''); -- 1817
DELETE FROM `waypoint_data` WHERE `id` = @GUID;
INSERT INTO `waypoint_data` VALUES (86360, 1, -1279.48, 1541.65, 68.5788, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (86360, 2, -1276.81, 1551.19, 68.0778, 1000, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (86360, 3, -1288.84, 1543.69, 68.0947, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (86360, 4, -1291.91, 1547.43, 68.6043, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (86360, 5, -1287.21, 1543.23, 68.5932, 1000, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (86360, 6, -1277.49, 1540.49, 68.5745, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (86360, 7, -1280.36, 1543.57, 68.5816, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (86360, 8, -1282.43, 1545.78, 68.5867, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (86360, 9, -1284.81, 1537.81, 68.5853, 1000, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (86360, 10, -1289.31, 1553.19, 68.6038, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (86360, 11, -1282.18, 1549.24, 68.5888, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (86360, 12, -1284.69, 1546.26, 68.591, 1000, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (86360, 13, -1286.31, 1543.59, 68.5919, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (86360, 14, -1286.87, 1553.08, 68.5995, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (86360, 15, -1291.56, 1543.9, 68.6012, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (86360, 16, -1284.3, 1546.04, 68.5902, 1000, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (86360, 17, -1285.29, 1542.65, 68.5895, 0, 0, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (86360, 18, -1283.74, 1545.23, 68.5886, 0, 0, 0, 100, 0);

SET @GUID := 143859;
DELETE FROM `creature` WHERE `guid` = @GUID;
INSERT INTO `creature` VALUES (143859, 23326, 530, 1, 0, 0, -5052.25, 176.883, -11.9523, 0.755298, 300, 0, 0, 5240, 0, 0, 2);
DELETE FROM `creature_addon` WHERE `guid` = @GUID;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes0`,`bytes1`,`bytes2`,`emote`,`moveflags`,`auras`) VALUES (@GUID,@GUID,0,0,0,4097,0,0,'');
DELETE FROM `waypoint_data` WHERE `id` = @GUID;
INSERT INTO `waypoint_data` VALUES (143859, 1, -5052.25, 176.883, -11.9523, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (143859, 2, -5021.2, 157.306, -14.1182, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (143859, 3, -5001.05, 161.879, -14.4532, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (143859, 4, -5016.27, 157.271, -14.4559, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (143859, 5, -5046.27, 166.796, -12.9523, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (143859, 6, -5051.28, 187.322, -11.843, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (143859, 7, -5035.34, 209.733, -11.4177, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (143859, 8, -5024.8, 236.199, -6.39959, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (143859, 9, -5015.81, 258.285, -1.01212, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (143859, 10, -5023.01, 240.032, -4.77902, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (143859, 11, -5030.11, 221.379, -9.22475, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (143859, 12, -5049.06, 197.974, -11.1133, 0, 1, 0, 100, 0);


SET @GUID := 143850;
DELETE FROM `creature` WHERE `guid` = @GUID;
INSERT INTO `creature` VALUES (143850, 23326, 530, 1, 0, 0, -5061.09, 118.984, -16.3236, 3.18534, 300, 0, 0, 5240, 0, 0, 2);
DELETE FROM `creature_addon` WHERE `guid` = @GUID;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes0`,`bytes1`,`bytes2`,`emote`,`moveflags`,`auras`) VALUES (@GUID,@GUID,0,0,0,4097,0,0,'');
DELETE FROM `waypoint_data` WHERE `id` = @GUID;
INSERT INTO `waypoint_data` VALUES (143850, 1, -5061.09, 118.984, -16.3236, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (143850, 2, -5067.98, 134.159, -14.4941, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (143850, 3, -5078.73, 174.49, -8.20047, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (143850, 4, -5070.81, 196.406, -8.39611, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (143850, 5, -5051.05, 203.338, -10.2727, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (143850, 6, -5030.57, 208.88, -11.941, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (143850, 7, -4996.73, 232.769, -7.64229, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (143850, 8, -4983.49, 232.441, -8.8592, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (143850, 9, -4990.17, 233.798, -7.77388, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (143850, 10, -5009.65, 220.794, -10.2113, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (143850, 11, -5009.05, 223.342, -9.7882, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (143850, 12, -5018.98, 212.046, -11.6838, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (143850, 13, -5031.65, 208.805, -11.7893, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (143850, 14, -5076.62, 183.374, -8.14587, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (143850, 15, -5072.22, 144.156, -12.7305, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (143850, 16, -5061.07, 119.101, -16.5124, 0, 1, 0, 100, 0);

SET @GUID := 143848;
DELETE FROM `creature` WHERE `guid` = @GUID;
INSERT INTO `creature` VALUES (143848, 23326, 530, 1, 0, 0, -5009.85, 293.168, 1.58165, 4.3808, 300, 0, 0, 5240, 0, 0, 2);
DELETE FROM `creature_addon` WHERE `guid` = @GUID;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes0`,`bytes1`,`bytes2`,`emote`,`moveflags`,`auras`) VALUES (@GUID,@GUID,0,0,0,4097,0,0,'');
DELETE FROM `waypoint_data` WHERE `id` = @GUID;
INSERT INTO `waypoint_data` VALUES (143848, 1, -5009.85, 293.168, 1.58165, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (143848, 2, -4985.91, 303.319, -1.47406, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (143848, 3, -4977.48, 319.793, -1.79983, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (143848, 4, -4965.89, 351.025, -1.16063, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (143848, 5, -4961.49, 388.317, -1.14237, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (143848, 6, -4955.74, 422.718, 3.0133, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (143848, 7, -4943.15, 446.674, 1.94969, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (143848, 8, -4918.69, 445.809, 1.47001, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (143848, 9, -4907.83, 422.774, -4.28894, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (143848, 10, -4914.04, 443.47, 0.791701, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (143848, 11, -4940.44, 449.039, 1.66329, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (143848, 12, -4953.44, 428.605, 3.19569, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (143848, 13, -4959.89, 397.168, -0.207024, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (143848, 14, -4965.06, 353.104, -1.06223, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (143848, 15, -4974.9, 325.797, -1.88949, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (143848, 16, -4983.67, 306.442, -1.94701, 0, 1, 0, 100, 0);

SET @GUID := 143843;
DELETE FROM `creature` WHERE `guid` = @GUID;
INSERT INTO `creature` VALUES (143843, 23326, 530, 1, 0, 0, -4922.49, 300.925, -12.9711, 4.31468, 300, 0, 0, 5240, 0, 0, 2);
DELETE FROM `creature_addon` WHERE `guid` = @GUID;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes0`,`bytes1`,`bytes2`,`emote`,`moveflags`,`auras`) VALUES (@GUID,@GUID,0,0,0,4097,0,0,'');
DELETE FROM `waypoint_data` WHERE `id` = @GUID;
INSERT INTO `waypoint_data` VALUES (143843, 1, -4922.49, 300.925, -12.9711, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (143843, 2, -4940.97, 300.391, -8.78353, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (143843, 3, -4955.33, 289.657, -5.66909, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (143843, 4, -4966.68, 308.969, -3.35435, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (143843, 5, -4964.72, 331.789, -2.61827, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (143843, 6, -4955.16, 358.441, -2.64926, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (143843, 7, -4951.75, 387.423, -2.67249, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (143843, 8, -4960.42, 414.482, 2.96782, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (143843, 9, -4964.49, 436.276, 3.19277, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (143843, 10, -4961.49, 417.734, 3.29611, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (143843, 11, -4952.68, 397.098, -0.843112, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (143843, 12, -4953.89, 364.037, -2.40976, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (143843, 13, -4962.48, 340.823, -2.17657, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (143843, 14, -4966.38, 318.36, -2.77322, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (143843, 15, -4960.04, 292.818, -4.732, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (143843, 16, -4942.96, 299.441, -8.19346, 0, 1, 0, 100, 0);

SET @GUID := 143840;
DELETE FROM `creature` WHERE `guid` = @GUID;
INSERT INTO `creature` VALUES (143840, 23326, 530, 1, 0, 0, -4869.95, 530.626, -1.55347, 3.01892, 300, 0, 0, 5240, 0, 0, 2);
DELETE FROM `creature_addon` WHERE `guid` = @GUID;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes0`,`bytes1`,`bytes2`,`emote`,`moveflags`,`auras`) VALUES (@GUID,@GUID,0,0,0,4097,0,0,'');
DELETE FROM `waypoint_data` WHERE `id` = @GUID;
INSERT INTO `waypoint_data` VALUES (143840, 1, -4869.95, 530.626, -1.55347, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (143840, 2, -4893.95, 534.923, 2.51669, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (143840, 3, -4909.31, 518.172, 4.49308, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (143840, 4, -4901.04, 531.786, 4.01936, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (143840, 5, -4909.22, 518.321, 4.62386, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (143840, 6, -4915.15, 493.46, 1.49952, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (143840, 7, -4928.04, 454.673, 1.62711, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (143840, 8, -4947.84, 455.957, 0.743868, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (143840, 9, -4970.9, 473.281, 3.32517, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (143840, 10, -4956.07, 459.857, 0.461098, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (143840, 11, -4930.16, 454.308, 1.40765, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (143840, 12, -4917.67, 485.742, 0.545169, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (143840, 13, -4910.57, 514.098, 4.17644, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (143840, 14, -4898.19, 533.211, 3.26963, 0, 1, 0, 100, 0);

SET @GUID := 143837;
DELETE FROM `creature` WHERE `guid` = @GUID;
INSERT INTO `creature` VALUES (143837, 23326, 530, 1, 0, 0, -4926.3, 510.823, 5.91257, 2.36952, 300, 0, 0, 5240, 0, 0, 2);
DELETE FROM `creature_addon` WHERE `guid` = @GUID;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes0`,`bytes1`,`bytes2`,`emote`,`moveflags`,`auras`) VALUES (@GUID,@GUID,0,0,0,4097,0,0,'');
DELETE FROM `waypoint_data` WHERE `id` = @GUID;
INSERT INTO `waypoint_data` VALUES (143837, 1, -4926.3, 510.823, 5.91257, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (143837, 2, -4928.6, 533.318, 6.82092, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (143837, 3, -4939.77, 552.895, 6.60363, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (143837, 4, -4955.23, 575.672, 11.4152, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (143837, 5, -4946.25, 562.309, 8.26089, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (143837, 6, -4933.91, 544.248, 6.19057, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (143837, 7, -4927.38, 523.028, 7.01486, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (143837, 8, -4926.59, 498.706, 3.31352, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (143837, 9, -4907.33, 473.42, 1.10817, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (143837, 10, -4885.66, 466.116, -2.15189, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (143837, 11, -4899, 472.048, 0.28738, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (143837, 12, -4925.86, 491.481, 1.15546, 0, 1, 0, 100, 0);

SET @GUID := 143827;
DELETE FROM `creature` WHERE `guid` = @GUID;
INSERT INTO `creature` VALUES (143827, 23326, 530, 1, 0, 0, -4963.24, 605.275, 15.154, 1.85274, 300, 0, 0, 5240, 0, 0, 2);
DELETE FROM `creature_addon` WHERE `guid` = @GUID;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes0`,`bytes1`,`bytes2`,`emote`,`moveflags`,`auras`) VALUES (@GUID,@GUID,0,0,0,4097,0,0,'');
DELETE FROM `waypoint_data` WHERE `id` = @GUID;
INSERT INTO `waypoint_data` VALUES (143827, 1, -4963.24, 605.275, 15.154, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (143827, 2, -4975.9, 623.781, 17.6164, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (143827, 3, -4992.05, 634.386, 22.3304, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (143827, 4, -5011.42, 637.705, 23.6266, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (143827, 5, -4998.9, 635.911, 22.7719, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (143827, 6, -4979.86, 627.016, 19.2181, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (143827, 7, -4965.36, 609.717, 16.6277, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (143827, 8, -4958.6, 589.084, 12.9757, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (143827, 9, -4936.15, 573.935, 7.7713, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (143827, 10, -4913.7, 588.238, 5.50511, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (143827, 11, -4930.46, 576.111, 6.94406, 0, 1, 0, 100, 0);
INSERT INTO `waypoint_data` VALUES (143827, 12, -4955.03, 583.323, 12.0287, 0, 1, 0, 100, 0);
