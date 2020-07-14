require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasLineItemInput < BaseInputObject
        description "Line Items. API Docs: https://canvas.instructure.com/doc/api/line_items.html"
        argument :id, ID, "The fully qualified URL for showing, updating, and deleting the Line Item.Example: http://institution.canvas.com/api/lti/courses/5/line_items/2", required: false
        argument :score_maximum, Float, "The maximum score of the Line Item.Example: 50", required: false
        argument :label, String, "The label of the Line Item..Example: 50", required: false
        argument :tag, String, "Tag used to qualify a line Item beyond its ids.Example: 50", required: false
        argument :resource_id, String, "A Tool Provider specified id for the Line Item. Multiple line items can share the same resourceId within a given context.Example: 50", required: false
        argument :resource_link_id, String, "The resource link id the Line Item is attached to.Example: 50", required: false
        argument :https://canvas.instructure.com/lti/submission_type, String, "The extension that defines the submission_type of the line_item. Only returns if set through the line_item create endpoint..Example: { 	'type':'external_tool', 	'external_tool_url':'https://my.launch.url', }", required: false

      end
    end
  end
end