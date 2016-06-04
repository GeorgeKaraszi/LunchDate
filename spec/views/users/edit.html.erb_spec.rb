require 'rails_helper'

RSpec.describe "users/edit", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :name => "MyString",
      :twitter => "MyString",
      :facebook => "MyString",
      :linkedin => "MyString"
    ))
  end

  it "renders the edit user form" do
    render

    assert_select "form[action=?][method=?]", user_path(@user), "post" do

      assert_select "input#user_name[name=?]", "user[name]"

      assert_select "input#user_twitter[name=?]", "user[twitter]"

      assert_select "input#user_facebook[name=?]", "user[facebook]"

      assert_select "input#user_linkedin[name=?]", "user[linkedin]"
    end
  end
end
