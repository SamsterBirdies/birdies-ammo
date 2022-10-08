--  age (in seconds) at which the explosion deletes itself
--  make sure this exceedes the age of all effects
LifeSpan = 10.1
SoundEvent = "mods/ManyUpgrades/overchargedbattery"
Effects =
{
	{
		Type = "sparks",
		TimeToTrigger = 0.0,
		SparkCount = 6,
		BurstPeriod = 0.75,
		SparksPerBurst = 1,
		LocalPosition = { x = 0, y = 0, z = -50 },
		Sprite = path .. "/effects/media/sparkle.png",

		Gravity = 0,

		NormalDistribution =					-- distribute sparks evenly between two angles with optional variation
		{
			Mean = 0,
			StdDev = 170,						-- standard deviation at each iteration in degrees (zero will make them space perfectly even)
		},
		
		Keyframes =							
		{
			{
				Angle = 0,
				RadialOffsetMin = 0,
				RadialOffsetMax = 20,
				ScaleMean = 0.7,
				ScaleStdDev = 0.3,
				SpeedStretch = 0,
				SpeedMean = 0,
				SpeedStdDev = 15,
				Drag = 0,
				RotationMean = 0,
				RotationStdDev = 90,
				RotationalSpeedMean = 0,
				RotationalSpeedStdDev = 120,	
				AgeMean = 2,
				AgeStdDev = 0.5,
				AlphaKeys = { 0.1, 1 },
				ScaleKeys = { 0.1, 0.2 },
				colour = { 255, 255, 255, 180 },
			},
		},
	},
}
