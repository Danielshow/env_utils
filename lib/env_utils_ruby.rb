# frozen_string_literal: true

require_relative "ruby/version"

module EnvUtilsRuby
  class Error < StandardError; end

  def get_env_var(key, options)
    fallback = ENV["RAILS_ENV"] == "development" ? options[:dev_default] : nil
    fallback ||= options[:default]

    env_value = ENV[key] || fallback

    is_string = env_value.is_a?(String)

    raise Error("key: #{key} is nil") if env_value.nil? && !options[:optional]

    return env_value == "true" if options[:is_boolean] && is_string

    return env_value.split(options[:separator] || ",").collect(&:strip) if options[:is_array] && is_string

    return env_value.to_i if options.is_integer && is_string

    return env.to_f if options.is_float && is_string

    env_value
  end

  def get_string_env(key, options)
    options.merge!({ is_integer: false, is_boolean: false, is_array: false })
    get_env_var(key, options)
  end

  def get_integer_env(key, options)
    options.merge!({ is_integer: true, is_boolean: false, is_array: false })
    get_env_var(key, options)
  end

  def get_float_env(key, options)
    options.merge!({ is_integer: false, is_boolean: false, is_array: false, is_float: true })
    get_env_var(key, options)
  end

  def get_bool_env(key, options)
    options.merge!({ is_integer: false, is_boolean: true, is_array: false })

    get_env_var(key, options)
  end

  def get_array_env(key, options)
    options.merge!({ is_array: true })

    get_env_var(key, options)
  end
end
