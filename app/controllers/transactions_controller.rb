class TransactionsController < ApplicationController

	def index

	end	

  def new
    @client_token = Braintree::ClientToken.generate
    #braintree.setup("#{@client_token}", "custom", {id: "my_form"});
  end

  def create    
    @client_token = Braintree::ClientToken.generate
    #braintree.setup("#{@client_token}", "custom", {id: "my_form"});
    @result = Braintree::Transaction.sale(
      amount:"100.00",
      payment_method_nonce: params[:payment_method_nonce]
    )
    if @result.success?
      redirect_to root_path , flash[:notice] = "Congraulations! Your transaction has been successfully!"
    else
      flash[:error] = result.message
      render :new
    end
  end

  private
  
  def generate_client_token
    Braintree::ClientToken.generate
  end
end

  