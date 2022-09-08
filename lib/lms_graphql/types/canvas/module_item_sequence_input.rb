require_relative "../canvas_base_input_type"
require_relative "module_item_sequence_node"
require_relative "module"

module LMSGraphQL
  module Types
    module Canvas
      class CanvasModuleItemSequenceInput < BaseInputObject
          description "Modules. API Docs: https://canvas.instructure.com/doc/api/modules.html"
        argument :items, [LMSGraphQL::Types::Canvas::CanvasModuleItemSequenceNodeInput], "an array containing one ModuleItemSequenceNode for each appearence of the asset in the module sequence (up to 10 total).Example: {'prev'=>nil, 'current'=>{'id'=>768, 'module_id'=>123, 'title'=>'A lonely page', 'type'=>'Page'}, 'next'=>{'id'=>769, 'module_id'=>127, 'title'=>'Project 1', 'type'=>'Assignment'}, 'mastery_path'=>{'locked'=>true, 'assignment_sets'=>[], 'selected_set_id'=>nil, 'awaiting_choice'=>false, 'still_processing'=>false, 'modules_url'=>'/courses/11/modules', 'choose_url'=>'/courses/11/modules/items/9/choose', 'modules_tab_disabled'=>false}}", required: false
        argument :modules, [LMSGraphQL::Types::Canvas::CanvasModuleInput], "an array containing each Module referenced above.Example: {'id'=>123, 'name'=>'Overview'}, {'id'=>127, 'name'=>'Imaginary Numbers'}", required: false

      end
    end
  end
end