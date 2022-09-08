require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasPageViewLinkInput < BaseInputObject
          description "Users. API Docs: https://canvas.instructure.com/doc/api/users.html"
        argument :user, Int, "The ID of the user for this page view.Example: 1234", required: false
        argument :context, Int, "The ID of the context for the request (course id if context_type is Course, etc).Example: 1234", required: false
        argument :asset, Int, "The ID of the asset for the request, if any.Example: 1234", required: false
        argument :real_user, Int, "The ID of the actual user who made this request, if the request was made by a user who was masquerading.Example: 1234", required: false
        argument :account, Int, "The ID of the account context for this page view.Example: 1234", required: false

      end
    end
  end
end