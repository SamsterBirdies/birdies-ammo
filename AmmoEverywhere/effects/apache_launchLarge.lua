--  age (in seconds) at which the explosion actor deletes itself
--  make sure this exceedes the age of all effects
LifeSpan = 5
SoundEvent = "mods/BirdiesAmmo/apache_launchLarge"
WarmupVerticalOffset = 5
LaunchVerticalOffset = -65
EffectDepth = -110
Sprites =
{
	{
		Name = "sblaunchFlame2",

		States =
		{
			Normal =
			{
				Frames =
				{
					{ texture = path .. "/effects/media/apachelaunch0", colour = {255,255,255,0.95}},
					{ texture = path .. "/effects/media/apachelaunch1", colour = {255,255,255,0.8}},
					{ texture = path .. "/effects/media/apachelaunch2", colour = {255,255,255,0.7} },
					{ texture = path .. "/effects/media/apachelaunch3", colour = {255,255,255,0.5} },
					{ texture = path .. "/blank.png", duration = 0.4 },
					duration = 0.08,
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
		LocalPosition = { x = 0, y = 120, z = -120 },
		LocalVelocity = { x = 0, y = 0, z = 0 },
		Acceleration = { x = 0, y = 0, z = 0 },
		Drag = 0,
		Sprite = "sblaunchFlame2",
		Additive = false,
		TimeToLive = 0.5,
		InitialSize = 2.5,
		--ExpansionRate = 1000,
		Angle = -90,
		AngularVelocity = 0,
		RandomAngularVelocityMagnitude = 0,
		Colour1 = { 255, 255, 255, 255 },
		Colour2 = { 255, 255, 255, 255 },
	},
	{
		Type = "sparks",
		TimeToTrigger = 0,
		SparkCount = 20,
		BurstPeriod = 50,
		SparksPerBurst = 20,
		LocalPosition = { x = 0, y = LaunchVerticalOffset, z = EffectDepth },	-- how to place the origin relative to effect position and direction (0, 0) 
		Sprite = "effects/media/Steam",

		Gravity = -50,						-- gravity applied to particle (981 is earth equivalent)

		NormalDistribution =
		{
			Mean = 0,
			StdDev = 60,
		},

		Keyframes =
		{
			{
				Angle = -15,				-- angle of keyframe in degrees (e.g. -180, 45, 0)
				RadialOffsetMin = 0,		-- minimum distance from effect origin
				RadialOffsetMax = 20,		-- maximum distance from effect origin
				ScaleMean = 0.5,			-- mean scale (normal distribution)
				ScaleStdDev = 0.02,			-- standard deviation of scale (0 will make them all the same size)
				SpeedStretch = 0,			-- factor of speed by which to elongate the spark in the direction of travel (avoid using with rotation)
				SpeedMean = 30,				-- mean speed of sparks at emission (normal distribution)
				SpeedStdDev = 1,			-- standard deviation of spark speed at emission
				Drag = 0.2,					-- drag of sparks (zero will make them continue at same speed)
				RotationMean = 0,			-- mean initial rotation in degrees (e.g. -180, 45, 0) (normal distribution)
				RotationStdDev = 45,		-- standard deviation of initial rotation in degrees (zero will make them start at the same angle)
				RotationalSpeedMean = -180,	-- mean rotational speed in degrees per second (e.g. -180, 45, 0) (normal distribution)
				RotationalSpeedStdDev = 0,	-- standard deviation of rotational speed in degrees per second (zero will make them rotate at the same rate)
				AgeMean = 3,				-- mean age in seconds (normal distribution)
				AgeStdDev = .5,				-- standard deviation of age in seconds (zero makes them last the same length of time)
				AlphaKeys = { 0.1, 0.75 },	-- fractions of life span between which the spark reaches full alpha (fade in -> full alpha -> fade out)
				ScaleKeys = { 0.1, 0.75 },	-- fractions of life span between which the spark reaches full scale (balloon in -> full scale -> shrink out)
				colour = { 255, 255, 255, 255 }, -- Colour used to modulate the sprite
			},
			{
				Angle = 0,					-- angle of keyframe in degrees (e.g. -180, 45, 0)
				RadialOffsetMin = 0,		-- minimum distance from effect origin
				RadialOffsetMax = 50,		-- maximum distance from effect origin
				ScaleMean = 0.5,			-- mean scale (normal distribution)
				ScaleStdDev = 0.02,			-- standard deviation of scale (0 will make them all the same size)
				SpeedStretch = 0,			-- factor of speed by which to elongate the spark in the direction of travel (avoid using with rotation)
				SpeedMean = 350,			-- mean speed of sparks at emission (normal distribution)
				SpeedStdDev = 10,			-- standard deviation of spark speed at emission
				Drag = 0.1,					-- drag of sparks (zero will make them continue at same speed)
				RotationMean = 0,			-- mean initial rotation in degrees (e.g. -180, 45, 0) (normal distribution)
				RotationStdDev = 45,		-- standard deviation of initial rotation in degrees (zero will make them start at the same angle)
				RotationalSpeedMean = 5,	-- mean rotational speed in degrees per second (e.g. -180, 45, 0) (normal distribution)
				RotationalSpeedStdDev = 0,	-- standard deviation of rotational speed in degrees per second (zero will make them rotate at the same rate)
				AgeMean = 2.5,				-- mean age in seconds (normal distribution)
				AgeStdDev = .4,				-- standard deviation of age in seconds (zero makes them last the same length of time)
				AlphaKeys = { 0.1, 0.75 },	-- fractions of life span between which the spark reaches full alpha (fade in -> full alpha -> fade out)
				ScaleKeys = { 0.1, 0.75 },	-- fractions of life span between which the spark reaches full scale (balloon in -> full scale -> shrink out)
				colour = { 255, 255, 255, 255 }, -- Colour used to modulate the sprite
			},
			{
				Angle = 15,					-- angle of keyframe in degrees (e.g. -180, 45, 0)
				RadialOffsetMin = 0,		-- minimum distance from effect origin
				RadialOffsetMax = 20,		-- maximum distance from effect origin
				ScaleMean = 0.5,			-- mean scale (normal distribution)
				ScaleStdDev = 0.02,			-- standard deviation of scale (0 will make them all the same size)
				SpeedStretch = 0,			-- factor of speed by which to elongate the spark in the direction of travel (avoid using with rotation)
				SpeedMean = 30,				-- mean speed of sparks at emission (normal distribution)
				SpeedStdDev = 1,			-- standard deviation of spark speed at emission
				Drag = 0.2,					-- drag of sparks (zero will make them continue at same speed)
				RotationMean = 0,			-- mean initial rotation in degrees (e.g. -180, 45, 0) (normal distribution)
				RotationStdDev = 45,		-- standard deviation of initial rotation in degrees (zero will make them start at the same angle)
				RotationalSpeedMean = 180,	-- mean rotational speed in degrees per second (e.g. -180, 45, 0) (normal distribution)
				RotationalSpeedStdDev = 0,	-- standard deviation of rotational speed in degrees per second (zero will make them rotate at the same rate)
				AgeMean = 3,				-- mean age in seconds (normal distribution)
				AgeStdDev = .2,				-- standard deviation of age in seconds (zero makes them last the same length of time)
				AlphaKeys = { 0.1, 0.75 },	-- fractions of life span between which the spark reaches full alpha (fade in -> full alpha -> fade out)
				ScaleKeys = { 0.1, 0.75 },	-- fractions of life span between which the spark reaches full scale (balloon in -> full scale -> shrink out)
				colour = { 255, 255, 255, 255 }, -- Colour used to modulate the sprite
			},
		},
	},
}
