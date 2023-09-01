class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      if user.admin
        # O admin pode ver todos os restaurantes
        scope.all # mesma coisa que Restaurant.all
      else
        # Os demais usuários só podem ver os restaurantes que eles criaram
        scope.where(user: user) # mesma coisa que Restaurant.where(user: current_user)
      end
    end
  end

  def show?
    true # todos podem ver
  end

  def create?
    true # todos podem criar
  end

  def update?
    owner?
  end

  def destroy?
    owner?
  end

  private

  def owner?
    # mesma coisa que @restaurant.user == current_user
    record.user == user || user.admin
  end
end
