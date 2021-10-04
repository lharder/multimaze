return {
  version = "1.4",
  luaversion = "5.1",
  tiledversion = "1.4.3",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 20,
  height = 20,
  tilewidth = 64,
  tileheight = 64,
  nextlayerid = 6,
  nextobjectid = 54,
  properties = {},
  tilesets = {
    {
      name = "jumpruntiles01",
      firstgid = 1,
      filename = "jumpruntiles01.json",
      tilewidth = 64,
      tileheight = 64,
      spacing = 0,
      margin = 0,
      columns = 16,
      image = "jumpruntiles01.png",
      imagewidth = 1024,
      imageheight = 1024,
      objectalignment = "unspecified",
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 64,
        height = 64
      },
      properties = {},
      terrains = {},
      tilecount = 256,
      tiles = {}
    }
  },
  layers = {
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 20,
      height = 20,
      id = 1,
      name = "background",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 78, 78, 78, 78, 78, 0, 0, 0, 0,
        0, 0, 0, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 0, 0, 0,
        78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78,
        78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78,
        78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78,
        78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78,
        78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78,
        78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78,
        0, 78, 78, 78, 78, 0, 0, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 0, 0,
        0, 0, 0, 78, 0, 0, 0, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 0, 0,
        0, 0, 0, 0, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78,
        0, 0, 0, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78,
        78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78,
        78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78,
        78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78,
        78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78,
        78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 20,
      height = 20,
      id = 2,
      name = "walls",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 14, 29, 29, 29, 29, 29, 15, 0, 0, 0,
        0, 0, 14, 29, 29, 29, 29, 29, 29, 29, 29, 0, 0, 0, 0, 0, 29, 15, 0, 0,
        29, 29, 29, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 29, 29, 29,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 17, 35, 21, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 17, 35, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        29, 29, 0, 0, 0, 29, 29, 29, 0, 0, 0, 0, 0, 0, 0, 0, 0, 29, 29, 29,
        30, 29, 29, 0, 29, 29, 29, 29, 0, 0, 0, 0, 0, 0, 0, 0, 0, 29, 31, 0,
        0, 30, 29, 29, 29, 0, 0, 29, 21, 0, 0, 23, 35, 35, 21, 0, 0, 29, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 29, 0, 0, 0, 0, 0, 0, 0, 0, 0, 29, 0, 0,
        0, 0, 0, 0, 0, 0, 14, 29, 0, 0, 0, 0, 0, 0, 0, 0, 0, 29, 15, 0,
        0, 0, 14, 29, 29, 29, 29, 51, 36, 36, 36, 36, 36, 21, 0, 17, 36, 50, 29, 29,
        0, 14, 29, 29, 0, 0, 0, 29, 29, 29, 29, 29, 0, 0, 0, 0, 0, 29, 0, 29,
        29, 29, 29, 31, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 29,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 44, 44, 44, 0, 0, 0, 29,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 29,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10, 10, 9, 9, 9, 10, 10, 10, 29,
        29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 20,
      height = 20,
      id = 5,
      name = "things",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 31, 0, 0, 0, 30, 0, 0, 0, 0,
        0, 0, 0, 31, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 30, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 73, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 31, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 93, 77, 0, 93, 0, 0, 0, 64, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        15, 0, 0, 0, 31, 0, 30, 0, 0, 0, 0, 0, 31, 0, 0, 0, 30, 0, 31, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 73, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 20,
      height = 20,
      id = 3,
      name = "foreground",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 4,
      name = "objects",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      objects = {
        {
          id = 1,
          name = "door02",
          type = "door",
          shape = "rectangle",
          x = 832,
          y = 640,
          width = 64,
          height = 64,
          rotation = 0,
          gid = 58,
          visible = true,
          properties = {
            ["factory"] = "door01factory",
            ["locked"] = false,
            ["open"] = true,
            ["variant"] = 1
          }
        },
        {
          id = 12,
          name = "door01",
          type = "door",
          shape = "rectangle",
          x = 320,
          y = 1216,
          width = 64,
          height = 64,
          rotation = 0,
          gid = 58,
          visible = true,
          properties = {
            ["factory"] = "door01factory",
            ["locked"] = false,
            ["open"] = true,
            ["variant"] = 1
          }
        },
        {
          id = 13,
          name = "btn02",
          type = "button",
          shape = "rectangle",
          x = 704,
          y = 640,
          width = 64,
          height = 64,
          rotation = 0,
          gid = 27,
          visible = true,
          properties = {
            ["color"] = "red",
            ["factory"] = "buttonfactory",
            ["listeners"] = "door02"
          }
        },
        {
          id = 14,
          name = "btn01",
          type = "button",
          shape = "rectangle",
          x = 192,
          y = 1216,
          width = 64,
          height = 64,
          rotation = 0,
          gid = 27,
          visible = true,
          properties = {
            ["color"] = "green",
            ["factory"] = "buttonfactory",
            ["listeners"] = "door01,door02"
          }
        },
        {
          id = 15,
          name = "safe01",
          type = "safe",
          shape = "rectangle",
          x = 896,
          y = 1152,
          width = 64,
          height = 64,
          rotation = 0,
          gid = 25,
          visible = true,
          properties = {
            ["factory"] = "safefactory",
            ["item"] = 0,
            ["locked"] = true,
            ["variant"] = 0
          }
        },
        {
          id = 25,
          name = "term01",
          type = "terminal",
          shape = "rectangle",
          x = 704,
          y = 1152,
          width = 64,
          height = 64,
          rotation = 0,
          gid = 26,
          visible = true,
          properties = {
            ["factory"] = "terminalfactory",
            ["listeners"] = "door03"
          }
        },
        {
          id = 31,
          name = "crate01",
          type = "crate",
          shape = "rectangle",
          x = 192,
          y = 640,
          width = 64,
          height = 64,
          rotation = 0,
          gid = 76,
          visible = true,
          properties = {
            ["blocking"] = true,
            ["factory"] = "cratefactory",
            ["variant"] = 1
          }
        },
        {
          id = 32,
          name = "crate02",
          type = "crate",
          shape = "rectangle",
          x = 256,
          y = 576,
          width = 64,
          height = 64,
          rotation = 0,
          gid = 76,
          visible = true,
          properties = {
            ["blocking"] = true,
            ["factory"] = "cratefactory",
            ["variant"] = 1
          }
        },
        {
          id = 33,
          name = "crate03",
          type = "crate",
          shape = "rectangle",
          x = 192,
          y = 576,
          width = 64,
          height = 64,
          rotation = 0,
          gid = 76,
          visible = true,
          properties = {
            ["blocking"] = true,
            ["factory"] = "cratefactory",
            ["variant"] = 1
          }
        },
        {
          id = 34,
          name = "crate04",
          type = "crate",
          shape = "rectangle",
          x = 128,
          y = 576,
          width = 64,
          height = 64,
          rotation = 0,
          gid = 76,
          visible = true,
          properties = {
            ["blocking"] = true,
            ["factory"] = "cratefactory",
            ["variant"] = 1
          }
        },
        {
          id = 35,
          name = "crate05",
          type = "crate",
          shape = "rectangle",
          x = 128,
          y = 512,
          width = 64,
          height = 64,
          rotation = 0,
          gid = 76,
          visible = true,
          properties = {
            ["blocking"] = true,
            ["factory"] = "cratefactory",
            ["variant"] = 1
          }
        },
        {
          id = 36,
          name = "crate06",
          type = "crate",
          shape = "rectangle",
          x = 192,
          y = 512,
          width = 64,
          height = 64,
          rotation = 0,
          gid = 76,
          visible = true,
          properties = {
            ["blocking"] = true,
            ["factory"] = "cratefactory",
            ["variant"] = 1
          }
        },
        {
          id = 42,
          name = "enemy01",
          type = "npc",
          shape = "rectangle",
          x = 768,
          y = 1152,
          width = 64,
          height = 64,
          rotation = 0,
          gid = 28,
          visible = true,
          properties = {
            ["faction"] = 1,
            ["factory"] = "monster09-05factory"
          }
        },
        {
          id = 43,
          name = "enemy02",
          type = "npc",
          shape = "rectangle",
          x = 768,
          y = 512,
          width = 64,
          height = 64,
          rotation = 0,
          gid = 28,
          visible = true,
          properties = {
            ["faction"] = 1,
            ["factory"] = "monster01-02factory"
          }
        },
        {
          id = 44,
          name = "enemy03",
          type = "npc",
          shape = "rectangle",
          x = 704,
          y = 832,
          width = 64,
          height = 64,
          rotation = 0,
          gid = 28,
          visible = true,
          properties = {
            ["faction"] = 1,
            ["factory"] = "monster02-05factory"
          }
        },
        {
          id = 45,
          name = "guitar",
          type = "neon",
          shape = "rectangle",
          x = 320,
          y = 1024,
          width = 64,
          height = 64,
          rotation = 0,
          visible = true,
          properties = {
            ["factory"] = "neonfactory",
            ["variant"] = 1
          }
        },
        {
          id = 46,
          name = "cocktail",
          type = "neon",
          shape = "rectangle",
          x = 896,
          y = 960,
          width = 64,
          height = 64,
          rotation = 0,
          visible = true,
          properties = {
            ["factory"] = "neonfactory",
            ["variant"] = 2
          }
        },
        {
          id = 47,
          name = "joypad",
          type = "neon",
          shape = "rectangle",
          x = 960,
          y = 512,
          width = 64,
          height = 64,
          rotation = 0,
          visible = true,
          properties = {
            ["factory"] = "neonfactory",
            ["variant"] = 9
          }
        },
        {
          id = 51,
          name = "crate07",
          type = "crate",
          shape = "rectangle",
          x = 512,
          y = 1216,
          width = 64,
          height = 64,
          rotation = 0,
          gid = 76,
          visible = true,
          properties = {
            ["blocking"] = true,
            ["factory"] = "cratefactory",
            ["variant"] = 1
          }
        },
        {
          id = 52,
          name = "crate08",
          type = "crate",
          shape = "rectangle",
          x = 512,
          y = 1088,
          width = 64,
          height = 64,
          rotation = 0,
          gid = 76,
          visible = true,
          properties = {
            ["blocking"] = true,
            ["factory"] = "cratefactory",
            ["variant"] = 1
          }
        },
        {
          id = 53,
          name = "crate09",
          type = "crate",
          shape = "rectangle",
          x = 512,
          y = 1024,
          width = 64,
          height = 64,
          rotation = 0,
          gid = 76,
          visible = true,
          properties = {
            ["blocking"] = true,
            ["factory"] = "cratefactory",
            ["reward"] = "",
            ["variant"] = 1
          }
        }
      }
    }
  }
}
