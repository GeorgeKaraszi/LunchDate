require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :name => "Name",
      :twitter => "Twitter",
      :facebook => "Facebook",
      :linkedin => "Linkedin"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Twitter/)
    expect(rendered).to match(/Facebook/)
    expect(rendered).to match(/Linkedin/)
  end
end
