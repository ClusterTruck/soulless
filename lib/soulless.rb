require 'virtus'
require 'securerandom'
require 'active_support/core_ext/class/attribute'
require 'active_support/core_ext/module/delegation'
require 'active_support/callbacks'
require 'active_support/concern'
require 'active_support/inflector'
require 'active_model/naming'
require 'active_model/translation'
require 'active_model/callbacks'
require 'active_model/validator'
require 'active_model/errors'
require 'active_model/validations'
require 'active_model/conversion'
require 'active_model/version'

require 'soulless/model'
require 'soulless/associations'
require 'soulless/validations/uniqueness_validator'
require 'soulless/version'

module Soulless
  I18n.load_path += Dir.glob('lib/soulless/locale/*.{rb,yml}')
  
  def self.model(options = {})
    mod = Module.new
    mod.define_singleton_method :included do |object|
      object.send(:include, Virtus.model(options))
      object.send(:include, Model)
      object.send(:include, Associations)
      object.send(:include, Validations)
    end
    mod
  end
end
