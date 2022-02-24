require "env_utils"

RSpec.describe EnvUtils do
  include EnvUtils
  describe ".get_env_var" do
    it "returns nil if the env var is not set" do
      expect(get_env_var("NOT_SET")).to be_nil
    end
  end

  describe ".get_string_env" do
    it "returns right values" do
      ENV["FOO"] = "foo"
      expect(get_string_env("FOO")).to eq("foo")
      expect(get_string_env("FOO", default: "foo")).to eq("foo")
      expect(get_string_env("FOO", dev_default: "foo")).to eq("foo")

      ENV["FOO"] = nil

      expect(get_string_env("FOO")).to be_nil
      expect(get_string_env("FOO", default: "foo")).to eq("foo")

      ENV["RAILS_ENV"] = "development"

      expect(get_string_env("FOO", dev_default: "foo")).to eq("foo")
    end
  end

  describe ".get_integer_env" do
    it "returns right values for integer" do
      ENV["FOO"] = "1"

      expect(get_integer_env("FOO")).to eq(1)
      expect(get_integer_env("FOO", default: 1)).to eq(1)

      ENV["FOO"] = nil

      expect(get_integer_env("FOO")).to be_nil
      expect(get_integer_env("FOO", default: 1)).to eq(1)
    end
  end

  describe ".get_float_env" do
    it "returns right values for float" do
      ENV["FOO"] = "1.1"

      expect(get_float_env("FOO")).to eq(1.1)

      ENV["FOO"] = nil

      expect(get_float_env("FOO")).to be_nil
      expect(get_float_env("FOO", default: 1.1)).to eq(1.1)

      ENV["FOO"] = "ddddd"

      expect(get_float_env("FOO")).to eq(0.0)
    end
  end

  describe ".get_bool_env" do
    it "returns right values for boolean" do
      ENV["FOO"] = "true"
      expect(get_bool_env("FOO")).to eq(true)

      ENV["FOO"] = nil
      expect(get_bool_env("FOO")).to eq(false)
    end
  end

  describe ".get_array_env" do
    it "returns right values for array" do
      ENV["FOO"] = "foo,bar"

      expect(get_array_env("FOO")).to eq(%w[foo bar])

      ENV["FOO"] = nil

      expect(get_array_env("FOO")).to be_nil

      ENV["FOO"] = "foo&bar"

      expect(get_array_env("FOO", { separator: "&" })).to eq(%w[foo bar])
    end
  end

  describe ".get_env_var" do
    it "returns right values for get_env" do
      ENV["FOO"] = "foo"

      expect(get_env_var("FOO")).to eq("foo")
    end
  end
end
