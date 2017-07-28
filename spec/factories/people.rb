# == Schema Information
#
# Table name: people
#
#  id         :integer          not null, primary key
#  name       :string
#  score      :float
#  magnitude  :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :person do
    name "MyString"
    score 1.5
    magnitude 1.5
  end
end
