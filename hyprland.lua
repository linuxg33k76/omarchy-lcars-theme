-- TNG LCARS window chrome. The orange-to-gold frame is the elbow;
-- rounding stays with this theme and the next theme reload clears it.
local active_border_color = { colors = { "rgb(ff9900)", "rgb(ffcc66)" }, angle = 45 }
local inactive_border_color = "rgba(ffcc9966)"

hl.config({
  general = {
    border_size = 3,
    col = {
      active_border = active_border_color,
      inactive_border = inactive_border_color,
    },
  },

  decoration = {
    rounding = 12,
    rounding_power = 2.2,
    shadow = {
      enabled = true,
      range = 6,
      render_power = 3,
      color = "rgba(ff990066)",
      color_inactive = "rgba(00000000)",
    },
  },

  group = {
    col = {
      border_active = active_border_color,
      border_inactive = inactive_border_color,
    },
    groupbar = {
      text_color = "rgb(ffcc99)",
      text_color_inactive = "rgba(ffcc9999)",
      col = {
        active = "rgb(1c130c)",
        inactive = "rgba(000000ee)",
      },
    },
  },
})
