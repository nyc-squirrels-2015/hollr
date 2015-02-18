def add_error(msg)
  if session[:errors]
    session[:errors] << msg
  else 
    session[:errors] = [msg]
  end
end

def display_errors
  errors = session[:errors]
  session[:errors] = nil
  errors.join(', ') if errors
end

def parse_errors(messages)
  messages.each do |err_type, err_messages|
    err_messages.each do |message|
      add_error("#{err_type}: #{message}")
    end
  end
end 