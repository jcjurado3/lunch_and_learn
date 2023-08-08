class ErrorUserSerializer
  
  def initialize(message, status, code)
    @message = message
    @code = code
    @status = status
  end

  def serialized_json
    {
  "errors": [
    {
      "status": @status,
      "message": @message,
      "code": @code
    }
  ]
}
  end

end