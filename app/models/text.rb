# == Schema Information
#
# Table name: texts
#
#  id         :integer          not null, primary key
#  body       :text
#  score      :float
#  magnitude  :float
#  source_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_texts_on_source_id  (source_id)
#

class Text < ApplicationRecord
  belongs_to :source
end
