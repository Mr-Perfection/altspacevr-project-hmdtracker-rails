class Hmd < ActiveRecord::Base

  # Hmd has one state from [:announced, :devkit, :released]
  has_many :hmd_states, dependent: :destroy

  # symbolize the state before save
  before_save :save_state_to_hmd_state
  # create a default hmd_state after create
  before_create :symbolize_state
  after_create :create_hmd_state

  #validations
  validates :name, presence: true
  validates_inclusion_of :state, in: [:announced,:devkit,:released,'announced','devkit','released'] # handle both string and symbols
  validates :company, presence: true
  validates :image_url, presence: true
  # def save
  #   self.hmd_state.save!
  # end
  private
    def symbolize_state
      self.state = self.state.parameterize.underscore.to_sym
    end
    def create_hmd_state
      self.hmd_states.build(state: self.state)
    end
    def save_state_to_hmd_state
      self.state = self.state.parameterize.underscore.to_sym
      self.hmd_states.build(state: self.state)
    end

  # TODO: Make this work!
  # include AuditedState
  #
  # has_audited_state_through :hmd_states, [:announced, :devkit, :released]

end
