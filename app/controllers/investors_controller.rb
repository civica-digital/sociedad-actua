class InvestorsController < ApplicationController
  before_action :investor_params, only: :create

  def new
  	@investor = Investor.new
  end

  def create
  	@investor = Investor.new(investor_params)
    if @investor.save
      flash[:notice] = "Excelente! Bienvenido #{@investor.type_investor}, este es tu perfil público."
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
                                    :neighborhood, :site_url, :facebook_url, :blog_url)
  end
end
