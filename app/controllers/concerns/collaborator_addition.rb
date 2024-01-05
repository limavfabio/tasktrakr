module CollaboratorAddition
  extend ActiveSupport::Concern

  def check_collaborator_by_email(email)
    user = User.find_by(email: email.downcase)

    if user.nil?
      flash[:alert] = 'User with the entered email not found.'
      false
    elsif user.email == current_user.email
      flash[:alert] = 'Can not add yourself as a collaborator.'
      false
    elsif @project.users.exists?(user.id)
      flash[:alert] = 'This user is already a collaborator.'
      false
    else
      flash[:notice] = "#{email} has been added as a collaborator."
      true
    end
  end
end
