module Admin
  class VacationPolicy
    attr_reader :current_user_p, :vacation

    def initialize(current_user_p = current_user, vacation)
      @current_user_p = current_user_p
      @vacation = vacation
    end

    def index?
      current_user_p.admin?
    end

    def show?
      current_user_p.admin?
    end

    def update?
      current_user_p.admin?
    end

    def new?
      current_user_p.admin?
    end

    def create?
      current_user_p.admin?
    end

    def request_show?
      current_user_p.admin?
    end

    def requests?
      current_user_p.admin?
    end

    def show_vacation?
      current_user_p.admin?
    end

    def destroy?
      current_user_p.admin?
    end
  end
end
