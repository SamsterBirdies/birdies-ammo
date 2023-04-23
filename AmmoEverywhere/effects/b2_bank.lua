LifeSpan = 3
Sprites =
{
	{
		Name = "sbB2Banking",

		States =
		{
			Normal =
			{
				Frames =
				{
					{ texture = path .. "/effects/media/b2bank0.png", duration = 0.12},
					{ texture = path .. "/effects/media/b2bank1.png", duration = 0.12},
					{ texture = path .. "/effects/media/b2bank2.png", duration = 0.12},
					{ texture = path .. "/effects/media/b2bank3.png",},
					{ texture = path .. "/effects/media/b2bank4.png",},
					{ texture = path .. "/effects/media/b2bank5.png",},
					{ texture = path .. "/effects/media/b2bank6.png",},
					{ texture = path .. "/effects/media/b2bank7.png",},
					{ texture = path .. "/effects/media/b2bank8.png",},
					{ texture = path .. "/effects/media/b2bank9.png",},
					{ texture = path .. "/blank.png", duration = 3 },
					mipmap = true,
					duration = 0.08
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
		LocalVelocity = { x = 0, y = 1200, z = 0 },
		Acceleration = { x = 0, y = 0, z = 0 },
		Drag = 0.0,
		Sprite = "sbB2Banking",
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
}