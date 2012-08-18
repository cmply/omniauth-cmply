require 'spec_helper'

describe OmniAuth::Strategies::Cmply do
  subject do
    OmniAuth::Strategies::Cmply.new({})
  end

  context "client options" do
    it 'should have correct name' do
      subject.options.name.should eq("cmply")
    end

    it 'should have correct site' do
      subject.options.client_options.site.should eq('http://api.cmp.ly')
    end

    it 'should have correct authorize url' do
      subject.options.client_options.authorize_path.should eq('/oauth/authorize')
    end
  end
end
