module ApiError

  class Error < StandardError
    attr_accessor :error

    def initialize(error = nil, message = nil)
      super(message) if message.present?
      @error = error
      @message = message
    end

    def error
      @error
    end

    def status
      :bad_request
    end
  end

  class NotFound < Error
    def error
      @error || 'not_found'
    end

    def status
      :not_found
    end
  end
end