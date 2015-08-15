module LolesportsApi
  class Error < StandardError
    attr_reader :code

    def initialize(message = '', code = nil)
      super(message)
      @code = code
    end

    UnauthorizedAccess = Class.new(self)

    InternalServerError = Class.new(self)

    BadGateway = Class.new(self)

    ERRORS = {
      403 => LolesportsApi::Error::UnauthorizedAccess,
      500 => LolesportsApi::Error::InternalServerError,
      502 => LolesportsApi::Error::BadGateway
    }
  end
end
