LifeSpan = 1.0
SoundEvent = "mods/BirdiesAmmo/beep"
Sprites =
{
	{
		Name = "sbCall_in",

		States =
		{
			Normal =
			{
				Frames =
				{
					{ texture = "effects/media/Ring_00001.dds" },
					{ texture = "effects/media/Ring_00002.dds" },
					{ texture = "effects/media/Ring_00003.dds" },
					{ texture = "effects/media/Ring_00004.dds" },
					{ texture = "effects/media/Ring_00005.dds" },
					{ texture = "effects/media/Ring_00006.dds" },
					{ texture = "effects/media/Ring_00007.dds" },
					{ texture = "effects/media/Ring_00008.dds" },
					{ texture = "effects/media/Ring_00009.dds" },
					{ texture = "effects/media/Ring_00010.dds" },
					{ texture = "effects/media/Ring_00011.dds" },
					{ texture = "effects/media/Ring_00012.dds" },
					{ texture = "effects/media/Ring_00013.dds" },
					{ texture = "effects/media/Ring_00014.dds" },
					{ texture = "effects/media/Ring_00015.dds" },
					{ texture = "effects/media/Ring_00016.dds" },
					{ texture = "effects/media/Ring_00017.dds" },
					{ texture = "effects/media/Ring_00017.dds", colour = { 1, 1, 1, 0.0 }, duration = 2 }, -- just makes a blank frame long enough to last the rest of the effect

					duration = 0.04,
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
		PlayForEnemy = false,
		TimeToTrigger = 0,
		LocalPosition = { x = 0, y = 0, z = -1 },
		LocalVelocity = { x = 0, y = 0, z = 0 },
		Acceleration = { x = 0, y = 0, z = 0 },
		Drag = 0.0,
		Sprite = "sbCall_in",
		Additive = true,
		TimeToLive = 1,
		InitialSize = 3,
		ExpansionRate = -200,
		AngularVelocity = 0,
		RandomAngularVelocityMagnitude = 0,
		Colour1 = { 255, 255, 255, 255 },
		Colour2 = { 255, 255, 255, 255 },
	},
}
