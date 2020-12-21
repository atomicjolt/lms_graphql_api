require_relative "../canvas_base_input_type"
require_relative "module_item"
require_relative "module_item"
require_relative "module_item"

module LMSGraphQL
  module Types
    module Canvas
      class CanvasModuleItemSequenceNodeInput < BaseInputObject
        description "Modules. API Docs: https://canvas.instructure.com/doc/api/modules.html"
      	argument :prev, LMSGraphQL::Types::Canvas::CanvasModuleItemInput, "The previous ModuleItem in the sequence.", required: false
      	argument :current, LMSGraphQL::Types::Canvas::CanvasModuleItemInput, "The ModuleItem being queried.Example: 768, 123, A lonely page, Page", required: false
      	argument :next, LMSGraphQL::Types::Canvas::CanvasModuleItemInput, "The next ModuleItem in the sequence.Example: 769, 127, Project 1, Assignment", required: false
      	argument :mastery_path, String, "The conditional release rule for the module item, if applicable.Example: true, , , false, false, /courses/11/modules, /courses/11/modules/items/9/choose, false", required: false

      end
    end
  end
end