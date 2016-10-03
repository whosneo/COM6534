class Students::PurchasesController < Students::ApplicationController

  before_action :find_consumable

  def new
    @purchase = @consumable.purchases.build
    render layout: false
  end

  def create
    @purchase = @consumable.purchases.build
    if @purchase.update_attributes(purchase_params.merge({ account: current_account }))
      render 'create_success'
    else
      render 'create_failure'
    end
  end

  private

    def find_consumable
      @consumable = Consumable.find(params[:consumable_id])
    end

    def purchase_params
      params.require(:purchase).permit(:amount, :reason)
    end

end