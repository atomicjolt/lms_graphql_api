require_relative "../canvas_base_input_type"
require_relative "enrollment"

module LMSGraphQL
  module Types
    module Canvas
      class CanvasUserInput < BaseInputObject
        description "Users. API Docs: https://canvas.instructure.com/doc/api/users.html"
      	argument :id, ID, "The ID of the user..Example: 2", required: false
      	argument :name, String, "The name of the user..Example: Sheldon Cooper", required: false
      	argument :sortable_name, String, "The name of the user that is should be used for sorting groups of users, such as in the gradebook..Example: Cooper, Sheldon", required: false
      	argument :short_name, String, "A short name the user has selected, for use in conversations or other less formal places through the site..Example: Shelly", required: false
      	argument :sis_user_id, ID, "The SIS ID associated with the user.  This field is only included if the user came from a SIS import and has permissions to view SIS information..Example: SHEL93921", required: false
      	argument :sis_import_id, ID, "The id of the SIS import.  This field is only included if the user came from a SIS import and has permissions to manage SIS information..Example: 18", required: false
      	argument :integration_id, ID, "The integration_id associated with the user.  This field is only included if the user came from a SIS import and has permissions to view SIS information..Example: ABC59802", required: false
      	argument :login_id, ID, "The unique login id for the user.  This is what the user uses to log in to Canvas..Example: sheldon@caltech.example.com", required: false
      	argument :avatar_url, String, "If avatars are enabled, this field will be included and contain a url to retrieve the user's avatar..Example: https://en.gravatar.com/avatar/d8cb8c8cd40ddf0cd05241443a591868?s=80&r=g", required: false
      	argument :enrollments, [LMSGraphQL::Types::Canvas::CanvasEnrollmentInput], "Optional: This field can be requested with certain API calls, and will return a list of the users active enrollments. See the List enrollments API for more details about the format of these records..", required: false
      	argument :email, String, "Optional: This field can be requested with certain API calls, and will return the users primary email address..Example: sheldon@caltech.example.com", required: false
      	argument :locale, String, "Optional: This field can be requested with certain API calls, and will return the users locale in RFC 5646 format..Example: tlh", required: false
      	argument :last_login, String, "Optional: This field is only returned in certain API calls, and will return a timestamp representing the last time the user logged in to canvas..Example: 2012-05-30T17:45:25Z", required: false
      	argument :time_zone, String, "Optional: This field is only returned in certain API calls, and will return the IANA time zone name of the user's preferred timezone..Example: America/Denver", required: false
      	argument :bio, String, "Optional: The user's bio..Example: I like the Muppets.", required: false

      end
    end
  end
end