dofile("effects/device_explode_util.lua")

--  age (in seconds) at which the explosion actor deletes itself
--  make sure this exceedes the age of all effects
LifeSpan = 4
SoundEvent = "mods/BirdiesAmmo/impact_hail"
Sprites =
{
	{
		Name = "sbImpact_hail2",

		States =
		{
			Normal =
			{
				Frames =
				{
					{ texture = path .. "/effects/media/hailImpact0"},
					{ texture = path .. "/effects/media/hailImpact1", duration = 0.025},
					{ texture = path .. "/effects/media/hailImpact2" },
					{ texture = path .. "/effects/media/hailImpact3" },
					{ texture = path .. "/effects/media/hailImpact4"},
					{ texture = path .. "/effects/media/hailImpact5"},
					{ texture = path .. "/blank.png", duration = 1 },
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
		LocalPosition = { x = 0, y = 0, z = 0 },
		LocalVelocity = { x = 0, y = 0, z = 0 },
		Acceleration = { x = 0, y = 0, z = 0 },
		Drag = 0,
		Sprite = "sbImpact_hail2",
		Additive = false,
		TimeToLive = 0.5,
		InitialSize = 1.5,
		ExpansionRate = 1000,
		Angle = 0,
		AngularVelocity = 0,
		RandomAngularVelocityMagnitude = 0,
		Colour1 = { 255, 255, 255, 255 },
		Colour2 = { 255, 255, 255, 255 },
	},
	{
	--PRIMARY FLAMES
		Type = "sparks",
		TimeToTrigger = 0.1,
		SparkCount = 3,
		LocalPosition = { x = 0, y = 0 },	-- how to place the origin relative to effect position and direction (0, 0) 
		Texture = "effects/media/flame",
		TrailEffect = "effects/missile_streams.lua",

		Gravity = 50,						-- gravity applied to particle (981 is earth equivalent)
		
		EvenDistribution =					-- distribute sparks evenly between two angles with optional variation
		{
			Min = -70,						-- minimum angle in degrees (e.g. -180, 45, 0)
			Max = 70,						-- maximum angle in degrees (e.g. -180, 45, 0)
			StdDev = 5,						-- standard deviation at each iteration in degrees (zero will make them space perfectly even)
		},

		Keyframes =							
		{
			{
				Angle = -70,				-- angle of keyframe in degrees (e.g. -180, 45, 0)
				RadialOffsetMin = 0,		-- minimum distance from effect origin
				RadialOffsetMax = 20,		-- maximum distance from effect origin
				ScaleMean = 1,				-- mean scale (normal distribution)
				ScaleStdDev = 0.2,			-- standard deviation of scale (0 will make them all the same size)
				SpeedStretch = 0.05,			-- factor of speed by which to elongate the spark in the direction of travel (avoid using with rotation)
				SpeedMean = 4000,				-- mean speed of sparks at emission (normal distribution)
				SpeedStdDev = 250,			-- standard deviation of spark speed at emission
				Drag = 1,					-- drag of sparks (zero will make them continue at same speed)
				RotationMean = 0,			-- mean initial rotation in degrees (e.g. -180, 45, 0) (normal distribution)
				RotationStdDev = 0,		-- standard deviation of initial rotation in degrees (zero will make them start at the same angle)
				RotationalSpeedMean = 0,	-- mean rotational speed in degrees per second (e.g. -180, 45, 0) (normal distribution)
				RotationalSpeedStdDev = 0,	-- standard deviation of rotational speed in degrees per second (zero will make them rotate at the same rate)
				AgeMean = 0.15,				-- mean age in seconds (normal distribution)
				AgeStdDev = 0,				-- standard deviation of age in seconds (zero makes them last the same length of time)
				AlphaKeys = { 0, 0.5 },	-- fractions of life span between which the spark reaches full alpha (fade in -> full alpha -> fade out)
				ScaleKeys = { 0, 0.5 },	-- fractions of life span between which the spark reaches full scale (balloon in -> full scale -> shrink out)
			},
			{
				Angle = 0,
				RadialOffsetMin = 0,
				RadialOffsetMax = 20,
				ScaleMean = 1,
				ScaleStdDev = 0.1,
				SpeedStretch = 0.05,
				SpeedMean = 4000,
				SpeedStdDev = 250,
				Drag = 1,
				RotationMean = 0,
				RotationStdDev = 0,
				RotationalSpeedMean = 0,
				RotationalSpeedStdDev = 0,
				AgeMean = 0.15,
				AgeStdDev = 0,
				AlphaKeys = { 0.1, 0.5 },
				ScaleKeys = { 0.1, 0.5 },
			},
			{
				Angle = 70,
				RadialOffsetMin = 0,
				RadialOffsetMax = 20,
				ScaleMean = 1,
				ScaleStdDev = 0.2,
				SpeedStretch = 0.05,
				SpeedMean = 4000,
				SpeedStdDev = 250,
				Drag = 2,
				RotationMean = 0,
				RotationStdDev = 0,
				RotationalSpeedMean = 0,
				RotationalSpeedStdDev = 0,
				AgeMean = 0.15,
				AgeStdDev = 0,
				AlphaKeys = { 0.1, 0.5 },
				ScaleKeys = { 0.1, 0.5 },
			},
		},
	},
	{
	--SECONDARY FLAMES
		Type = "sparks",
		TimeToTrigger = 0,
		SparkCount = 4,
		LocalPosition = { x = 0, y = 0 },	-- how to place the origin relative to effect position and direction (0, 0) 
		Texture = "effects/media/flame",
		--TrailEffect = "effects/missile_streams.lua",

		Gravity = 50,						-- gravity applied to particle (981 is earth equivalent)
		
		EvenDistribution =					-- distribute sparks evenly between two angles with optional variation
		{
			Min = -35,						-- minimum angle in degrees (e.g. -180, 45, 0)
			Max = 35,						-- maximum angle in degrees (e.g. -180, 45, 0)
			StdDev = 5,						-- standard deviation at each iteration in degrees (zero will make them space perfectly even)
		},

		Keyframes =							
		{
			{
				Angle = -35,
				RadialOffsetMin = 0,
				RadialOffsetMax = 20,
				ScaleMean = 0.75,
				ScaleStdDev = 0.2,
				SpeedStretch = 0.02,
				SpeedMean = 1450,
				SpeedStdDev = 200,
				Drag = 1,
				RotationMean = 0,
				RotationStdDev = 0,
				RotationalSpeedMean = 0,
				RotationalSpeedStdDev = 0,
				AgeMean = 0.3,
				AgeStdDev = 0.05,
				AlphaKeys = { 0.1, 0.5 },
				ScaleKeys = { 0.1, 0.5 },
			},
			{
				Angle = 35,
				RadialOffsetMin = 0,
				RadialOffsetMax = 20,
				ScaleMean = 1.5,
				ScaleStdDev = 0.1,
				SpeedStretch = 0,
				SpeedMean = 1450,
				SpeedStdDev = 200,
				Drag = 1,
				RotationMean = 0,
				RotationStdDev = 0,
				RotationalSpeedMean = 0,
				RotationalSpeedStdDev = 0,
				AgeMean = 0.3,
				AgeStdDev = 0.05,
				AlphaKeys = { 0, 0.5 },
				ScaleKeys = { 0, 0.5 },
			},
		},
	},
	{
		Type = "sparks",
		TimeToTrigger = 0.0,
		SparkCount = 1,
		BurstPeriod = 8,
		SparksPerBurst = 1,
		LocalPosition = { x = 0, y = 0, z = -2 },
		Sprite = "effects/media/CloudLarge.tga",

		Gravity = 0,
		Additive = false,

		EvenDistribution =					-- distribute sparks evenly between two angles with optional variation
		{
			Min = -80,						-- minimum angle in degrees (e.g. -180, 45, 0)
			Max = 80,						-- maximum angle in degrees (e.g. -180, 45, 0)
			StdDev = 5,						-- standard deviation at each iteration in degrees (zero will make them space perfectly even)
		},

		Keyframes =							
		{
			{
				Angle = 0,
				RadialOffsetMin = 0,
				RadialOffsetMax = 20,
				ScaleMean = 5.5,
				ScaleStdDev = 0.1,
				SpeedStretch = 0.2,
				SpeedMean = 10,
				SpeedStdDev = 2,
				Drag = 0.1,
				RotationMean = 60,
				RotationStdDev = 10,
				RotationalSpeedMean = 60,
				RotationalSpeedStdDev = 10,	
				AgeMean = 4,
				AgeStdDev = 0,
				AlphaKeys = { 0.1, 1 },
				ScaleKeys = { 0.1, 0.2 },
				colour = {200, 200, 200, 200},
			},
		},
	},
	{
		Type = "shake",
		PlayForEnemy = true,
		FalloffStart = 1500,
		FalloffEnd = 3000,
		TimeToTrigger = 0,
		TimeToLive = 0.3,
		Magnitude = 15,
	},
}