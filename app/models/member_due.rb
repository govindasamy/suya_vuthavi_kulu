class MemberDue < ActiveRecord::Base
  belongs_to :location
  belongs_to :member
end