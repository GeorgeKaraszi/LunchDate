require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :name => "Name",
        :twitter => "Twitter",
        :facebook => "Facebook",
        :linkedin => "Linkedin"
      ),
      User.create!(
        :name => "Name",
        :twitter => "Twitter",
        :facebook => "Facebook",
        :linkedin => "Linkedin"
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Twitter".to_s, :count => 2
    assert_select "tr>td", :text => "Facebook".to_s, :count => 2
    assert_select "tr>td", :text => "Linkedin".to_s, :count => 2
  end
end
