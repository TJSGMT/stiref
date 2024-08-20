# frozen_string_literal: true

class UserReflex < ApplicationReflex
 
  def user_search(query = "")
    binding.pry
    searched_users = User.search(query)
    @users = nil unless searched_users.present?
    @users = searched_users if searched_users.present?
  end

end
