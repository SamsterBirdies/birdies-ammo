LifeSpan = 5.0
SoundEvent = "mods/BirdiesAmmo/impact_harpoon_default"
Sprites =
{
	{
		Name = "sbHarpoonImpaled",

		States =
		{
			Normal =
			{
				Frames =
				{
					{ texture = path .. "/weapons/harpoon/harpoonProjectile.png", duration = 1 },
					{ texture = path .. "/weapons/harpoon/harpoonProjectile.png", colour = { 1, 1, 1, 0.0 }, duration = 5 },
					duration = 0.05,
					blendColour = false,
					blendCoordinates = false,
				},
				--RandomPlayLength = 2,
				NextState = "Normal",
			},
		},
	},
}
Effects =
{
	{
		Type = "sprite",
		TimeToTrigger = 0,
		LocalPosition = { x = 0, y = 50, z = 0 },
		LocalVelocity = { x = 0, y = 0, z = 0 },
		Acceleration = { x = 0, y = 0, z = 0 },
		Drag = 0.0,
		Sprite = "sbHarpoonImpaled",
		Additive = false,
		TimeToLive = 0.72,
		Angle = -180,
		InitialSize = 1,
		ExpansionRate = 0,
		AngularVelocity = 0,
		RandomAngularVelocityMagnitude = 0,
		Colour1 = { 255, 255, 255, 255 },
		Colour2 = { 255, 255, 255, 255 },
	},
	{
	--DUST CLOUDS
		Type = "sparks",
		TimeToTrigger = 0.72,
		SparkCount = 4,
		LocalPosition = { x = 0, y = 0, z = -200 },	-- how to place the origin relative to effect position and direction (0, 0) 
		Texture = "effects/media/SteamCloud.tga",

		Gravity = 0,						-- gravity applied to particle (981 is earth equivalent)
		
		EvenDistribution =					-- distribute sparks evenly between two angles with optional variation
		{
			Min = -10,						-- minimum angle in degrees (e.g. -180, 45, 0)
			Max = 10,						-- maximum angle in degrees (e.g. -180, 45, 0)
			StdDev = 5,						-- standard deviation at each iteration in degrees (zero will make them space perfectly even)
		},

		Keyframes =							
		{
			{
				Angle = 0,
				RadialOffsetMin = 0,
				RadialOffsetMax = 50,
				ScaleMean = 3,
				ScaleStdDev = 0.1,
				SpeedStretch = 0,
				SpeedMean = 1500,
				SpeedStdDev = 10,
				Drag = 0.05,
				RotationMean = 0,
				RotationStdDev = 45,
				RotationalSpeedMean = 5,
				RotationalSpeedStdDev = 25,
				AgeMean = 0.4,
				AgeStdDev = 0.02,
				AlphaKeys = { 0.1, 0.25 },
				ScaleKeys = { 0.1, 1 },
			},
		},
	},
}