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
      @product_variant.save
      @product = Product.find(params[:product_id])
      flash.now.notice = "Le variant #{@product_variant.name} a été correctement créé"
    rescue StandardError => e
      render_turbo_flashes(:alert, e.message)
      raise ActiveRecord::Rollback
    end
  end

  def edit
    @product = Product.find(params[:product_id])
    @product_variant = @product.product_variants.find(params[:id])
  end

  def update
    @product = Product.find(params[:product_id])
    @product_variant = @product.product_variants.find(params[:id])
    ActiveRecord::Base.transaction do
      @product_variant.update(set_product_variant_params)
      params[:variant_values].each do |po_id, value|
        existing_variant_value = @product_variant.variant_values.find_by(product_option_id: po_id)
        if existing_variant_value.blank?
          VariantValue.create(name: value, product_variant_id: @product_variant.id, product_option_id: po_id)
        else
          existing_variant_value.update(name: value)
        end
      end
      flash.now.notice = "Le variant #{@product_variant.name} a été correctement modifié"
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