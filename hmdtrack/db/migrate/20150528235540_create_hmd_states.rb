class CreateHmdStates < ActiveRecord::Migration
  def change
    create_table :hmd_states do |t|
      t.integer :hmd_id, null: false, indexed: true
      t.string :state, limit: 64, null: false, default: 'announced'

      t.timestamps null: false
    end
  end
end
