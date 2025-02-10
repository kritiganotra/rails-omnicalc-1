class CalculatorController < ApplicationController

  def home
    render(:template => "home")
  end

  def square
    render(:template => "square")
  end

  def square_results 
    @square_input = params.fetch("user_square")
    @square_result = params.fetch("user_square").to_f * params.fetch("user_square").to_f
    render(:template => "square_results")
  end

  def square_root 
    render(:template => "square_root")
  end

  def square_root_results 
    @squareroot_input = params.fetch("user_squareroot")
    @squareroot_result = Math.sqrt(@squareroot_input.to_f)
    render(:template => "square_root_results")
  end

  def payment
    render(:template => "payment")
  end

  def payment_results
    apr = params.fetch("user_apr").to_f
    years = params.fetch("user_years").to_i
    principal = params.fetch("user_principal").to_f
  
    r =(apr/100.0) / 12
    n = years * 12
    
    if r == 0
      payment = principal.to_f
    else
      payment = (r*principal) / (1 - (1 + r) ** -n)
    end
  
    @formatted_apr = apr.to_fs(:percentage, {:precision => 4})
    @formatted_years = years
    @formatted_principal = principal.to_fs(:currency, { :separator => ".", :delimiter => ",", :precision => 2})
    @formatted_payment = payment.to_fs(:currency, { :precision => 2})
    render(:template => "payment_results")
  end

  def random
    render(:template => "random")
  end

  def random_results
    @min = params.fetch("user_min").to_f
    @max = params.fetch("user_max").to_f
    @rand = rand(@min..@max)
    
    render(:template => "random_results")
  end

end
