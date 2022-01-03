class Admin::ProductOptionsController < AdminController
  before_action :authorize_admin

  def new
    @product = Product.find(params[:product_id])
    @product_option = ProductOption.new(product_id: @product.id)
  end

  def create
    @product_option = ProductOption.new(set_product_option_params)
    if @product_option.save
      @product = @product_option.product
      flash.now.notice = "L'option #{@product_option.name} a été correctment créée"
    else
      render_turbo_flashes(:alert, "#{@product_option.errors.messages.keys.first} #{@product_option.errors.messages.values.first.first}")
    end
  end

  def edit
    @product = Product.find(params[:product_id])
    @product_option = ProductOption.find(params[:id])
  end

  def update
    @product_option = ProductOption.find(params[:id])
    if @product_option.update(set_product_option_params)
      @product = @product_option.product
      flash.now.notice = "L'option  a été correctment renommée"
    else
      render_turbo_flashes(:alert, "#{@product_option.errors.messages.keys.first} #{@product_option.errors.messages.values.first.first}")
    end
  end

  def destroy
    @product_option = ProductOption.find(params[:id])
    if @product_option.destroy
      @product = Product.find(params[:product_id])
      flash.now.notice = "L'option #{@product_option.name} a été correctment supprimée"
    else
      render_turbo_flashes(:alert, "#{@product_option.errors.messages.keys.first} #{@product_option.errors.messages.values.first.first}")
    end
  end

  private

  def authorize_admin
    authorize %i[admin ProductOption]
  end

  def set_product_option_params
    params.require(:product_option).permit(:name, :product_id)
  end
end