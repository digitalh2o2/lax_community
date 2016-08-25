class UserPolicy < ApplicationPolicy

	def index?
		is_admin_or_user?
	end

	def show?
		is_admin_or_user?
	end

end