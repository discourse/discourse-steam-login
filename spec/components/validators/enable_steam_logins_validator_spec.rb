# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EnableSteamLoginsValidator do
  subject { described_class.new }

  describe '#valid_value?' do
    describe 'when steam_web_api_key has not been set' do
      it "should return true when value is false" do
        expect(subject.valid_value?('f')).to eq(true)
      end

      it "should return false when value is true" do
        expect(subject.valid_value?('t')).to eq(false)

        expect(subject.error_message).to eq(I18n.t(
          'site_settings.errors.steam_web_api_key_is_empty'
        ))
      end
    end

    describe 'when steam_web_api_key has been set' do
      before do
        SiteSetting.steam_web_api_key = "somekey"
      end

      it "should return true when value is false" do
        expect(subject.valid_value?('f')).to eq(true)
      end

      it 'should return true when value is true' do
        expect(subject.valid_value?('t')).to eq(true)
      end
    end
  end
end
