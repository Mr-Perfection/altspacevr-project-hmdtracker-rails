require 'test_helper'

class HmdTest < ActiveSupport::TestCase

  def setup
    @hmd = Hmd.new(name: "Rift DK1", company: "Oculus VR", state: "released",
           announced_at: DateTime.new(2012, 8, 1),
           image_url: "http://i.imgur.com/EY3KHSz.jpg" )
    #@failed_hmd = hmd_infos(:failed_one)
  end

  test "new hmd_state should be valid" do
    assert @hmd.valid?
  end
  # test "new hmd_state should not be valid" do
  #   assert_not @hmd.valid?
  # end
end
