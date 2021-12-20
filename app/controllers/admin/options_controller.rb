class Admin::OptionsController < AdminController
  before_action :authorize_admin
  before_action :set_option, only: %i[edit update destroy]

  def index; end

  def load_index
    @options = Option.all.order(:name)
    @options = if params[:search_index].blank?
                 Option.order(:name)
               else
                 Option.order(:name).search_by_name(params[:search_index])
               end
    render partial: 'admin/options/partials/load_index'
  end

  def new
    @option = Option.new
  end

  def create
    @option = Option.new(set_option_params)
    if @option.save
      @options = Option.all.order(:name)
      flash.now.notice = "L'attribut #{@option.name} a été correctment créé"
    else
      render_turbo_flashes(:alert, "#{@option.errors.messages.keys.first} #{@option.errors.messages.values.first.first}")
    end
  end

  def edit; end

  def update
    if @option.update(set_option_params)
      @options = Option.order(:name)
      flash.now.notice = "L'attribut #{@option.name} a été correctment édité"
    else
      render_turbo_flashes(:alert, "#{@option.errors.messages.keys.first} #{@option.errors.messages.values.first.first}")
    end
  end

  def destroy
    if @option.destroy
      @options = Option.order(:name)
      flash.now.notice = "L'attribut #{@option.name} a été correctment suppprimé"
    else
      render_turbo_flashes(:alert, "#{@option.errors.messages.keys.first} #{@option.errors.messages.values.first.first}")
    end
  end

  private

  def authorize_admin
    authorize %i[admin Option]
  end

  def set_option_params
    params.require(:option).permit(:name)
  end

  def set_option
    @option = Option.find(params[:id])
  end
end
