module SugarCRM
  class LoginError < RuntimeError
  end

  class EmptyResponse < RuntimeError
  end

  class UnhandledResponse < RuntimeError
  end

  class InvalidSugarCRMUrl < RuntimeError
  end
  
  class InvalidRequest < RuntimeError
  end
end