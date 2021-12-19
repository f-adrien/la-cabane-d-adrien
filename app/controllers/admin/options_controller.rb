class Admin::OptionsController < AdminController
  before_action :authorize_admin

  def index; end

  def load_index
    @options = Option.all.order(:name)
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

  def edit
    @option = Option.find(params[:id])
  end

  def update
    @option = Option.find(params[:id])
    if @option.update(set_option_params)
      @options = Option.all.order(:name)
      flash.now.notice = "L'attribut #{@option.name} a été correctment édité"
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
end
