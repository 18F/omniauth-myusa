require 'spec_helper'

describe OmniAuth::Strategies::Mygov do
  subject do
    OmniAuth::Strategies::Mygov.new({})
  end

  context "client options" do
    it 'should have correct name' do
      subject.options.name.should eq("mygov")
    end

    it 'should have correct site' do
      subject.options.client_options.site.should eq('https://my.usa.gov')
    end

    it 'should have correct token url' do
      subject.options.client_options.token_url.should eq('/oauth/authorize')
    end
  end
end
