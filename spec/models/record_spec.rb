# == Schema Information
#
# Table name: records
#
#  id         :integer          not null, primary key
#  username   :string
#  project_id :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Record, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
