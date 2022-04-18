class Admin::ProductVariantsController < AdminController
  before_action :authorize_admin

  def new
    @product = Product.find(params[:product_id])
    @product_variant = ProductVariant.new(product_id: @product.id)
  end

  def create
    ActiveRecord::Base.transaction do
      @product_variant = ProductVariant.new(set_product_variant_params.merge!(product_id: params[:product_id]))
      params[:variant_values].each do |po_id, value|
        @product_variant.variant_values << VariantValue.new(name: value, product_option_id: po_id)
      end
      @product_variant.save!
    rescue StandardError => e
      render_turbo_flashes(:alert, e.message)
      raise ActiveRecord::Rollback
    end
  end

  private

  def authorize_admin
    authorize %i[admin ProductVariant]
  end

  def set_product_variant_params
    params.require(:product_variant).permit(:name, :price, :weight, :height, :width, :depth, :sku, :is_main)
  end
end