# == Schema Information
#
# Table name: sources
#
#  id         :integer          not null, primary key
#  provider   :string
#  token      :string
#  secret     :string
#  person_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_sources_on_person_id  (person_id)
#

FactoryGirl.define do
  factory :source do
    provider "MyString"
    token "MyString"
    secret "MyString"
    person nil
  end
end
