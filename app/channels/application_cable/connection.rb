module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
      logger.add_tags current_user.name
    end

    private

    def find_verified_user
      pp cookies[:current_user_id]
      if verified_user = User.find_by(id: cookies[:current_user_id])
        verified_user
      else
        reject_unauthorized_connection
      end
    end
  end
end
