require_relative "../canvas_base_input_type"
require_relative "content_export"

module LMSGraphQL
  module Types
    module Canvas
      class CanvasContentShareInput < BaseInputObject
          description "Content Shares. API Docs: https://canvas.instructure.com/doc/api/content_shares.html"
      argument :id, ID, "The id of the content share for the current user.Example: 1", required: false
      argument :name, String, "The name of the shared content.Example: War of 1812 homework", required: false
      argument :content_type, String, "The type of content that was shared. Can be assignment, discussion_topic, page, quiz, module, or module_item..Example: assignment", required: false
      argument :created_at, LMSGraphQL::Types::DateTimeType, "The datetime the content was shared with this user..Example: 2017-05-09T10:12:00Z", required: false
      argument :updated_at, LMSGraphQL::Types::DateTimeType, "The datetime the content was updated..Example: 2017-05-09T10:12:00Z", required: false
      argument :user_id, ID, "The id of the user who sent or received the content share..Example: 1578941", required: false
      argument :sender, String, "The user who shared the content. This field is provided only to receivers; it is not populated in the sender's list of sent content shares..Example: 1, Matilda Vargas, http://localhost:3000/image_url, http://localhost:3000/users/1", required: false
      argument :receivers, String, "An Array of users the content is shared with.  This field is provided only to senders; an empty array will be returned for the receiving users..Example: {'id'=>1, 'display_name'=>'Jon Snow', 'avatar_image_url'=>'http://localhost:3000/image_url2', 'html_url'=>'http://localhost:3000/users/2'}", required: false
      argument :source_course, String, "The course the content was originally shared from..Example: 787, History 105", required: false
      argument :read_state, String, "Whether the recipient has viewed the content share..Example: read", required: false
      argument :content_export, LMSGraphQL::Types::Canvas::CanvasContentExportInput, "The content export record associated with this content share.Example: 42", required: false

      end
    end
  end
end