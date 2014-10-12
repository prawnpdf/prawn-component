module Prawn
  module Component
    def self.definitions
      @definitions ||= {}
    end

    def self.define(name, component_class=nil,&block)
      if component_class
        definitions[name] =component_class
      else
        definitions[name] = Class.new
        definitions[name].send(:include, Prawn::Component)
        definitions[name].send(:define_method, :draw, &block)
      end
    end

    include Prawn::View

    attr_reader :document, :params

    def initialize(document, params={})
      @document = document
      @params   = params
    end
  end
end

require_relative "component/document_extensions"
Prawn::Document.extensions << Prawn::Component::DocumentExtensions
