require_relative "../canvas_base_type"
require_relative "module_item"
require_relative "module_item"
require_relative "module_item"

module LMSGraphQL
  module Types
    module Canvas
      class CanvasModuleItemSequenceNode < BaseType
          description "Modules. API Docs: https://canvas.instructure.com/doc/api/modules.html"
        field :prev, LMSGraphQL::Types::Canvas::CanvasModuleItem, "The previous ModuleItem in the sequence.", null: true
        field :current, LMSGraphQL::Types::Canvas::CanvasModuleItem, "The ModuleItem being queried.Example: 768, 123, A lonely page, Page", null: true
        field :next, LMSGraphQL::Types::Canvas::CanvasModuleItem, "The next ModuleItem in the sequence.Example: 769, 127, Project 1, Assignment", resolver_method: :resolve_next, null: true
        def resolve_next
          object[:next]
        end
        field :mastery_path, String, "The conditional release rule for the module item, if applicable.Example: true, , , false, false, /courses/11/modules, /courses/11/modules/items/9/choose, false", null: true

      end
    end
  end
end