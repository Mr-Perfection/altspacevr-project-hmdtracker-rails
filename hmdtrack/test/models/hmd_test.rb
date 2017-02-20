require 'test_helper'

class HmdTest < ActiveSupport::TestCase

  def setup
    @hmd = hmds(:one)
    @hmd_state = @hmd.hmd_states.build(state: :released)
    #@failed_hmd = hmd_infos(:failed_one)
  end

  test "hmd should be valid" do
    hmd = Hmd.new(name: "Rift DK1", company: "Oculus VR", state: :released,
           announced_at: DateTime.new(2012, 8, 1),
           image_url: "http://i.imgur.com/EY3KHSz.jpg" )
    assert hmd.valid?
  end

  test "hmd should not be valid" do
    hmd = Hmd.new(name: "Rift DK1", company: "Oculus VR", state: "as",
           announced_at: DateTime.new(2012, 8, 1),
           image_url: "http://i.imgur.com/EY3KHSz.jpg" )
    assert_not hmd.valid?
  end

  test "image_url should be present" do
    hmd = Hmd.new(name: "Rift DK1", company: "Oculus VR", state: "as",
           announced_at: DateTime.new(2012, 8, 1),
           image_url: "http" )
    assert_not hmd.valid?
  end

  test "company should be present" do
    hmd = Hmd.new(name: "Rift DK1", company: nil, state: "as",
           announced_at: DateTime.new(2012, 8, 1),
           image_url: "http" )
    assert_not hmd.valid?
  end

  test "name should be present" do
    hmd = Hmd.new(name:  nil, company: "Oculus VR", state: "as",
           announced_at: DateTime.new(2012, 8, 1),
           image_url: "http://i.imgur.com/EY3KHSz.jpg" )
    assert_not hmd.valid?
  end

  test "announced_at should be present" do
    hmd = Hmd.new(name:  "Rift", company: "Oculus VR", state: "as",
           announced_at: nil,
           image_url: "http://i.imgur.com/EY3KHSz.jpg" )
    assert_not hmd.valid?
  end

  test "hmd states should be valid" do
    assert @hmd_state.valid?
  end

  test "hmd states should have hmd id" do
    @hmd_state.hmd_id = nil
    assert_not @hmd_state.valid?
  end
  #
  # test "state should not be nil" do
  #   @hmd = Hmd.first
  #   assert_not @hmd.update(state: nil)
  # end
end
