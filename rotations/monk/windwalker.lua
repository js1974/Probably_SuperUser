-- ProbablyEngine Rotation Packager
-- Custom Windwalker Monk Rotation
-- Created on Nov 9th 2013 2:50 am

ProbablyEngine.rotation.register_custom(269, "SuperUser",
{
  -- Combat
--  { "pause", "modifier.lalt" },

  -- Interrupt
  { "116705", "modifier.interrupts" },
  
  -- Buffs
  { "116781", -- Legacy of the White Tiger
    {
      "!player.buff(116781).any",
      "!player.buff(17007).any",
      "!player.buff(1459).any",
      "!player.buff(61316).any",
      "!player.buff(24604).any",
      "!player.buff(90309).any",
      "!player.buff(126373).any",
      "!player.buff(126309).any"
    }, "player"
  },
  { "115921", -- Legacy of the Emperor
    {
      "!player.buff(117666).any",
      "!player.buff(1126).any",
      "!player.buff(20217).any",
      "!player.buff(90363).any"
    }, "player"
  },
  -- Queued Spells
  -- T4
  { "116844", "@su.checkQueue(116844)" },
  { "119392", "@su.checkQueue(119392)" }, 
  { "119381", "@su.checkQueue(119381)" },
  -- T5
  { "122280", "@su.checkQueue(122280)" },
  { "122278", "@su.checkQueue(122278)" },
  { "122783", "@su.checkQueue(122783)" },

  -- Misc
  { "122470", "@su.checkQueue(122470)" }, 
  { "117368", "@su.checkQueue(117368)" },
  { "137562", "@su.checkQueue(137562)" },
  { "101643", "@su.checkQueue(101643)" },
  { "119996", "@su.checkQueue(119996)" },
  { "113656", "@su.checkQueue(113656)" },
  { "116095", "@su.checkQueue(116095)" },
  { "115203", "@su.checkQueue(115203)" },
  { "101545", "@su.checkQueue(101545)" },
  { "116740", "@su.checkQueue(116740)" },
  { "115078", "@su.checkQueue(115078)", "mouseover" },
  { "137639", "@su.checkQueue(137639)", "mouseover" },
  { "115460", "@su.checkQueue(115460)", "ground" },
  { "116841", "@su.checkQueue(116841)", "mouseover"},
  -- Cooldowns
  {{
    { "121279", "player.spell(121279).exists" },
    { "26297", "player.spell(26297).exists" },
    { "20572", "player.spell(20572).exists" },
    { "33697", "player.spell(33697).exists" },
    { "33702", "player.spell(33702).exists" },
    { "123904", "player.spell(123904).exists" },
    { "#gloves" },
    { "#6089", "@su.usePot" },
  }, "modifier.cooldowns" },
  
  { "115072", "player.health < 80" },
  { "#6262", "player.health < 40" },
  { "115203", "player.health < 30" },           -- Fort Brew
  { "115450", "@su.detox" },
  { "115460", "modifier.lalt", "ground" },  -- Healing Sphere
  { "122470", "modifier.lshift" },              -- Touch of Karma


  -- CC's
  
  { "137562", "player.state.disorient" }, -- 137562 = Nimble Brew
  { "137562", "player.state.fear" },
  { "137562", "player.state.stun" },
  { "137562", "player.state.root" },
  { "137562", "player.state.horror" },
  { "137562", "player.state.snare" },

  { "116841", "player.state.disorient" }, -- 116841 = Tiger's Lust
  { "116841", "player.state.stun" },
  { "116841", "player.state.root" },
  { "116841", "player.state.snare" },
  
  -- Shared
  {{
    { "115080", "@su.touchOfDeath" },
    {{
      { "115399", "player.spell(115399).charges = 2" },
      { "115399",
        {
          "player.spell(115399).charges = 1",
          "player.spell(115399).cd <= 10",
        }
      }
    },
      {
       "player.spell(115399).exists",
       "player.chi <= 2"
      }
    },
    { "100787", -- Tiger Palm
      {
        "player.buff(125359)",
        "player.buff(125359).duration <= 3"
      }
    },
    { "100787", "!player.buff(125359)" },
    {{
      {"116740", "player.buff(125195).count = 20" },
      {"116740",
        {
          "player.chi >= 2",
          "player.buff(125195).count >= 15",
          "player.buff(125359)",
          "target.debuff(130320)"
        }
      }
    }, "!player.buff(116740)" },
    { "115288", "player.timetomax > 5" },
    { "107428", "!target.debuff(130320)" },
    { "100787", -- Tiger Palm
      {
        "!player.buff(125359)",
        "target.debuff(130320)",
        "target.debuff(130320).duration > 1",
        "player.timetomax > 1"
      }
    },
    -- AoE
    {{
      { "116847", "player.spell(116847).exists" },
      { "115098", "player.spell(115098).exists" },
      { "123986",
        {
          "!player.moving",
          "player.spell(123986).exists"
        }
      },
      { "107428",
      {
        "player.chi = 4",
        "!player.spell(115396).exists"
      }
      },
      { "107428", -- Rising Sun Kick
        {
          "player.chi = 5",
          "player.spell(115396).exists"
        }
      },
      { "101546", "!player.spell(116847).exists" }
    }, "toggle.multitarget" },

    -- Single
    { "107428" },
    { "113656",
      {
        "!player.moving",
        "!player.buff(115288)",
        "player.timetomax > 4",
        "player.buff(125359).duration > 4"
      }
    },
    {{
      { "115098", "player.spell(115098).exists" },
      { "123986",
        {
          "!player.moving",
          "player.spell(123986).exists"
        }
      },
      {{
        { "124081", "!focus.buff(124081)", "focus" },
        { "124081", "!player.buff(124081)", "player" },
      }, "player.spell(124081).exists" },
    }, "player.timetomax > 2" },
    { "100784", "player.buff(116768)" },
    {{
      { "100787", "player.buff(118864).duration <= 2" },
      { "100787", "player.energy >= 2" }
    }, "player.buff(118864)" },
    { "108557", "player.chi <= 2" },
    { "108557",
      {
        "player.chi <= 3",
        "player.spell(115396).exists"
      }
    },
    { "100780", "player.chi <= 2" },
    { "100780",
      {
        "player.chi <= 3",
        "player.spell(115396).exists"
      }
    },
    { "100784", "@su.fillBlackout" },
  }, "target.range <= 5" },
  -- Ranged
  {{
    { "115073",
      {
        "target.range > 5",
        "target.range <= 50",
        "player.chi > 1"
      }
    },
    { "117952",
      {
        "target.range > 5",
        "target.range <= 40",
        "!player.moving"
      }
    },
    { "115072", "player.chi < 4" }
  }, "@su.immuneEvents" },
},
{
  -- Out of Combat
  
 { "101545", "@su.checkQueue(101545)" },	-- Flying Serpent Kick
 { "116841", "@su.checkQueue(116841)", "mouseover"}, 	-- Tiger's Lust mousoever
  
  -- Buffs
  { "116781", -- Legacy of the White Tiger
    {
      "!player.buff(116781).any",
      "!player.buff(17007).any",
      "!player.buff(1459).any",
      "!player.buff(61316).any",
      "!player.buff(24604).any",
      "!player.buff(90309).any",
      "!player.buff(126373).any",
      "!player.buff(126309).any"
    }, "player"
  },
  { "115921", -- Legacy of the Emperor
    {
      "!player.buff(117666).any",
      "!player.buff(1126).any",
      "!player.buff(20217).any",
      "!player.buff(90363).any"
    }, "player"
  },
   { "115072", "toggle.chistacker" } -- Expel Harm
}, function()
ProbablyEngine.toggle.create(
	'chistacker',
	'Interface\\Icons\\ability_monk_expelharm',
	'Stack Chi',
	'Keep Chi at full even OoC...')
end)
