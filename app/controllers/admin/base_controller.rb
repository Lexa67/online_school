class Admin::BaseController < ApplicationController
  layout 'admin'

  before_action :authenticate_admin_a!
  before_action :set_main_menu, except: :destroy
  before_action :set_active_main_menu_item, except: :destroy

  private

  def set_main_menu
    @main_menu = { teachers: { name: 'Преподаватели', path: admin_teachers_path },
                   disciplines: { name: 'Дисциплины', path: admin_disciplines_path },
                   courses: { name: 'Курсы', path: admin_courses_path },
                   admin_as: { name: 'Админы', path: admin_admin_as_path} }
  end
end
