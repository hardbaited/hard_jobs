ConfigWoodCutter = {}

-- ## This Will Print On The Console Of Your Server The Chances ## --
ConfigWoodCutter.EnableChanceDebug = false

-- ## Item Names In DB (make sure to run the SQL File first. And also you might not want to change these) ## --
ConfigWoodCutter.AxeItem = "axe"
ConfigWoodCutter.WoodItem = "wood"

-- ## Chances ## --
ConfigWoodCutter.WoodChance = math.random(1, 5) --it will be a mathrandom from 1 to what ever you want.

ConfigWoodCutter.DropChanceWood = 3 --it will be the chance of the random number that will hit when the above are called to actually drop the item.

-- ## Chanches For How Many To Give (must awlays be at least 1) ## --
ConfigWoodCutter.WoodItemChance = math.random(1, 5) -- it will be a random item count from 1 to what ever you want.

-- ## Mining Locations ## --
ConfigWoodCutter.UseMontosRest = true
ConfigWoodCutter.MontosRestBlip = true
ConfigWoodCutter.MontosRest = {
    MontosRest1 = {
    	Pos = { x = -1430.38, y = -230.6, z = 100.33 },
    },
    MontosRest2 = {
    	Pos = { x = -1427.24, y = -237.28, z = 99.72 },
    },
    MontosRest3 = {
    	Pos = { x = -1416.55, y = -226.8, z = 100.14 },
    },
    MontosRest4 = {
    	Pos = { x = -1402.64, y = -218.79, z = 100.92 },
    },
}
-- # For Blips # --
ConfigWoodCutter.MontosRestBlipLocation = { x = -1415.23, y = -230.38, z = 101.27 }
