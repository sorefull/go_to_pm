module Admin
  class InvitationPolicy
    attr_reader :current_user_p, :invitation

    def initialize(current_user_p = current_user, invitation)
      @current_user_p = current_user_p
      @invitation = invitation
    end

    def index?
      current_user_p.admin?
    end

    def new?
      create?
    end

    def create?
      current_user_p.admin?
    end

    def destroy?
      current_user_p.admin?
    end
  end
end
