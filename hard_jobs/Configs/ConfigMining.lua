ConfigMining = {}

-- ## This Will Print On The Console Of Your Server The Chances ## --
ConfigMining.EnableChanceDebug = false

-- ## Item Names In DB (make sure to run the SQL File first. And also you might not want to change these) ## --
ConfigMining.PickaxeItem = "pickaxe"
ConfigMining.AlienFragmentItem = "AlienFragment"
ConfigMining.DiamondItem = "diamond"
ConfigMining.GoldItem = "gold"
ConfigMining.IronItem = "iron"
ConfigMining.CopperItem = "copper"
ConfigMining.RockItem = "rock"

-- ## Chances ## --
ConfigMining.AlienFragmentChance = math.random(1, 10000) --it will be a mathrandom from 1 to what ever you want.
ConfigMining.DiamondChance = math.random(1, 50) --it will be a mathrandom from 1 to what ever you want.
ConfigMining.GoldChance = math.random(1, 20) --it will be a mathrandom from 1 to what ever you want.
ConfigMining.IronChance = math.random(1, 45) --it will be a mathrandom from 1 to what ever you want.
ConfigMining.CopperChance = math.random(1, 7) --it will be a mathrandom from 1 to what ever you want.
ConfigMining.RockChance = math.random(1, 45) --it will be a mathrandom from 1 to what ever you want.

ConfigMining.DropChanceAlienFragment = 1 --it will be the chance of the random number that will hit when the above are called to actually drop the item.
ConfigMining.DropChanceDiamond = 2 --it will be the chance of the random number that will hit when the above are called to actually drop the item.
ConfigMining.DropChanceGold = 3 --it will be the chance of the random number that will hit when the above are called to actually drop the item.
ConfigMining.DropChanceIron = 2 --it will be the chance of the random number that will hit when the above are called to actually drop the item.
ConfigMining.DropChanceCopper = 2 --it will be the chance of the random number that will hit when the above are called to actually drop the item.
ConfigMining.DropChanceRock = 2 --it will be the chance of the random number that will hit when the above are called to actually drop the item.

-- ## Chanches For How Many To Give (must awlays be at least 1) ## --
ConfigMining.AlienFragmentItemChance = math.random(1, 1) -- it will be a random item count from 1 to what ever you want.
ConfigMining.DiamondItemChance = math.random(1, 2) --it will be a random item count from 1 to what ever you want.
ConfigMining.GoldItemChance = math.random(1, 4) --it will be a random item count from 1 to what ever you want.
ConfigMining.IronItemChance = math.random(1, 2) --it will be a random item count from 1 to what ever you want.
ConfigMining.CopperItemChance = math.random(1, 5) --it will be a random item count from 1 to what ever you want.
ConfigMining.RockItemChance = math.random(1, 5) --it will be a random item count from 1 to what ever you want.


-- ## Mining Locations Native Cave ## --
ConfigMining.UseNativeCave = true
ConfigMining.NativeCaveBlip = true
ConfigMining.NativeCave = {
    NativeCave1 = {
        Pos = { x = -2721.9809570312, y = 727.93280029297, z = 172.10809326172 } 
    },
    NativeCave2 = {
        Pos = { x = -2720.6125488281, y = 722.29730224609, z = 171.18730163574 } 
    },
    NativeCave3 = {
        Pos = { x = -2724.8737792969, y = 730.91033935547, z = 172.01844787598 } 
    },
    NativeCave4 = {
        Pos = { x = -2714.6618652344, y = 716.0205078125, z = 171.185546875 } 
    },
}
-- # For Blips # --
ConfigMining.NativeCaveBlipLocation = { x = -2663.923828125, y = 690.88659667969, z = 184.52114868164 }


-- ## Mining Locations Annesburg ## --
ConfigMining.UseAnnesburg = false
ConfigMining.AnnesburgBlip = false
ConfigMining.Annesburg = {
    Annesburg1 = {
        Pos = { x = 2716.7, y = 1308.5, z = 69.85 }
    },
    Annesburg2 = {
        Pos = { x = 2728.89, y = 1330.31, z = 69.77 }
    },
    Annesburg3 = {
        Pos = { x = 2760.2, y = 1309.71, z = 70.1 }
    },
    Annesburg4 = {
        Pos = { x = 2767.99, y = 1343.74, z = 70.77 }
    },
    Annesburg5 = {
        Pos = { x = 2734.51, y = 1332.29, z = 69.81 }
    },
    Annesburg6 = {
        Pos = { x = 2757.24, y = 1302.27, z = 70.1 }
    },
}
-- # For Blips # --
ConfigMining.AnnesburgBlipLocation = { x = 2795.23, y = 1341.28, z = 71.44 }


-- ## Mining Locations TumbleWeed ## --
ConfigMining.UseTumbleWeed = false
ConfigMining.TubmleWeedBlip = false
ConfigMining.TubmleWeed = {
    TubmleWeed1 = {
        Pos = { x = -5962.4213867188, y = -3189.6613769531, z = -21.399410247803 } 
    },
    TubmleWeed2 = {
        Pos = { x = -5955.416015625, y = -3179.4436035156, z = -22.290533065796 } 
    },
    TubmleWeed3 = {
        Pos = { x = -5966.875, y = -3173.3427734375, z = -23.764360427856 } 
    },
    TubmleWeed4 = {
        Pos = { x = -5973.9599609375, y = -3165.4665527344, z = -25.542938232422 } 
    },
}
-- # For Blips # --
ConfigMining.TubmleWeedBlipLocation = { x = -5964.1279296875, y = -3206.2795410156, z = -21.249731063843 }