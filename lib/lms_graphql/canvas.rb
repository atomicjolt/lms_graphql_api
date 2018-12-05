require "graphql"
require_relative "utils"
require_relative "types/canvas_hacks"
require_relative "types/canvas_forward_declarations"
require_all(File.absolute_path(__FILE__), "types/canvas/")
require_all(File.absolute_path(__FILE__), "resolvers/canvas/")
#require_all(File.absolute_path(__FILE__), "mutations/canvas/")
require_relative "canvas_schema"