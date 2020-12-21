require_relative "../canvas_base_type"
require_relative "help_link"
require_relative "help_link"

module LMSGraphQL
  module Types
    module Canvas
      class CanvasHelpLink < BaseType
        description "Accounts. API Docs: https://canvas.instructure.com/doc/api/accounts.html"
      	field :help_link_name, String, "Help link button title.Example: Help And Policies", null: true
      	field :help_link_icon, String, "Help link button icon.Example: help", null: true
      	field :custom_help_links, [LMSGraphQL::Types::Canvas::CanvasHelpLink], "Help links defined by the account. Could include default help links..Example: {'id'=>'link1', 'text'=>'Custom Link!', 'subtext'=>'Something something.', 'url'=>'https://google.com', 'type'=>'custom', 'available_to'=>['user', 'student', 'teacher', 'admin', 'observer', 'unenrolled'], 'is_featured'=>true, 'is_new'=>false, 'feature_headline'=>'Check this out!'}", null: true
      	field :default_help_links, [LMSGraphQL::Types::Canvas::CanvasHelpLink], "Default help links provided when account has not set help links of their own..Example: {'available_to'=>['student'], 'text'=>'Ask Your Instructor a Question', 'subtext'=>'Questions are submitted to your instructor', 'url'=>'#teacher_feedback', 'type'=>'default', 'id'=>'instructor_question', 'is_featured'=>false, 'is_new'=>true, 'feature_headline'=>''}, {'available_to'=>['user', 'student', 'teacher', 'admin', 'observer', 'unenrolled'], 'text'=>'Search the Canvas Guides', 'subtext'=>'Find answers to common questions', 'url'=>'https://community.canvaslms.com/t5/Guides/ct-p/guides', 'type'=>'default', 'id'=>'search_the_canvas_guides', 'is_featured'=>false, 'is_new'=>false, 'feature_headline'=>''}, {'available_to'=>['user', 'student', 'teacher', 'admin', 'observer', 'unenrolled'], 'text'=>'Report a Problem', 'subtext'=>'If Canvas misbehaves, tell us about it', 'url'=>'#create_ticket', 'type'=>'default', 'id'=>'report_a_problem', 'is_featured'=>false, 'is_new'=>false, 'feature_headline'=>''}", null: true

      end
    end
  end
end