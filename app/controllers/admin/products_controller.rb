class Admin::ProductsController < Admin::BaseController
  before_action :set_product, only: [:edit, :update, :destroy]
  before_action :find_root_categories, only: [:new, :create, :edit, :update]

  def index
    @products = Product.page(params[:page] || 1).per_page(params[:per_page] || 10).order(id: "DESC")
  end

  def new
    @product = Product.new
  end

  def edit
    render :new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      flash[:notice] = "创建成功。"
      redirect_to admin_products_path
    else
      render :new
    end
  end

  def update
    if @product.update(product_params)
      flash[:notice] = "修改成功。"
      redirect_to admin_products_path
    else
      render :new
    end
  end

  def destroy
    if @product.destroy
      flash[:notice] = "删除成功。"
      redirect_to admin_products_path
    else
      flash[:notice] = "删除失败。"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit!
    end

    def find_root_categories
      @root_categories = Category.roots.order(id: "DESC")
    end
end
