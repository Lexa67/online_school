class Admin::LessonsController < Admin::BaseController
  before_action :set_course
  before_action :set_lesson, only: [:edit, :update, :destroy]

  def index
    @lessons = @course.lessons.order(id: :asc).page(params[:page]).per(5)
  end

  def new
    add_breadcrumb "Новое занятие", [:new, :admin, @course, :lesson]

    @lesson = @course.lessons.build
    #build_sections
  end

  def create
    @lesson = @course.lessons.build(lesson_params)

    if @lesson.save
      redirect_to [:admin, @course, :lessons], notice: 'Занятие успешно создано'
    else
      add_breadcrumb "Новое занятие", [:new, :admin, @course, :lesson]
      build_sections

      flash.now[:alert] = 'Не удалось создать Занятие'
      render :new
    end
  end

  def edit
    #build_sections

    add_breadcrumb "Редактировать #{@lesson.name}", [:edit, :admin, @course, @lesson]
  end

  def update
    if @lesson.update(lesson_params)
      redirect_to [:admin, @course, :lessons], notice: 'Занятие успешно изменено'
    else
      add_breadcrumb "Редактировать #{@lesson.name}", [:edit, :admin, @course, @lesson]
      build_sections

      flash.now[:alert] = 'Не удалось изменить Занятие'
      render :edit
    end
  end

  def destroy
    if @lesson.destroy
      redirect_to [:admin, @course, :lessons], notice: 'Занятие успешно удалено'
    else
      redirect_to [:admin, @course, :lessons], alert: "Не удалось удалить занятие, #{@lesson.errors.full_messages.join(', ')}"
    end
  end

  private

  def set_course
    @course = Course.find(params[:course_id])
    add_breadcrumb 'Курсы', :admin_courses_path
    add_breadcrumb @course.name, [:admin, @course, :lessons]

  end
  
  def set_lesson
    @lesson = Lesson.find(params[:id])
  end

  def set_active_main_menu_item
    @main_menu[:courses][:active] = true
  end

  #def build_sections
   # @course.sections.build if @course.sections.empty?
  #end

  def lesson_params
    params.require(:lesson).permit(:name, :description)
  end
end