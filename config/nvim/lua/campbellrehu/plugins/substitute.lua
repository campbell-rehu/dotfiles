return {
  "gbprod/substitute.nvim",
  event = { "BufReadPre", "BufNewFile"},
  config = function()
    local substitute = require("substitute")

    substitute.setup()

    local helpers = require("campbellrehu.core.helpers")

    helpers.generateKeymap("n", "s", substitute.operator, "Substitute with motion")
    helpers.generateKeymap("n", "ss", substitute.line, "Substitute line")
    helpers.generateKeymap("n", "S", substitute.eol, "Substitute to end of line ")
    helpers.generateKeymap("x", "s", substitute.visual, "Substitute in visual mode")
  end
}
