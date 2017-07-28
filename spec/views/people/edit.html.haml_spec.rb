require 'rails_helper'

RSpec.describe "people/edit", type: :view do
  before(:each) do
    @person = assign(:person, Person.create!(
      :name => "MyString",
      :score => 1.5,
      :magnitude => 1.5
    ))
  end

  it "renders the edit person form" do
    render

    assert_select "form[action=?][method=?]", person_path(@person), "post" do

      assert_select "input[name=?]", "person[name]"

      assert_select "input[name=?]", "person[score]"

      assert_select "input[name=?]", "person[magnitude]"
    end
  end
end
