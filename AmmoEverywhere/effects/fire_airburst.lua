dofile("effects/fire_mortar_heavy.lua")
Sprites = {}
LifeSpan = 3
Effects =
{
	{
	--SPARKS
		Type = "sparks",
		TimeToTrigger = 0.1,
		SparkCount = 8,
		LocalPosition = { x = 0, y = 0 },	-- how to place the origin relative to effect position and direction (0, 0) 
		Texture = "effects/media/flame",

		Gravity = 0,
		
		EvenDistribution =
		{
			Min = -5,
			Max = 5,
			StdDev = 5,
		},

		Keyframes =							
		{
			{
				Angle = 0,
				RadialOffsetMin = 0,
				RadialOffsetMax = 20,
				ScaleMean = 0.25,
				ScaleStdDev = 0.1,
				SpeedStretch = 0,
				SpeedMean = 1500,
				SpeedStdDev = 500,
				Drag = 1,
				RotationMean = 45,
				RotationStdDev = 45,
				RotationalSpeedMean = 10,
				RotationalSpeedStdDev = 5,
				AgeMean = 0.35,
				AgeStdDev = 0.15,
				AlphaKeys = { 0.1, 0.5 },
				ScaleKeys = { 0.1, 0.5 },
			},
		},
	},
	{
	--SMOKE UP
		Type = "sparks",
		TimeToTrigger = 0,
		SparkCount = 5,
		LocalPosition = { x = 0, y = 0 },
		Texture = "effects/media/smoke",

		Gravity = 0,
		
		EvenDistribution =
		{
			Min = -5,
			Max = 5,
			StdDev = 0,
		},

		Keyframes =							
		{
			{
				Angle = 0,
				RadialOffsetMin = 0,
				RadialOffsetMax = 20,
				ScaleMean = 4,
				ScaleStdDev = 1,
				SpeedStretch = 0,
				SpeedMean = 400,	
				SpeedStdDev = 100,
				Drag = 1,
				RotationMean = 0,
				RotationStdDev = 45,
				RotationalSpeedMean = 5,
				RotationalSpeedStdDev = 0,
				AgeMean = 1.5,
				AgeStdDev = 0.5,
				AlphaKeys = { 0.5, 0.5 },
				ScaleKeys = { 0.1, 0.5 },
			},
		},
	},
	{
	--SMOKE LEFT
		Type = "sparks",
		TimeToTrigger = 0,
		SparkCount = 3,
		LocalPosition = { x = 0, y = 0 },
		Texture = "effects/media/smoke",

		Gravity = 0,
		
		EvenDistribution =
		{
			Min = -95,
			Max = -85,
			StdDev = 0,
		},

		Keyframes =							
		{
			{
				Angle = -90,
				RadialOffsetMin = 0,
				RadialOffsetMax = 20,
				ScaleMean = 2.5,
				ScaleStdDev = 0.5,
				SpeedStretch = 0,
				SpeedMean = 300,	
				SpeedStdDev = 50,
				Drag = 5,
				RotationMean = 0,
				RotationStdDev = 45,
				RotationalSpeedMean = 5,
				RotationalSpeedStdDev = 0,
				AgeMean = 0.75,
				AgeStdDev = 0.25,
				AlphaKeys = { 0.1, 0.5 },
				ScaleKeys = { 0.1, 0.5 },
			},
		},
	},
	{
	--SMOKE RIGHT
		Type = "sparks",
		TimeToTrigger = 0,
		SparkCount = 3,
		LocalPosition = { x = 0, y = 0 },
		Texture = "effects/media/smoke",

		Gravity = 0,
		
		EvenDistribution =
		{
			Min = 85,
			Max = 95,
			StdDev = 0,
		},

		Keyframes =							
		{
			{
				Angle = 90,
				RadialOffsetMin = 0,
				RadialOffsetMax = 20,
				ScaleMean = 2.5,
				ScaleStdDev = 0.5,
				SpeedStretch = 0,
				SpeedMean = 300,	
				SpeedStdDev = 50,
				Drag = 5,
				RotationMean = 0,
				RotationStdDev = 45,
				RotationalSpeedMean = 5,
				RotationalSpeedStdDev = 0,
				AgeMean = 0.75,
				AgeStdDev = 0.25,
				AlphaKeys = { 0.1, 0.5 },
				ScaleKeys = { 0.1, 0.5 },
			},
		},
	},
}
SoundEvent = "mods/BirdiesAmmo/flareMortar"