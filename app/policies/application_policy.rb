# frozen_string_literal: true

class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user # current_user
    @record = record # instância a ser autorizada
  end

  def index?
    false # ninguém pode ver
  end

  def show?
    false # ninguém pode ver
  end

  def create?
    false # ninguém pode ver
  end

  def new?
    create? # só pode mostrar o formulário se o usuário puder criar
  end

  def update?
    false # ninguém pode ver
  end

  def edit?
    update? # só pode mostrar o formulário se o usuário puder editar
  end

  def destroy?
    false # ninguém pode ver
  end

  class Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      raise NotImplementedError, "You must define #resolve in #{self.class}"
    end

    private

    attr_reader :user, :scope
  end
end
