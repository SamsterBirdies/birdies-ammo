LifeSpan = 5.0
Effects =
{
	{
		Type = "sparks",
		TimeToTrigger = 0,
		SparkCount = 1,
		LocalPosition = { x = 0, y = 0, z = -2 },	-- how to place the origin relative to effect position and direction (0, 0) 
		Texture = path .. "/weapons/glider/gliderJet.png",
		TrailEffect = "effects/debris_trails.lua",

		Gravity = 981,						-- gravity applied to particle (981 is earth equivalent)
		
		NormalDistribution =					-- distribute sparks evenly between two angles with optional variation
		{
			Mean = -180,
			StdDev = 40,					-- standard deviation at each iteration in degrees (zero will make them space perfectly even)
		},

		Keyframes =							
		{
			{
				Angle = 0,
				RadialOffsetMin = 0,
				RadialOffsetMax = 20,
				ScaleMean = 1,
				ScaleStdDev = 0,
				SpeedStretch = 0,
				SpeedMean = 800,
				SpeedStdDev = 300,
				Drag = 1,
				RotationMean = 0,
				RotationStdDev = 0,
				RotationalSpeedMean = 720,
				RotationalSpeedStdDev = 0,
				AgeMean = 2.5,
				AgeStdDev = 0,
				AlphaKeys = { 0.01, 0.5 },
				ScaleKeys = { 0.01, 0.5 },
			},
		},
	},
	{
		Type = "sprite",
		TimeToTrigger = 0.2,
		LocalPosition = { x = 0, y = 0, z = 0 },
		LocalVelocity = { x = 0, y = 0, z = 0 },
		Acceleration = { x = 0, y = 0, z = 0 },
		Drag = 0,
		Sprite = "effects/media/CloudLarge",
		Additive = false,
		TimeToLive = 1.5,
		InitialSize = 0.7,
		ExpansionRate = 300,
		AngularVelocity = 0,
		RandomAngularVelocityMagnitude = 0,
		Colour1 = { 255, 255, 255, 255 },
		Colour2 = { 255, 255, 255, 0 },
	},
}