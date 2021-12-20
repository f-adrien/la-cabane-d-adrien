class Admin::TaxesController < AdminController
  before_action :authorize_admin
  before_action :set_tax, only: %i[edit update destroy]

  def index; end

  def load_index
    @taxes = Tax.all.order(:name)
    @taxes = if params[:search_index].blank?
               Tax.order(:name)
             else
               Tax.order(:name).search_by_name(params[:search_index])
             end
    render partial: 'admin/taxes/partials/load_index'
  end

  def new
    @tax = Tax.new
  end

  def create
    @tax = Tax.new(set_tax_params)
    if @tax.save
      @taxes = Tax.all.order(:name)
      flash.now.notice = "La taxe #{@tax.name} a été correctment créée"
    else
      render_turbo_flashes(:alert, "#{@tax.errors.messages.keys.first} #{@tax.errors.messages.values.first.first}")
    end
  end

  def edit; end

  def update
    if @tax.update(set_tax_params)
      @taxes = Tax.order(:name)
      flash.now.notice = "La taxe #{@tax.name} a été correctment éditée"
    else
      render_turbo_flashes(:alert, "#{@tax.errors.messages.keys.first} #{@tax.errors.messages.values.first.first}")
    end
  end

  def destroy
    if @tax.destroy
      @taxes = Tax.order(:name)
      flash.now.notice = "La taxe #{@tax.name} a été correctment suppprimée"
    else
      render_turbo_flashes(:alert, "#{@tax.errors.messages.keys.first} #{@tax.errors.messages.values.first.first}")
    end
  end

  private

  def authorize_admin
    authorize %i[admin Product]
  end

  def set_tax_params
    params.require(:tax).permit(:name, :rate)
  end

  def set_tax
    @tax = Tax.find(params[:id])
  end
end
