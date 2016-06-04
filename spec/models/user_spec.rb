require 'rails_helper'

RSpec.describe User, type: :model do
  describe '.select_two_users' do
    before do
      @user_lists = FactoryGirl.create_list(:user_list, 5)
    end

    let (:users) {User.select_two_users}

    it 'returns an array of size 2' do
      expect(users.is_a?(Array)).to be(true)
      expect(users.length).to eq(2)
    end

    it 'returns two unique users' do
      expected = User.select_two_users
      expect(users).to_not eq(expected)
    end

    after do
      @user_lists.each {|u| u.destroy}
    end

  end


  describe '.get_user_from_url' do
    let (:user) {FactoryGirl.create(:user_list)}
    subject {User.send(:get_user_from_url, user.twitter)}

    it {is_expected.to eq(user.name)}

    it 'returns nil if no username is found' do
      url = 'http://twitter.com'
      response = User.send(:get_user_from_url, url)
      expect(response).to be_nil
    end
  end


  describe '.get_twitter_profile' do

    context 'twitter profile found' do
      let(:user) {FactoryGirl.create(:tom_hanks)}
      subject (:profile) {User.send(:get_twitter_profile, user)}

      it 'is set to contain name attribute' do
        expect(profile.name).to eq(user.name)
      end
      it 'is set to contain their screen name attribute' do
        expect(profile.screen_name).to eq('tomhanks')
      end
      it 'is set to contain location attribute' do
        expect(profile.location).to_not eq(nil)
      end
      it 'is set to contain a profile image attribute' do
        expect(profile.profile_image_url).to_not eq(nil)
      end
      it 'is set to contain their latest tweet' do
        expect(profile.status.text).to_not eq(nil)
      end
    end

    context 'twitter profile not found' do
      let (:user) {FactoryGirl.create(:user_list)}
      subject {User.send(:get_twitter_profile, user)}

      it {is_expected.to eq(:NotFound)}
    end
  end


  describe '.all_profiles' do
    before do
      @user = FactoryGirl.create(:tom_hanks)
    end

    let(:users) {User.all_profiles}
    it 'contains the twitter profile attribute' do
      expect(users[0].twitter_profile).to_not eq(nil)
    end

    after do
      @user.destroy
    end
  end

end
