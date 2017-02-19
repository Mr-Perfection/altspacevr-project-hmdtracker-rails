require 'test_helper'

class HmdStateTest < ActiveSupport::TestCase

  def setup
    @hmd_state = HmdState.new(hmd_id: 1, state: :announced)
    #@failed_hmd = hmd_infos(:failed_one)
  end

  test "new hmd_state should be valid" do
    assert @hmd_state.valid?
  end

  test "new hmd_state should not be valid" do
    @hmd_state = HmdState.new(hmd_id: 1, state: 'af')
    assert_not @hmd_state.valid?
  end


end
