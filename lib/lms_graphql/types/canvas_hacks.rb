require_relative "canvas_base_type"
require_relative "canvas_base_input_type"

# The generate User class depends on Enrollment and Enrollment depends on User
# so we have a circular dependency. We use a forward declaration here to overcome the problem.
module LMSGraphQL
  module Types
    module Canvas
      # HACK. UpdateStudentQuestionScoresAndComment requires CanvasHashInput which is not currently defined
      # If we want to use that endpoint we'll have to manually defined the object here.
      class CanvasHashInput < BaseInputObject
        argument :id, ID, "The ID", required: true
      end
    end
  end
end
