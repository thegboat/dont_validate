require 'rubygems'
require 'bundler/setup'

require 'dont_validate'

class Gimp

  include ActiveModel::Validations

  attr_accessor :gimp_attribute

  validates :gimp_attribute, :presence => true
  validates :gimp_attribute, :format => { :with => /\A[a-zA-Z]+\z/}


end