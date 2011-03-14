require "spec_helper"
require "mcutter/cli"

describe MCutter::CLI do
  it { described_class.superclass.should eql Thor }
end
