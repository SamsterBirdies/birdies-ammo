LifeSpan = 3
SoundEvent = "mods/BirdiesAmmo/biplane_bank"
Sprites =
{
	{
		Name = "sbBiBanking",

		States =
		{
			Normal =
			{
				Frames =
				{
					{ texture = path .. "/effects/media/bibank0.png",},
					{ texture = path .. "/effects/media/bibank1.png",},
					{ texture = path .. "/effects/media/bibank2.png",},
					{ texture = path .. "/effects/media/bibank3.png",},
					{ texture = path .. "/effects/media/bibank4.png",},
					{ texture = path .. "/effects/media/bibank5.png",},
					{ texture = path .. "/effects/media/bibank6.png",},
					{ texture = path .. "/effects/media/bibank7.png",},
					--{ texture = path .. "/effects/media/bibank8.png", duration = 0.04},
					{ texture = path .. "/blank.png", duration = 5 },
					mipmap = true,
					duration = 0.12
				},
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
		LocalVelocity = { x = 0, y = 2000, z = 0 },
		Acceleration = { x = 0, y = 0, z = 0 },
		Drag = 2.0,
		Sprite = "sbBiBanking",
		Additive = false,
		TimeToLive = 3,
		Angle = -90,
		InitialSize = 1.6 * 2, --image is now half resolution
		ExpansionRate = 0,
		AngularVelocity = 0,
		RandomAngularVelocityMagnitude = 0,
		Colour1 = { 255, 255, 255, 255 },
		Colour2 = { 255, 255, 255, 255 },
		FlipVertOnLeft = true,
	},
	{
		Type = "sprite",
		TimeToTrigger = 0.96,
		LocalPosition = { x = 0, y = 850, z = 0 },
		LocalVelocity = { x = 0, y = 300, z = 0 },
		Acceleration = { x = 0, y = 0, z = 0 },
		Drag = 3.0,
		Sprite = path .. "/effects/media/bibank8.png",
		Additive = false,
		TimeToLive = 4,
		Angle = -90,
		InitialSize = 1.6 * 2,
		ExpansionRate = -200,
		AngularVelocity = 0,
		RandomAngularVelocityMagnitude = 0,
		Colour1 = { 255, 255, 255, 255 },
		Colour2 = { 255, 255, 255, 0 },
		FlipVertOnLeft = true,
	},
}