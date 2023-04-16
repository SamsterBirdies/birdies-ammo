LifeSpan = 5
Effects =
{
	{
		Type = "sparks",
		TimeToTrigger = 0,
		SparkCount = 1,
		LocalPosition = { x = 0, y = 0, z = 0 },	-- how to place the origin relative to effect position and direction (0, 0) 
		Texture = path .. "/effects/media/parachute.png",
		TrailEffect = nil,

		Gravity = 150,						-- gravity applied to particle (981 is earth equivalent)
		
		NormalDistribution =					-- distribute sparks evenly between two angles with optional variation
		{
			Mean = -0,
			StdDev = 0,					-- standard deviation at each iteration in degrees (zero will make them space perfectly even)
		},

		Keyframes =							
		{
			{
				Angle = -180,
				RadialOffsetMin = 0,
				RadialOffsetMax = 0,
				ScaleMean = 1,
				ScaleStdDev = 0,
				SpeedStretch = 0,
				SpeedMean = -100,
				SpeedStdDev = 0,
				Drag = 0,
				RotationMean = 0,
				RotationStdDev = 0,
				RotationalSpeedMean = 0,
				RotationalSpeedStdDev = 0,
				AgeMean = 1.0,
				AgeStdDev = 0,
				AlphaKeys = { 0.01, 0.5 },
				ScaleKeys = { 0.01, 1 },
			},
		},
	},
	{
		Type = "sparks",
		TimeToTrigger = 0,
		SparkCount = 1,
		LocalPosition = { x = 0, y = -60, z = 0 },	-- how to place the origin relative to effect position and direction (0, 0) 
		Texture = path .. "/effects/media/pilot_down.png",
		TrailEffect = nil,

		Gravity = 981,						-- gravity applied to particle (981 is earth equivalent)
		
		NormalDistribution =					-- distribute sparks evenly between two angles with optional variation
		{
			Mean = 0,
			StdDev = 0,					-- standard deviation at each iteration in degrees (zero will make them space perfectly even)
		},

		Keyframes =							
		{
			{
				Angle = -180,
				RadialOffsetMin = 0,
				RadialOffsetMax = 0,
				ScaleMean = 1,
				ScaleStdDev = 0,
				SpeedStretch = 0,
				SpeedMean = -100,
				SpeedStdDev = 0,
				Drag = 0,
				RotationMean = 0,
				RotationStdDev = 0,
				RotationalSpeedMean = 0,
				RotationalSpeedStdDev = 0,
				AgeMean = 3,
				AgeStdDev = 0,
				AlphaKeys = { 0.01, 0.5 },
				ScaleKeys = { 0.01, 1 },
			},
		},
	},
}
SoundEvent = "effects/weapon_hurt"