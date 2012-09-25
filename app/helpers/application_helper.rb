module ApplicationHelper
  def hidden_div_if(condition, attributes={}, &block)
    if condition
      attributes["style"] = "display: none"
    end
    content_tag(:div, attributes, &block)
  end

  def reset_index_visits
    session[:counter]=0
  end

  def count_index_visits
    if session[:counter].nil?
      reset_index_visits
    else
      session[:counter]+=1
    end
  end

  def report_index_visits
    if session[:counter]==0 then
      response="Welcome!"
    else
      response="Back for your "+session[:counter].to_s+"th visit?"
    end
    return response
  end
end
