LifeSpan = 1.0
Sprites =
{
	{
		Name = "sbApacheTurn",

		States =
		{
			Normal =
			{
				Frames =
				{
					{ texture = path .. "/weapons/helicopter/apacheTurn0.tga", duration = 0.08},
					{ texture = path .. "/weapons/helicopter/apacheTurn1.tga", duration = 0.04},
					mipmap = true,
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
		LocalPosition = { x = 0, y = 100, z = 0 },
		LocalVelocity = { x = 0, y = -1000, z = 0 },
		Acceleration = { x = 0, y = 0, z = 0 },
		Drag = 0.0,
		Sprite = "sbApacheTurn",
		Additive = false,
		TimeToLive = 0.12,
		Angle = -90,
		InitialSize = 1.6,
		ExpansionRate = 0,
		AngularVelocity = 0,
		RandomAngularVelocityMagnitude = 0,
		Colour1 = { 255, 255, 255, 255 },
		Colour2 = { 255, 255, 255, 255 },
	},
}