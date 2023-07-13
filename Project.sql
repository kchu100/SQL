--Kevin Chu
--CSC 315 Final Project
--====================================================================
--Description and Requirements========================================
--====================================================================
Destiny 2 is a first-person looter shooter sci-fi MMO that is developed and published by Bungie. It is a 
multi-platform game in which can be played on PlayStation, Xbox and PC. In the game, it is essentially a
war between Light and Dark. The Light is emitted by the Traveler (a big sphere) and the Darkness is by 
the Pyramids. You, as a player, is resurrected by a Ghost (who is a companion and was forged with Light 
by the Traveler) will protect all of humanity from the Darkness. As you are resurrected by a Ghost of Light, 
you have became a Guardian. Guardians are essentially immortal. Guardians will gain power from the Traveler 
in order to protect humanity. As a Guardian, there are 3 different classes. 

You can play as a Hunter, Titan, or a Warlock. Each of these classes are unique and have different subclasses. 
Subclasses have 4 different elements: arc, solar, void and stasis. The arc, solar, and void subclasses are made
from the Light, while stasis is a Darkness subclass. Each Light subclass are subdivided into 3 different subtrees 
and each of these trees are played in a different way depending on the situation. As with each subclass, Hunters
have Arcstrider, Gunslinger, Nightstalker and Revenant; Titans have Striker, Sunbreaker, Sentinel and Behemoth; 
Warlocks have Stormcaller, Dawnblade, Voidwalker and Shadebinder, respectively on element. 

Apart from subclasses, there are different weapons that we could use. Weapons can also have elements just like
subclasses do, including stasis. As for the weapon setup, there are kinetic, energy and power weapons. Kinetic 
weapons do not have an element while energy and power weapons have an element. Each of these weapons take different 
ammo types: primary, special, and heavy. All weapons have different stats that vary with each other. The stats that 
describe the weapons are impact, range, stability, handling, reload speed, rounds per  minute, magazine and its 
intrinsic perk. The intrinsic perks can be determined by their rounds per minute. With the description of each 
weapon, there also need to have different classes of weapons, which there are a total of 16. Weapons have different 
rarities: uncommon, rare, legendary and exotic. Exotic weapons can not be equipped alongside another exotic weapon 
as only one exotic is allowed to be equipped. Each exotic have a unique intrinsic perk that separates them from 
other exotics. Each of them excel in power depending on the situation it is used in. Legendary weapons are more 
sought-after and the only weapons to use. They actually have much more variety than Rare weapons do because they 
can have many different traits. These traits are randomly rolled on each weapon. Rare weapons are a downgrade of 
Legendaries as do have similar feel to Legendaries but can not have random rolled traits. 
--====================================================================
--Relational Schema﻿===================================================
--====================================================================
Guardian(Guardian_PK, Class﻿Name)
WeaponType(WT_PK, Name)
Weapon(Weapon_PK, Name, WT_FK, Rarity, Intrinsic, RPM, Slot_FK, Ammo_FK)
Slot(Slot_PK, Name)
AmmoType(Ammo_PK, Name)

Subclass(SC_PK, Guardian_FK, Name, Element)
JumpAbility(JA_PK, G_FK, Name, Description)
ClassAbility(CA_PK, G_FK, Name, Description)
Grenades(G_PK, Name, Element, Descrption)
Trees(T_PK, SC_FK, Type, Description)
--====================================================================
--Data Definition Language (DDL)======================================
--====================================================================
create table Guardian(
Guardian_PK AUTOINCREMENT primary key,
ClassName varchar(30)
);

create table WeaponType(
WT_PK AUTOINCREMENT primary key,
Name varchar(50)
);

create table Weapon(
Weapon_PK AUTOINCREMENT primary key,
Name varchar(50),
WT_FK int,
Rarity varchar (50),
Intrinsic varchar(50),
Element varchar(20),
RPM int, 
Slot_FK int,
Ammo_FK int,
foreign key (WT_FK) REFERENCES WeaponType(WT_PK),
foreign key (Slot_FK) REFERENCES Slot(Slot_PK),
foreign key (Ammo_FK) REFERENCES AmmoType(Ammo_PK)
);

create table Slot(
Slot_PK AUTOINCREMENT primary key,
Name varchar(50)
);

create table AmmoType(
Ammo_PK AUTOINCREMENT primary key,
Name varchar(20)
);

create table Subclass(
SC_PK AUTOINCREMENT primary key,
Guardian_FK int,
Name varchar(20) NOT NULL, 
Element varchar(10),
foreign key (Guardian_FK) REFERENCES Guardian(Guardian_PK)
);

create table JumpAbility(
JA_PK AUTOINCREMENT primary key, 
G_FK int, 
Name varchar(50),
Description varchar(100),
foreign key (G_FK) REFERENCES Guardian(Guardian_PK)
);

create table ClassAbility(
CA_PK AUTOINCREMENT primary key, 
G_FK int,
Name varchar(50),
Description varchar(100),
foreign key (G_FK) REFERENCES Guardian(Guardian_PK)
);

create table Grenades(
G_PK AUTOINCREMENT primary key, 
Name varchar(50),
Element varchar(20),
Description varchar(100)
);

create table Trees(
T_PK AUTOINCREMENT primary key, 
SC_FK int,
Type varchar(50),
Description varchar(100),
foreign key (SC_FK) REFERENCES Subclass(SC_PK)
);
--====================================================================
--DML: Populating tables==============================================
--====================================================================
--===================================
--Guardian
--===================================
insert into Guardian values (1, 'Warlock');
insert into Guardian values (2, 'Hunter');
insert into Guardian values (3, 'Titan');
--===================================
--Subclass
--===================================
insert into Subclass values (1, 1, 'Dawnblade', 'Solar');
insert into Subclass values (2, 1, 'Stormcaller', 'Arc');
insert into Subclass values (3, 1, 'Voidwalker', 'Void');
insert into Subclass values (4, 1, 'Shadebinder', 'Stasis');

insert into Subclass values (5, 2, 'Gunslinger', 'Solar');
insert into Subclass values (6, 2, 'Arcstrider', 'Arc');
insert into Subclass values (7, 2, 'Nightstalker', 'Void');
insert into Subclass values (8, 2, 'Revenant', 'Stasis');

insert into Subclass values (9, 3, 'Sunbeaker', 'Solar');
insert into Subclass values (10, 3, 'Striker', 'Arc');
insert into Subclass values (11, 3, 'Sentinel', 'Void');
insert into Subclass values (12, 3, 'Behemoth', 'Stasis');
--===================================
--JumpAbility
--===================================
insert into JumpAbility values (1, 1, 'Strafe Glide', 'Start an airborne drift with strong directional control');
insert into JumpAbility values (2, 1, 'Burst Glide', 'Start an airborne drift with a strong initial burst of speed');
insert into JumpAbility values (3, 1, 'Balanced Glide', 'Start an airborne drift with both moderate speed and directional control');
insert into JumpAbility values (4, 1, 'Blink', 'Jump while airborne to teleport a short distance');

insert into JumpAbility values (5, 2, 'High Jump', 'Jump a second time to reach greater heights');
insert into JumpAbility values (6, 2, 'Strafe Jump', 'Jump a second time with stong directional control');
insert into JumpAbility values (7, 2, 'Triple Jump', 'Sustain your air control with a second or third jump');

insert into JumpAbility values (8, 3, 'High Lift', 'Launch into the air at greater heights');
insert into JumpAbility values (9, 3, 'Strafe Lift', 'Launch into the air with strong directional control');
insert into JumpAbility values (10, 3, 'Catapult Lift', 'Launch into the air with a strong initial burst of momentum');
--===================================
--ClassAbility
--===================================
insert into ClassAbility values (1, 1, 'Healing Rift', 'Conjure a well of Light that continuously heals those inside it');
insert into ClassAbility values (2, 1, 'Empowering Rift', 'Conjure a well of Light that increases weapon damage for those inside it');

insert into ClassAbility values (3, 2, "Markman's Dodge", 'Dodge to perform an evasive maneuver and reloads your weapon');
insert into ClassAbility values (4, 2, "Gambler's Dodge", 'Dodge to perform a deft tumble, avoiding enemy attacks and full recharges your Melee Ability');

insert into ClassAbility values (5, 3, 'Towering Barricade', 'A large barrier that reinforce a position with cover');
insert into ClassAbility values (6, 3, 'Rally Barricade', 'A small barrier that increases reload speed of equipped weapon');
--===================================
--Grenades
--===================================
insert into Grenades values (1, 'Solar Grenade', 'Solar', 'Creates a flare that continuously damages enemies');
insert into Grenades values (2, 'Firebolt Grenade', 'Solar', 'Unleashes bolts at nearby enemies');
insert into Grenades values (3, 'Fusion Grenade', 'Solar', 'Attaches to enemies');
insert into Grenades values (4, 'Arcbolt Grenade', 'Arc', 'Chains bolts of lightning to nearby enemies');
insert into Grenades values (5, 'Pulse Grenade', 'Arc', 'Periodically damages enemies in a radius');
insert into Grenades values (6, 'Storm Grenade', 'Arc', 'Calls down a focused lightning storm');
insert into Grenades values (7, 'Vortex Grenade', 'Void', 'Creates a Vortex that continually damages enemies');
insert into Grenades values (8, 'Axion Bolt', 'Void', 'Bolt that forks into smaller bolts on impact');
insert into Grenades values (9, 'Scatter Grenade', 'Void', 'Splits into many submunitions and covers a large area');
insert into Grenades values (10, 'Skip Grenade', 'Arc', 'Splits among impact, creating multiple projectiles');
insert into Grenades values (11, 'Flux Grenade', 'Arc', 'Attaches to enemies');
insert into Grenades values (12, 'Incendiary Grenade', 'Solar', 'Explosion catches enemies on fire');
insert into Grenades values (13, 'Swarm Grenade', 'Solar', 'Detonates on impact, releasing multiple drones');
insert into Grenades values (14, 'Tripmine Grenade', 'Solar', 'Sticks to surfaces and detoniates upon passing through its laser trigger');
insert into Grenades values (15, 'Spike Grenade', 'Void', 'Sticks to surfaces and emites a torrent of damaging Void Light');
insert into Grenades values (16, 'Voidwall Grenade', 'Void', 'Creates a horizontal wall of burning Void Light');
insert into Grenades values (17, 'Magnetic Grenade', 'Void', 'Attaches to enemies and explodes twice');
insert into Grenades values (18, 'Suppressor Grenade', 'Void', 'Suppress, preventing enemies from using abilities');
insert into Grenades values (19, 'Flashbang Grenade', 'Arc', 'Disorients enemies');
insert into Grenades values (20, 'Lightning Grenade', 'Arc', 'Sticks to surface, emits bolts of lightning');
insert into Grenades values (21, 'Thermite Grenade', 'Solar', 'Sends a burning line of fire');
insert into Grenades values (22, 'Duskfield Grenade', 'Stasis', 'Shatters on impact, leaving behind a field that slows an freezes');
insert into Grenades values (23, 'Coldsnap Grenade', 'Stasis', 'Freezes on impact and sends another seeker');
insert into Grenades values (24, 'Glacial Grenade', 'Stasis', 'Creates a wall to block damage and freezes');
--===================================
--Trees
--===================================
insert into Trees values(1, 1, 'Attunement of Sky', 'Winged Sun');
insert into Trees values(2, 1, 'Attunement of Grace', 'Well of Radiance');
insert into Trees values(3, 1, 'Attunement of Flame', 'Fated for the Flame');
insert into Trees values(4, 2, 'Attunement of Conduction', 'Chain Lightning');
insert into Trees values(5, 2, 'Attunement of Control', 'Chaos Reach');
insert into Trees values(6, 2, 'Attunement of Elements', 'Arc Soul');
insert into Trees values(7, 3, 'Attunement of Chaos', 'Cataclysm');
insert into Trees values(8, 3, 'Attunement of Fission', 'Nova Warp');
insert into Trees values(9, 3, 'Attunement of Hunger', 'Devour');
insert into Trees values(10, 4, "Winter's Wrath", 'Stasis Staff');

insert into Trees values(11, 5, 'Way of the Outlaw', 'Six-Shooter');
insert into Trees values(12, 5, 'Way of the Thousand Cuts', 'Blade Barrage');
insert into Trees values(13, 5, 'Way of the Sharpshooter', "Line 'Em Up");
insert into Trees values(14, 6, 'Way of the Warrior', 'Combination Blow');
insert into Trees values(15, 6, 'Way of the Current', 'Whirlwind Guard');
insert into Trees values(16, 6, 'Way of the Wind', 'Lightning Reflexes');
insert into Trees values(17, 7, 'Way of the Trapper', 'Deadfall');
insert into Trees values(18, 7, 'Way of the Wraith', 'Spectral Blades');
insert into Trees values(19, 7, 'Way of the Pathfinder', 'Moebius Quiver');
insert into Trees values(20, 8, 'Silence and Squall', 'Two Stasis Kamas');

insert into Trees values(21, 9, 'Code of the Fire-Forged', "Vulcan's Rage");
insert into Trees values(22, 9, 'Code of the Devastator', 'Burning Maul');
insert into Trees values(23, 9, 'Code of the Siegebreaker', 'Sol Invictus');
insert into Trees values(24, 10, 'Code of the Earthshaker', 'Terminal Velocity');
insert into Trees values(25, 10, 'Code of the Missile', 'Thundercrash');
insert into Trees values(26, 10, 'Code of the Juggernaut', 'Trample');
insert into Trees values(27, 11, 'Code of the Protector', 'Ward of Dawn');
insert into Trees values(28, 11, 'Code of the Commander', 'Banner Shield');
insert into Trees values(29, 11, 'Code of the Aggressor', 'Second Shield');
insert into Trees values(30, 12, 'Glacial Quake', 'Stasis Gauntlet');
--===================================
--Slot
--===================================
insert into Slot values (1, 'Kinetic');
insert into Slot values (2, 'Energy');
insert into Slot values (3, 'Power');
--===================================
--Ammo
--===================================
insert into AmmoType values (1, 'Primary');
insert into AmmoType values (2, 'Special');
insert into AmmoType values (3, 'Heavy');
--===================================
--WeaponType
--===================================
insert into WeaponType values(1, 'Handcannon');
insert into WeaponType values(2, 'Pulse Rifles');
insert into WeaponType values(3, 'Auto Rifles');
insert into WeaponType values(4, 'Scout Rifles');
insert into WeaponType values(5, 'Submachine Guns');
insert into WeaponType values(6, 'Sidearms');
insert into WeaponType values(7, 'Bows');
insert into WeaponType values(8, 'Shotguns');
insert into WeaponType values(9, 'Sniper Rifles');
insert into WeaponType values(10, 'Fusion Rifles');
insert into WeaponType values(11, 'Rocket Launchers');
insert into WeaponType values(12, 'Machine Guns');
insert into WeaponType values(13, 'Linear Fusion Rifles');
insert into WeaponType values(14, 'Trace Rifles');
insert into WeaponType values(15, 'Swords');
insert into WeaponType values(16, 'Grenade Launchers');
--===================================
--Weapon
--===================================
insert into Weapon values(1, "Traveler's Chosen", 6, "Exotic", "Gathering Light", NULL, 300, 1, 1);
insert into Weapon values(2, "False Promises", 3, "Legendary", "High Impact", NULL, 360, 1, 1);
insert into Weapon values(3, "The Forward Path", 3, "Legendary","Adaptive", NULL, 600, 1, 1);
insert into Weapon values(4, "Whispering Slab", 7, "Legendary","Lightweight", NULL, 612, 1, 1);
insert into Weapon values(5, "Cold Denial", 2, "Legendary", "High Impact", NULL, 340, 1, 1);
insert into Weapon values(6, "Ikelos_HC_V1.0.2", 1, "Legendary", "Precision", "Void", 180, 2, 1);
insert into Weapon values(7, "Nature of the Beast", 1, "Legendary", "Precision", "Arc", 180, 2, 1);
insert into Weapon values(8, "The Fool's Remedy", 6, "Legendary", "Rapid-Fire", "Solar", 450, 2, 1);
insert into Weapon values(9, "Death Adder", 5, "Legendary", "Lightweight", "Solar", 900, 2, 1);
insert into Weapon values(10, "Ikelos_SMG_V1.0.2", 5, "Legendary", "Aggressive", "Arc", 750, 2, 1);
insert into Weapon values(11, "The Scholar", 4, "Legendary", "High Impact", NULL, 150,  1, 1);
insert into Weapon values(12, "The Summoner", 3, "Legendary", "Adaptive", "Solar", 600, 2, 1);
insert into Weapon values(13, "Khvostov 7G-02", 3, "Basic", "Adaptive",NULL, 600, 1, 1);
insert into Weapon values(14, "Sorrow MG2", 5, "Basic", "Lightweight", "Arc", 900, 2, 1);
insert into Weapon values(15, "Suros Throwback", 3, "Common", "Precision", NULL, 450, 1, 1);
insert into Weapon values(16, "Minuet-12", 1, "Common", "Adaptive", "Solar", 140, 2, 1);
insert into Weapon values(17, "Sea Scorpion-1SR", 4, "Common",  "Rapid-Fire", "Arc", 260, 2, 1);
insert into Weapon values(18, "Sondok-C", 5, "Rare", "Precision", NULL, 600, 1, 1);
insert into Weapon values(19, "Lionheart", 3, "Rare", "Adaptive", NULL, 600, 1, 1);
insert into Weapon values(20, "Witherhoard", 16, "Exotic", "Primeval's Torment", NULL, 90, 1, 2);
insert into Weapon values(21, "Ruinous Effigy", 14, "Exotic", "Transmutation", "Void", 1000, 2, 2);
insert into Weapon values(22, "Hollow Words", 10, "Legendary", "Precision", "Arc", 740, 2, 2);
insert into Weapon values(23, "Truthteller", 16, "Legendary", "Adaptive", "Void", 90, 2, 2);
insert into Weapon values(24, "First In, Last Out", 8, "Legendary", "Precision", "Arc", 65, 2, 2);
insert into Weapon values(25, "Ikelos_SG_V1.0.2", 8, "Legendary", "Rapid-Fire", "Solar", 140, 2, 2);
insert into Weapon values(26, "Ikelos_SR_V1.0.2", 9, "Legendary", "Rapid-Fire", "Solar", 140, 2, 2);
insert into Weapon values(27, "Widow's Bite", 9, "Legendary", "Rapid-Fire", "Solar", 140, 2, 2);
insert into Weapon values(28, "Astral Horizon", 8, "Legendary", "Aggressive", NULL, 55, 1, 2);
insert into Weapon values(29, "Eye of Sol", 9, "Legendary", "Adaptive", NULL, 90, 1, 2);
insert into Weapon values(30, "Exile's Curse", 10, "Legendary", "High Impact", "Arc", 860, 2, 2);
insert into Weapon values(31, "Stay Away", 16, "Basic", "Adaptive", "Arc", 90, 2, 2);
insert into Weapon values(32, "Nox Calyx II", 10, "Common", "Adaptive", "Void", 660, 2, 2);
insert into Weapon values(33, "Hand In Hand", 8, "Common", "Precision", "Solar", 65, 2, 2);
insert into Weapon values(34, "Aachen-LR2", 9, "Rare", "Adaptive", NULL, 90, 1, 2);
insert into Weapon values(35, "Botheration Mk.28", 8, "Rare", "Aggressive", "Solar", 55, 2, 2);
insert into Weapon values(36, "Berenger's Memory", 16, "Legendary", "Rapid-Fire", "Void", 150, 3, 3);
insert into Weapon values(37, "Hoosegow", 11, "Legendary", "Adaptive", "Arc", 20, 3, 3);
insert into Weapon values(38, "Falling Guillotine", 15, "Legendary", "Vortex", "Void", 0, 3, 3);
insert into Weapon values(39, "Negative Space", 15, "Legendary", "Adaptive", "Solar", 0, 3, 3);
insert into Weapon values(40, "Temptation's Hook", 15, "Legendary", "Caster", "Arc", 0, 3, 3);
insert into Weapon values(41, "Tomorrow's Answer", 11, "Legendary", "High Impact", "Void", 15, 3, 3);
insert into Weapon values(42, "Seventh Seraph SAW", 12, "Legendary", "High Impact", "Arc", 360, 3,3 );
insert into Weapon values(43, "Anarchy", 16, "Exotic", "Arc Traps", "Arc", 150, 3, 3);
insert into Weapon values(44, "Traitor's Fate", 15, "Basic", "Adaptive", "Arc", 0, 3, 3);
insert into Weapon values(45, "Butler RS/2", 11, "Common", "High Impact", "Arc", 15, 3, 3);
insert into Weapon values(46, "King Cobra-4FR", 13, "Rare", "Precision", "Arc", 533, 3, 3);
insert into Weapon values(47, "Cup-Bearer SA/2", 11, "Rare", "Adaptive", "Solar", 20, 3, 3);
insert into Weapon values(48, "Reginar-B", 11, "Rare", "HakkePrecision", "Void", 10, 3, 3);
--====================================================================
--DML SQL Queries=====================================================
--====================================================================
--shows what Guardian class corresponds to what subclass (join with 2 tables)
select G.ClassName as Class, S.Name as Name, S.Element as Element
from Guardian as G INNER JOIN Subclass as S ON G.Guardian_PK = S.Guardian_FK

--shows what Submachine Guns are there (join with 2 tables with filtering condition)
select W2.Name as Name, W2.Rarity, W2.Intrinsic, W2.Element
from WeaponType as W1 INNER JOIN Weapon as W2 ON W1.WT_PK = W2.WT_FK
where W1.Name = "Submachine Guns"

--shows what class ability and jumps do each class have (join with 3 tables)
select G.ClassName as Class, C.Name as Ability, J.Name as Jump
from Guardian as G, ClassAbility as C, JumpAbility as J
where G.Guardian_PK = C.G_FK and G.Guardian_PK = J.G_FK

--shows each class's abilities and subclasses (join with 5 tables)
SELECT G.ClassName AS Class, C.Name AS Ability, J.Name AS Jump, S.Name as Subclass, T.Type as Tree
FROM Guardian AS G, ClassAbility AS C, JumpAbility AS J, Subclass as S, Trees as T
WHERE G.Guardian_PK = C.G_FK and G.Guardian_PK = J.G_FK and S.Guardian_FK = G.Guardian_PK and S.SC_pk = T.SC_FK

--shows each weapon's type, ammo, slot (join with 4 tables)
select W1.Name as Type, W2.Name as Name, A.Name as Ammo, S.Name as Slot
from WeaponType as W1, Weapon as W2, AmmoType as A, Slot as S
where W1.WT_PK = W2.WT_FK and W2.Ammo_FK = A.Ammo_PK and W2.Slot_FK = S.Slot_PK

--shows alls kinetic primary weapons (join with 4 tables with 2 filtering condition)
select W1.Name as Type, W2.Name as Name, A.Name as Ammo, S.Name as Slot
from WeaponType as W1, Weapon as W2, AmmoType as A, Slot as S
where W1.WT_PK = W2.WT_FK and W2.Ammo_FK = A.Ammo_PK and W2.Slot_FK = S.Slot_PK
and A.Name = "Primary" and S.Name = "Energy"

--shows all kinetic primary handcannos (join with 4 tables with 3 filtering conditions)
SELECT W1.Name AS Type, W2.Name AS Name, A.Name AS Amo, S.Name AS Slot
FROM WeaponType AS W1, Weapon AS W2, AmmoType AS A, Slot AS S
WHERE W1.WT_PK = W2.WT_FK and W2.Ammo_FK = A.Ammo_PK and W2.Slot_FK = S.Slot_PK
and A.Name = "Primary" and S.Name = "Energy" and W1.Name = "Handcannon"

--counts how many of each weapon types (calculating using COUNT aggregate with a group by)
SELECT W1.Name, count(W1.Name) as NumWeaponTypes
FROM WeaponType AS W1, Weapon AS W2
WHERE W1.WT_PK = W2.WT_FK
group by W1.Name

--shows the count of special weapons if there are more than 3 (using a count aggregate with a group by and having)
SELECT W1.Name, count(W1.Name) as NumWeaponTypes
FROM WeaponType AS W1, Weapon AS W2, AmmoType AS A, Slot AS S
WHERE W1.WT_PK = W2.WT_FK and W2.Ammo_FK = A.Ammo_PK and W2.Slot_FK = S.Slot_PK
and A.Name = "Special"
group by W1.Name
having count(W1.Name) > 3

--shows what Warlock subclass has 1 tree (count aggregate with a group by and having)
select S.Name as Subclass
from Guardian as G, Subclass as S, Trees as T
where G.Guardian_PK = S.Guardian_FK and S.SC_PK = T.SC_FK 
and G.ClassName = "Warlock"
group by S.Name
having count(T.Type) = 1
