module TasksHelper
  def assigned_user(user)
    if user.present?
      user.full_name
    else
      t('form.not_assigned')
    end
  end
end
