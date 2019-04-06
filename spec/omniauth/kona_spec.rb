require 'spec_helper'

describe OmniAuth::Strategies::Kona do
  subject(:kona) do
    OmniAuth::Strategies::Kona.new(nil, @options || {})
  end

  context 'client options' do
    BASE_DOMAIN = "io.kona.com"
    it 'has correct Kona site' do
      expect(kona.options.client_options.site).to  eq "https://#{BASE_DOMAIN}"
    end

    it 'has correct authorization path' do
      expect(kona.options.client_options.authorize_url).to  eq "https://#{BASE_DOMAIN}/oauth/authorize"
    end

    it 'has correct token path' do
      expect(kona.options.client_options.token_url).to  eq "https://#{BASE_DOMAIN}/oauth/token"
    end
  end

  context '#uid' do
    before do
      allow(kona).to receive(:raw_info).and_return('id' => '123')
    end

    it 'returns the id from raw_info' do
      expect(kona.uid).to eq '123'
    end

  end

  context '#credentials' do
    before do
      allow(kona).to receive(:raw_info).and_return('id' => '123')
    end

    it 'returns the id from raw_info' do
      expect(kona.uid).to eq '123'
    end

  end

  context 'returns info hash conformant with omniauth auth hash schema' do
    before do
      allow(kona).to receive(:raw_info).and_return({})
    end

    context 'and therefore has all the necessary fields' do
      it {expect(kona.info).to have_key 'name'}
      it {expect(kona.info).to have_key 'email'}
      it {expect(kona.info).to have_key 'image'}
    end
  end

end
