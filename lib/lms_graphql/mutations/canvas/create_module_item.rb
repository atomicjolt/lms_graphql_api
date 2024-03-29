require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/module_item"
module LMSGraphQL
  module Mutations
    module Canvas
      class CreateModuleItem < BaseMutation
        argument :course_id, ID, required: true
        argument :module_id, ID, required: true
        argument :module_item_title, String, required: false
        argument :module_item_type, String, required: true
        argument :module_item_content_id, String, required: true
        argument :module_item_position, Int, required: false
        argument :module_item_indent, Int, required: false
        argument :module_item_page_url, String, required: false
        argument :module_item_external_url, String, required: false
        argument :module_item_new_tab, Boolean, required: false
        argument :module_item_completion_requirement_type, String, required: false
        argument :module_item_completion_requirement_min_score, Int, required: false
        argument :module_item_iframe_width, Int, required: false
        argument :module_item_iframe_height, Int, required: false
        
        
        field :module_item, LMSGraphQL::Types::Canvas::CanvasModuleItem, null: false
        
        def resolve(course_id:, module_id:, module_item_title: nil, module_item_type:, module_item_content_id:, module_item_position: nil, module_item_indent: nil, module_item_page_url: nil, module_item_external_url: nil, module_item_new_tab: nil, module_item_completion_requirement_type: nil, module_item_completion_requirement_min_score: nil, module_item_iframe_width: nil, module_item_iframe_height: nil)
          context[:canvas_api].call("CREATE_MODULE_ITEM").proxy(
            "CREATE_MODULE_ITEM",
            {
              "course_id": course_id,
              "module_id": module_id
            },
            {
              "module_item[title]": module_item_title,
              "module_item[type]": module_item_type,
              "module_item[content_id]": module_item_content_id,
              "module_item[position]": module_item_position,
              "module_item[indent]": module_item_indent,
              "module_item[page_url]": module_item_page_url,
              "module_item[external_url]": module_item_external_url,
              "module_item[new_tab]": module_item_new_tab,
              "module_item[completion_requirement][type]": module_item_completion_requirement_type,
              "module_item[completion_requirement][min_score]": module_item_completion_requirement_min_score,
              "module_item[iframe][width]": module_item_iframe_width,
              "module_item[iframe][height]": module_item_iframe_height
            },
          ).parsed_response
        end
      end
    end
  end
end