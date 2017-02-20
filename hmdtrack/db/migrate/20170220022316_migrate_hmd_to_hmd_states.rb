class MigrateHmdToHmdStates < ActiveRecord::Migration
  def up
    
    # Add states to the existing Hmds
    Hmd.all.each do |hmd|
      # create a first hmd_state for existing hmds default to :announced
      hmd_state = hmd.hmd_states.build(state: hmd.state || :announced)
      hmd_state.save!
    end
    # remove the existing column :state
    remove_column :hmds, :state
  end

  def down
    add_column :hmds, :state, :string, limit: 64, null: false, default: :announced
  end
end
