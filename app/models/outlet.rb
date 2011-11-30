class Outlet < ActiveRecord::Base
	has_many :logs
	accepts_nested_attributes_for :logs, :allow_destroy => true
end
