class HmdState < ActiveRecord::Base
  # state belongs to hmd and update the updated_at when there exists update.
  belongs_to :hmd, touch: true

  # validaitons



  # TODO: Make this work!
  # include AuditedState
  #
  # is_audited_state_for :hmd
end
