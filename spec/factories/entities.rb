# == Schema Information
#
# Table name: entities
#
#  id         :integer          not null, primary key
#  type       :string
#  salience   :float
#  name       :string
#  text_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_entities_on_text_id  (text_id)
#

FactoryGirl.define do
  factory :entity do
    type ""
    salience 1.5
    name "MyString"
    text nil
  end
end
