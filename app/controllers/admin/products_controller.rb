class Admin::ProductsController < AdminController
  before_action :authorize_admin

  def index; end

  def load_index
    @products = if params[:search_index].blank?
                  Product.order(:name).includes(:product_variants)
                else
                  Product.order(:name).search_by_name(params[:search_index]).includes(:product_variants)
                end
    render partial: 'admin/products/partials/load_index'
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
    @product.product_options.build
  end

  def create
    @product = Product.new(set_product_params)
    if @product.save
      redirect_to products_path
    else
      render_turbo_flashes(:alert, "#{@product.errors.messages.keys.first} #{@product.errors.messages.values.first.first}")
    end
  end

  private

  def authorize_admin
    authorize %i[admin Product]
  end

  def set_product_params
    params.require(:product).permit(:name, :tax_ids, product_options_attributes: %i[name product_id _destroy])
  end
end
