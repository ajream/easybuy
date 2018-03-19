class Admin::CategoriesController < Admin::BaseController
  def index
    @categories = Category.roots.page(params[:page] || 1).per_page(params[:per_page] || 10).order(id: "DESC")
  end

  def new
    @category = Category.new
    @root_categories = Category.roots.order(id: "DESC")
  end

  def create
    @category = Category.new(category_params)
    @root_categories = Category.roots.order(id: "DESC")

    if @category.save
      flash[:notice] = "保存成功。"
      redirect_to admin_categories_path
    else
      render action: :new
    end
  end

  def edit
    
  end

  def updaet
    
  end

  private
  # def find_category
  #   @category = 
  # end

  def category_params
    params.require(:category).permit!
  end
end
