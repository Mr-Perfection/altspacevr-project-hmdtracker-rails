module AuditedState
  extend ActiveSupport::Concern

  class_methods do

    # helper method for hmd model
    # has_audited_state_through :hmd_states, [:announced, :devkit, :released]
    def has_audited_state_through(models, states, options = {})

      # create a attribute accessor for current state
      attr_accessor :current_state
      # create a class attribute for allowed states
      class_attribute :allowed_states
      self.allowed_states = states
      # Hmd has many states from [:announced, :devkit, :released]
      has_many models, dependent: :destroy


      # invokes the method include and add AuditedStateClassInstanceMethods
      send :include, AuditedStateClassInstanceMethods

      # validations & double checks
      # make sure that these attributes are present
      validates :name, presence: true
      validates :company, presence: true
      validates :image_url, presence: true
      validates :announced_at, presence: true
      validates :current_state, presence: true
      # validates_inclusion_of :current_state, in: states
      validate :current_state_with_exception
    end


    # helper method for hmd_state model
    # use :touch to update the :updated_at attribute
    def is_audited_state_for(model, options = {})

      belongs_to model, touch: true

      # validations & double checks
      # make sure that these attributes are present
      validates :hmd_id, presence: true
      validates :state, presence: true
    end
  end

  # this module contains methods for the hmd model's state attribute
  # need to symbolize the this.state attribute for getter method
  module AuditedStateClassInstanceMethods
    # Getter: return symbol for self.state attribute
    def state
      self.hmd_states.last.state.to_sym
    end
    # Setter: build the hmd_state
    # Also, update the current_state to new_state
    def state=(new_state)
      self.hmd_states.build(state: new_state)
      self.current_state = new_state.to_sym
    end

    def current_state_with_exception
      allowed_states = self.class.allowed_states
      unless allowed_states.include?(self.current_state)
        raise RuntimeError.new('State is either invalid or not allowed. Pick one from ' + allowed_states.join(','))
      end
    end
  end

end
