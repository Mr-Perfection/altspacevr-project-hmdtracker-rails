module AuditedState
  extend ActiveSupport::Concern

  class_methods do
    # helper method for hmd_state model
    # use :touch to update the :updated_at attribute
    def is_audited_state_for(model, options = {})
      belongs_to model, touch: true
    end
  end

end
