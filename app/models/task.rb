# == Schema Information
#
# Table name: tasks
#
#  id          :integer          not null, primary key
#  fio         :string
#  email       :string
#  phone       :string
#  link        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  status      :string
#  report_id   :integer
#  customer_id :integer
#

class Task < ActiveRecord::Base
  belongs_to :report

  belongs_to :customer

  state_machine :status, initial: :free do
    event :used  do
      transition free: :used
    end
  end
end
