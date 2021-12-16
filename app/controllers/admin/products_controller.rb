class Admin::ProductsController < AdminController
  before_action :authorize_admin
  
  def index; end

  def load_index
    @products = Product.all
  end

  private

  def authorize_admin
    authorize %i[admin Product]
  end
end