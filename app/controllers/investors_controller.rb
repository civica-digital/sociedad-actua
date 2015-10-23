class InvestorsController < ApplicationController
  before_action :investor_params, only: :create
  before_action :authenticate_user!, :except => [:show, :index]

  def new
    if current_user.profile.nil?
      @investor = Investor.new
    else
      redirect_to root_path
      flash[:notice] = "Ya tienes un perfil asociado."
    end
  end

  def create
  	@investor = Investor.new(investor_params)
    @investor.user = current_user
    if @investor.save and current_user.profile.nil?
      flash[:notice] = "Tu información ha sido registrada. ¡Sociedad Actúa será presentado el próximo 4 de noviembre!"
      redirect_to @investor
    else
      render 'new'
    end
  end

  def show
  	@investor = Investor.find(params[:id])
  end

  private
  def investor_params
    params.require(:investor).permit(:name, :type_investor, :mantra, :characteristics, 
                                    :telephone, :email, :address, :zipcode, :city,
                                    :investment_type, :amount, :constitution, :expense_type, 
                                    :neighborhood, :site_url, :facebook_url, :blog_url, :logo)
  end
end
