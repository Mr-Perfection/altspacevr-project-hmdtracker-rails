class HmdState < ActiveRecord::Base
  include AuditedState
  # state belongs to hmd and update the updated_at when there exists update.
  is_audited_state_for :hmd

  # validaitons



  # TODO: Make this work!
  # include AuditedState
  #
  # is_audited_state_for :hmd
end
