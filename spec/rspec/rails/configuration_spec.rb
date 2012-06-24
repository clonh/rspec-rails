require "spec_helper"

describe "configuration" do
  before do
    @orig_render_views = RSpec.configuration.render_views?
  end

  after do
    RSpec.configuration.render_views = @orig_render_views
  end

  describe "#render_views?" do
    it "is false by default" do
      RSpec.configuration.render_views?.should be_false
    end
  end

  describe "#render_views" do
    it "sets render_views? to return true" do
      RSpec.configuration.render_views = false
      RSpec.configuration.render_views

      RSpec.configuration.render_views?.should be_true
    end
  end

  describe "#application" do
    it "returns Rails.application by default" do
      RSpec.configuration.application.should eq(::Rails.application)
    end
  end

  describe '#application=' do
    context 'for Rails 3.0', :not_at_least_rails_3_1 do
      it 'raises an error' do
        expect { RSpec.configuration.application = ::Rails.application }.to raise_error
      end
    end
  end
end
