require "spec_helper"
require "mcutter/core_ext/misc"

describe "misc" do

  specify { "00:23:34.34".respond_to?(:to_sec).should be }
  specify { 0.9.respond_to?(:to_hh_mm_ss).should be }
  specify { "00:01:34" .to_sec.should eql 94.0 }

end
