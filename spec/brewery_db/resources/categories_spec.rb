# encoding: UTF-8

require 'spec_helper'

describe BreweryDB::Resources::Categories, :resource do
  context '#all', :vcr do
    let(:response) { described_class.new(config).all }

    it 'fetches all of the cagtegories at once' do
      expect(response.length).to eq(12)
    end
  end

  context '#find', :vcr do
    let(:response) { described_class.new(config).find(1) }

    it 'fetches only the category asked for' do
      expect(response.id).to eq(1)
    end
  end
end
