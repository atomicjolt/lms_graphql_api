require_relative "../canvas_base_input_type"
require_relative "completion_requirement"
require_relative "content_detail"

module LMSGraphQL
  module Types
    module Canvas
        class ModuleItemTypeEnum < ::GraphQL::Schema::Enum
          value "File"
          value "Page"
          value "Discussion"
          value "Assignment"
          value "Quiz"
          value "SubHeader"
          value "ExternalUrl"
          value "ExternalTool"
        end
      class CanvasModuleItemInput < BaseInputObject
        description "Modules. API Docs: https://canvas.instructure.com/doc/api/modules.html"
        argument :id, ID, "the unique identifier for the module item.Example: 768", required: false
        argument :module_id, ID, "the id of the Module this item appears in.Example: 123", required: false
        argument :position, Int, "the position of this item in the module (1-based).Example: 1", required: false
        argument :title, String, "the title of this item.Example: Square Roots: Irrational numbers or boxy vegetables?", required: false
        argument :indent, Int, "0-based indent level; module items may be indented to show a hierarchy.Example: 0", required: false
        argument :type, ModuleItemTypeEnum, "the type of object referred to one of 'File', 'Page', 'Discussion', 'Assignment', 'Quiz', 'SubHeader', 'ExternalUrl', 'ExternalTool'.Example: Assignment", required: false
        argument :content_id, ID, "the id of the object referred to applies to 'File', 'Discussion', 'Assignment', 'Quiz', 'ExternalTool' types.Example: 1337", required: false
        argument :html_url, String, "link to the item in Canvas.Example: https://canvas.example.edu/courses/222/modules/items/768", required: false
        argument :url, String, "(Optional) link to the Canvas API object, if applicable.Example: https://canvas.example.edu/api/v1/courses/222/assignments/987", required: false
        argument :page_url, String, "(only for 'Page' type) unique locator for the linked wiki page.Example: my-page-title", required: false
        argument :external_url, String, "(only for 'ExternalUrl' and 'ExternalTool' types) external url that the item points to.Example: https://www.example.com/externalurl", required: false
        argument :new_tab, Boolean, "(only for 'ExternalTool' type) whether the external tool opens in a new tab.", required: false
        argument :completion_requirement, LMSGraphQL::Types::Canvas::CanvasCompletionRequirementInput, "Completion requirement for this module item.Example: min_score, 10, true", required: false
        argument :content_details, LMSGraphQL::Types::Canvas::CanvasContentDetailInput, "(Present only if requested through include[]=content_details) If applicable, returns additional details specific to the associated object.Example: 20, 2012-12-31T06:00:00-06:00, 2012-12-31T06:00:00-06:00, 2012-12-31T06:00:00-06:00", required: false
        argument :published, Boolean, "(Optional) Whether this module item is published. This field is present only if the caller has permission to view unpublished items..Example: true", required: false

      end
    end
  end
end