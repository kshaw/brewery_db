# encoding: UTF-8

require 'spec_helper'

describe BreweryDB::Resources::Styles do
  let(:client) { BreweryDB::Client.new }

  before do
    client.configure do |config|
      config.api_key = 'A1029384756B'
      config.endpoint = 'http://api.playground.brewerydb.com'
    end
  end

  around do |example|
    VCR.use_cassette('styles', record: :new_episodes) { example.call }
  end

  context '#all' do
    let(:response) { described_class.new(client).all }

    subject { response }

    its(:current_page) { should be_nil }
    its(:number_of_pages) { should be_nil }
    its(:status) { should == 'success' }
    its(:data) { should be_a(Array) }
    its(:data) { should have(98).results }

    context 'result' do
      subject { response.data.first }

      it { should have(17).keys }

      its(:id) { should == 1 }
      its(:name) { should == 'Lite American Lager' }
      its(:'category.id') { should == 1 }
      its(:'category.name') { should == 'Light Lager' }
      its(:'category.bjcp_category') { should == '1' }
      its(:'category.create_date') { should == '2012-04-04 04:00:04' }
      its(:category_id) { should == 1 }
      its(:bjcp_subcategory) { should == 'A' }
      its(:simple_url) { should == 'lite-american-lager' }
      its(:ibu_min) { should == '8' }
      its(:ibu_max) { should == '12' }
      its(:abv_min) { should == '2.8' }
      its(:abv_max) { should == '4.2' }
      its(:srm_min) { should == '2' }
      its(:srm_max) { should == '3' }
      its(:og_min) { should == '1.028' }
      its(:og_max) { should == '1.04' }
      its(:fg_min) { should == '0.998' }
      its(:fg_max) { should == '1.008' }
      its(:create_date) { should == '2012-04-04 04:00:04' }
      its(:update_date) { should be_nil }
    end
  end

  context '#find' do
    let(:response) { described_class.new(client).find(1) }

    subject { response }

    its(:status) { should == 'success' }

    context 'data' do
      subject { response.data }

      it { should have(17).keys }

      its(:id) { should == 1 }
      its(:name) { should == 'Lite American Lager' }
      its(:'category.id') { should == 1 }
      its(:'category.name') { should == 'Light Lager' }
      its(:'category.bjcp_category') { should == '1' }
      its(:'category.create_date') { should == '2012-04-04 04:00:04' }
      its(:category_id) { should == 1 }
      its(:bjcp_subcategory) { should == 'A' }
      its(:simple_url) { should == 'lite-american-lager' }
      its(:ibu_min) { should == '8' }
      its(:ibu_max) { should == '12' }
      its(:abv_min) { should == '2.8' }
      its(:abv_max) { should == '4.2' }
      its(:srm_min) { should == '2' }
      its(:srm_max) { should == '3' }
      its(:og_min) { should == '1.028' }
      its(:og_max) { should == '1.04' }
      its(:fg_min) { should == '0.998' }
      its(:fg_max) { should == '1.008' }
      its(:create_date) { should == '2012-04-04 04:00:04' }
      its(:update_date) { should be_nil }
    end
  end
end