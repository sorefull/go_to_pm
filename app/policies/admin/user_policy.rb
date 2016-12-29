class Admin::UserPolicy
  attr_reader :current_user_p, :user

  def initialize(current_user_p = current_user, user)
    @current_user_p = current_user_p
    @user = user
  end

  def index?
    show?
  end

  def show?
    current_user_p.admin?
  end

  def edit?
    update?
  end

  def update?
    current_user_p.admin? && (current_user_p != user[1])
  end

  def new?
    create?
  end

  def create?
    current_user_p.admin?
  end

  def show_vacation?
    current_user_p.admin?
  end

  def destroy?
    current_user_p.admin? && (current_user_p != user[1])
  end
end
