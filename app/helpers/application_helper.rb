# frozen_string_literal: true

# module to create some helper method used in the whole project.
module ApplicationHelper
  def flash_class(obj)
    case obj
    when 'alert'
      'alert alert-info'
    when 'error'
      'alert alert-danger'
    else
      'alert alert-success'
    end
  end
end
