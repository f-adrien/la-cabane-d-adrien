class Admin::ProductsController < AdminController
  before_action :authorize_admin
  before_action :define_product, only: %i[show edit update]

  def index; end

  def load_index
    @products = if params[:search_index].blank?
                  Product.order(:name).includes(:product_variants)
                else
                  Product.order(:name).search_by_name(params[:search_index]).includes(:product_variants)
                end
    render partial: 'admin/products/partials/load_index'
  end

  def show; end

  def new
    @product = Product.new
    @product.product_options.build
  end

  def create
    @product = Product.new(set_product_params)
    if @product.save
      redirect_to product_path(@product), notice: 'Le produit à été correctement créé'
    else
      render_turbo_flashes(:alert, "#{@product.errors.messages.keys.first} #{@product.errors.messages.values.first.first}")
    end
  end

  def edit; end

  def update
    if @product.update(set_product_params)
      flash.now.notice = "Le produit à été correctement édité"
    else
      render_turbo_flashes(:alert, "#{@product.errors.messages.keys.first} #{@product.errors.messages.values.first.first}")
    end
  end

  def edit_product_tax
    @product_tax = ProductTax.find(params[:id])
  end

  def update_product_tax
    @product_tax = ProductTax.find(params[:id])
    if @product_tax.update(set_product_tax_params)
      flash.now.notice = "La taxe pour ce produit a été correctement mise à jour"
    else
      render_turbo_flashes(:alert, "#{@product_tax.errors.messages.keys.first} #{@product_tax.errors.messages.values.first.first}")
    end
  end

  private

  def authorize_admin
    authorize %i[admin Product]
  end

  def define_product
    @product = Product.find(params[:id])
  end

  def set_product_params
    params.require(:product).permit(:name, :tax_ids, product_options_attributes: %i[name product_id _destroy])
  end

  def set_product_tax_params
    params.require(:product_tax).permit(:product_id, :tax_id)
  end
end
