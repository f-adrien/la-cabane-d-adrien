class Admin::ProductVariantsController < AdminController
  before_action :authorize_admin

  def new
    @product = Product.find(params[:product_id])
    @product_variant = ProductVariant.new(product_id: @product.id)
  end

  private

  def authorize_admin
    authorize %i[admin ProductVariant]
  end

  # def set_product_option_params
  #   params.require(:product_option).permit(:name, :product_id)
  # end
end