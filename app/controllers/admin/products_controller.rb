class Admin::ProductsController < AdminController
  before_action :authorize_admin

  def index; end

  def load_index
    @products = Product.all
  end

  def new
    @product = Product.new
    @product.product_options.build
  end

  def create
    p params
    @product = Product.new(set_product_params)
    @product.save!
    raise
  end

  private

  def authorize_admin
    authorize %i[admin Product]
  end

  def set_product_params
    params.require(:product).permit(:name, product_options_attributes: %i[product_id option_id _destroy])
  end
end
