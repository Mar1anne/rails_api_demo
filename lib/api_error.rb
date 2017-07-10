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
      @error || 'record_not_found'
    end

    def status
      :not_found
    end

    def message
      @message || 'Record not found'
    end
  end

  class InvalidRecord < Error
    def error
      @error || 'invalid_record'
    end

    def message
      @message || 'Invalid record parameters'
    end

    def status
      :unprocessable_entity
    end
  end

end