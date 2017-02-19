class Hmd < ActiveRecord::Base

  # Hmd has one state from [:announced, :devkit, :released]
  has_many :hmd_states, dependent: :destroy
  before_save :save_state

  # create a default hmd_state after create
  after_create :create_hmd_state

  # def save
  #   self.hmd_state.save!
  # end
  private
    def create_hmd_state
      puts "olahhhh! Create"
      self.hmd_states.build(state: self.state)
    end
    def save_state
      puts "olahhhh! Save"
      self.hmd_states.build(state: self.state)
      puts self.hmd_states.all
    end
  # TODO: Make this work!
  # include AuditedState
  #
  # has_audited_state_through :hmd_states, [:announced, :devkit, :released]

end
