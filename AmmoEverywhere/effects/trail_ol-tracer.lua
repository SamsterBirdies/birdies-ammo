
--  age (in seconds) at which the explosion actor deletes itself
--  make sure this exceedes the age of all effects
LifeSpan = 20.0
SoundEvent = "mods/BirdiesAmmo/trail_tracer"
Effects =
{

	{
		Type = "trail",
		Texture = path .. "/effects/media/tracertrail.tga",
		LocalPosition = { x = 0, y = 0, z = 9.0 },
		Width = 6,
		Length = 11.75,
		Keyframes = 50,
		KeyframePeriod = 0.025,
		RepeatRate = 0.002,
		ScrollRate = 0,
		FattenRate = 0,
	},
	{
		Type = "sparks",
		TimeToTrigger = 0.0,
		SparkCount = 40,
		BurstPeriod = 0.04,
		SparksPerBurst = 1,
		LocalPosition = { x = 0, y = 0, z = -266 },
		Sprite = path .. "/effects/media/sparkle.png",

		Gravity = 0,

		NormalDistribution =					-- distribute sparks evenly between two angles with optional variation
		{
			Mean = 0,
			StdDev = 15,						-- standard deviation at each iteration in degrees (zero will make them space perfectly even)
		},
		
		Keyframes =							
		{
			{
				Angle = 0,
				RadialOffsetMin = 0,
				RadialOffsetMax = 20,
				ScaleMean = 1.0,
				ScaleStdDev = 0.45,
				SpeedStretch = 0,
				SpeedMean = 50,
				SpeedStdDev = 5,
				Drag = 0.1,
				RotationMean = 0,
				RotationStdDev = 45,
				RotationalSpeedMean = 0,
				RotationalSpeedStdDev = 15,	
				AgeMean = 1.4,
				AgeStdDev = .4,
				AlphaKeys = { 0.1, 1 },
				ScaleKeys = { 0.1, 0.2 },
				colour = { 255, 255, 255, 255 },
			},
		},
	},

}
