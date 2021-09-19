return {
  version = "1.4",
  luaversion = "5.1",
  tiledversion = "1.4.3",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 12,
  height = 12,
  tilewidth = 64,
  tileheight = 64,
  nextlayerid = 6,
  nextobjectid = 8,
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
      width = 12,
      height = 12,
      id = 2,
      name = "background",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78,
        78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78,
        78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78,
        78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78,
        78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78,
        78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78,
        78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78,
        78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78,
        78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78, 78,
        78, 78, 78, 78, 78, 78, 78, 78, 78, 0, 0, 0,
        78, 78, 78, 78, 78, 78, 78, 78, 78, 0, 0, 0,
        78, 78, 78, 78, 78, 78, 78, 78, 78, 0, 0, 0
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 12,
      height = 12,
      id = 1,
      name = "walls",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29, 29,
        29, 31, 0, 0, 0, 0, 0, 0, 0, 0, 30, 29,
        29, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 29,
        29, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 29,
        29, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 29,
        29, 21, 0, 0, 0, 0, 17, 35, 35, 35, 35, 29,
        29, 0, 0, 9, 0, 0, 0, 0, 0, 0, 0, 29,
        29, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 29,
        29, 0, 0, 0, 0, 9, 0, 0, 29, 29, 29, 29,
        29, 0, 0, 0, 0, 0, 0, 0, 29, 31, 0, 0,
        29, 10, 10, 10, 10, 10, 10, 10, 29, 0, 0, 0,
        29, 29, 29, 29, 29, 29, 29, 29, 29, 0, 0, 0
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 12,
      height = 12,
      id = 4,
      name = "things",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 12,
      height = 12,
      id = 3,
      name = "foreground",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 5,
      name = "objects",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      objects = {
        {
          id = 1,
          name = "exit",
          type = "door",
          shape = "rectangle",
          x = 576,
          y = 320,
          width = 64,
          height = 64,
          rotation = 0,
          gid = 108,
          visible = true,
          properties = {
            ["factory"] = "door01factory",
            ["locked"] = false,
            ["open"] = false,
            ["roomid"] = "001",
            ["roomtags"] = "start",
            ["variant"] = 0
          }
        },
        {
          id = 3,
          name = "btn01",
          type = "button",
          shape = "rectangle",
          x = 64,
          y = 320,
          width = 64,
          height = 64,
          rotation = 0,
          gid = 27,
          visible = true,
          properties = {
            ["color"] = "blue",
            ["factory"] = "buttonfactory",
            ["listeners"] = "exit"
          }
        },
        {
          id = 4,
          name = "entry",
          type = "door",
          shape = "rectangle",
          x = 128,
          y = 640,
          width = 64,
          height = 64,
          rotation = 0,
          gid = 108,
          visible = true,
          properties = {
            ["factory"] = "door01factory",
            ["locked"] = false,
            ["open"] = false,
            ["roomid"] = "002",
            ["roomtags"] = "dungeon",
            ["variant"] = 0
          }
        },
        {
          id = 6,
          name = "player01",
          type = "spawnpoint",
          shape = "point",
          x = 96,
          y = 608,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["factory"] = "localherofactory"
          }
        },
        {
          id = 7,
          name = "player02",
          type = "spawnpoint",
          shape = "point",
          x = 224,
          y = 608,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["factory"] = "remoteherofactory"
          }
        }
      }
    }
  }
}
