local org = require "orgmode"

local cmp = require "cmp"
local config = cmp.get_config()
table.insert(config.sources, {
  name = "orgmode",
})
cmp.setup(config)
-- require('cmp').setup({
--   sources = {
--     { name = 'orgmode' }
--   }
-- })
org.setup {
  org_capture_templates = {
    t = {
      description = "To-Do",
      subtemplates = {
        d = {
          description = "Development",
          headline = "development",
          subtemplates = {
            r = {
              description = "Renderer",
              template = "* TODO %? :renderer:\n  %^t",
              target = "~/notes/development/renderer.org",
            },
            f = {
              description = "Image Processing",
              template = "* TODO %? :post-processing:\n  %^t",
              target = "~/notes/development/post-processing.org",
            },
            w = {
              description = "OptiX Wrapper",
              template = "* TODO %? :wrapper:\n  %^t",
              target = "~/notes/development/wrapper.org",
            },
            c = {
              description = "Configurations",
              template = "* TODO %? :configuration:\n  %^t",
              target = "~/notes/development/configurations.org",
            },
            m = {
              description = "Modeling",
              template = "* TODO %? :modeling:\n  %^t",
              target = "~/notes/development/modeling.org",
            },
          },
        },
        g = {
          description = "General",
          template = "* TODO %? \n  %^t",
          target = "~/notes/development/general.org",
        },
        c = {
          description = "Communication",
          subtemplates = {
            e = {
              description = "Email",
              template = "* TODO %? \n  %^t",
              target = "~/notes/development/comms.org",
            },
            t = {
              description = "Teams",
              template = "* TODO %? \n  %^t",
              target = "~/notes/development/comms.org",
            },
          },
        },
      },
    },
  },
}
