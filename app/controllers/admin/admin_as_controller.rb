class Admin::AdminAsController < Admin::BaseController
  add_breadcrumb 'Админы', :admin_admin_as_path

  before_action :set_admin_a, only: [:edit, :update, :destroy]

  def index
    @admin_as = AdminA.order(id: :desc).page(params[:page])
  end

  def new
    add_breadcrumb "Новый Админ", new_admin_admin_a_path

    @admin_a = AdminA.new
  end

  def create
    @admin_a = AdminA.new(admin_a_params)

    if @admin_a.save
      redirect_to admin_admin_as_path, notice: 'Админ успешно создан'
    else
      add_breadcrumb "Новый Админ", new_admin_admin_a_path

      flash.now[:alert] = 'Не удалось создать Админа'
      render :new
    end
  end

  def edit
    add_breadcrumb "Редактировать #{@admin_a.first_name} #{@admin_a.last_name}", [:edit, :admin, @admin_a]
  end

  def update
    if @admin_a.update(admin_a_params)
      redirect_to admin_admin_as_path, notice: 'Админ успешно изменен'
    else
      add_breadcrumb "Редактировать #{@admin_a.first_name} #{@admin_a.last_name}", [:edit, :admin, @admin_a]
      flash.now[:alert] = 'Не удалось изменить Админа', [:admin, @admin_a]
      render :edit
    end
  end

  def destroy
    if @admin_a.destroy
      redirect_to admin_admin_as_path, notice: 'Админ успешно удален'
    else
      redirect_to admin_admin_as_path, alert: 'Не удалось удалить Админа'
    end
  end

  private

  def set_admin_a
    @admin_a = AdminA.find(params[:id])
  end

  def set_active_main_menu_item
    @main_menu[:admin_as][:active] = true
  end

  def admin_a_params
    params.require(:admin_a).permit(:email, :first_name, :last_name, :password, :password_confirmation)
  end
end