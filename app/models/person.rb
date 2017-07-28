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

class Person < ApplicationRecord
end
