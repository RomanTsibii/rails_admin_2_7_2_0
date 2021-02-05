class Api::JsonWebToken
  class << self
    def encode(payload, exp = 1.day.from_now)
      payload[:exp] = exp.to_i
      JWT.encode payload, RCreds.fetch(:secret_key_base)
    end

    def decode(token)
      body = JWT.decode(token, RCreds.fetch(:secret_key_base))[0]
      HashWithIndifferentAccess.new body
    rescue StandardError
      nil
    end
  end
end
